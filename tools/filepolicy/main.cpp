#include "llvm/IR/CallSite.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/PrettyStackTrace.h"
#include "llvm/Support/Signals.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"
#include <llvm/ADT/Twine.h>
#include <llvm/ADT/SetVector.h>
#include <llvm/ADT/SmallSet.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Value.h>

#include <bitset>
#include <memory>
#include <sstream>
#include <string>
#include <set>

#include "DataflowAnalysis.h"

using namespace llvm;
using std::string;
using std::unique_ptr;

static cl::OptionCategory filePolicyCategory{"file policy options"};


static cl::opt<string> beginContext{"context-begin",
                              cl::desc{"<context-begin>"},
                              cl::value_desc{"name of the funciton that begins a context"},
                              cl::init("urcu_begin"),
                              cl::Optional,
                              cl::cat{filePolicyCategory}};

static cl::opt<string> endContext{"context-end",
                              cl::desc{"<context-end>"},
                              cl::value_desc{"name of the funciton that ends a context"},
                              cl::init("urcu_end"),
                              cl::Optional,
                              cl::cat{filePolicyCategory}};

static cl::opt<string> inPath{cl::Positional,
                              cl::desc{"<Module to analyze>"},
                              cl::value_desc{"bitcode filename"},
                              cl::init(""),
                              cl::Required,
                              cl::cat{filePolicyCategory}};

static const llvm::Function *getCalledFunction(const llvm::CallSite cs) {
  if (!cs.getInstruction()) {
    return nullptr;
  }

  const llvm::Value *called = cs.getCalledValue()->stripPointerCasts();
  return llvm::dyn_cast<llvm::Function>(called);
}

static const llvm::Function *getCalledFunction(const llvm::ImmutableCallSite cs) {
  if (!cs.getInstruction()) {
    return nullptr;
  }

  const llvm::Value *called = cs.getCalledValue()->stripPointerCasts();
  return llvm::dyn_cast<llvm::Function>(called);
}

enum PossibleFileValues { OPEN, CLOSED };

using FileValue = llvm::SmallSetVector<const llvm::Value *, 2>;
using FileState = analysis::AbstractState<FileValue>;
using FileResult = analysis::DataflowResult<FileValue>;

class FilePolicyMeet : public analysis::Meet<FileValue, FilePolicyMeet> {
public:
  FileValue meetPair(FileValue &s1, FileValue &s2) const {
    // merge lists together
    FileValue newValue;
    newValue.insert(s1.begin(), s1.end());
    newValue.insert(s2.begin(), s2.end());
    return newValue;
  }

  void meetFunctionEnter(llvm::CallSite cs, FileState& state) {
     state[nullptr].insert(cs.getInstruction());
     state[nullptr].insert(cs.getCalledFunction()->getEntryBlock().getFirstNonPHI());
  }
  void meetFunctionLeave(llvm::CallSite cs, FileState& state) {
     // state[nullptr].insert(cs.getInstruction());
  }
};

static std::string ParamContextBegin;
static std::string ParamContextEnd;
static std::vector<std::string> InterestingFns;
static std::vector<std::string> EndFns;

static void InitAnalysisParams(const std::string& Begin, const std::string& End) {
  ParamContextBegin = Begin;
  ParamContextEnd = End;
  InterestingFns = {ParamContextBegin, ParamContextEnd};
  EndFns = {ParamContextEnd};
}

class FilePolicyTransfer {
public:
  void operator()(llvm::Value &v, FileState &state) {
    llvm::Value *VPtr = &v;
    if (!state.count(VPtr)) { state[VPtr] = {}; }
    const ImmutableCallSite cs{VPtr};
    const auto *fun = getCalledFunction(cs);
    // Pretend that indirect calls & non calls don't exist for this analysis
    if (!fun)
      return;

    if (llvm::is_contained(InterestingFns, fun->getName()))
      state[nullptr].insert(VPtr);
    if (llvm::is_contained(EndFns, fun->getName()))
      state[VPtr] = state[nullptr];
  }
};

template <typename OutIterator>
static void collectFileUseBugs(FileResult &fileStates, OutIterator errors) {
  for (auto &[value, localState] : fileStates) {
    auto *inst = llvm::dyn_cast<llvm::Instruction>(value);
    if (!inst) {
      continue;
    }

    llvm::CallSite cs{inst};
    auto *fun = getCalledFunction(cs);
    if (!fun) {
      continue;
    }

    // Check the incoming state for errors
    if (fun->getName() == ParamContextEnd) {
      // auto& state = analysis::getIncomingState(fileStates, *inst);
      *errors++ = std::make_pair(inst, localState[value]);
    }
  }
}

static std::string toLocationString(const llvm::Instruction &value) {
  if (const llvm::DILocation *debugLoc = value.getDebugLoc()) {
    std::stringstream ss;
    ss << debugLoc->getFilename().str() << "@" << debugLoc->getLine() << ":"
       << debugLoc->getColumn();
    return ss.str();
  } else {
    return "unkown@-1:-1";
  }
}

static void
printErrors(ArrayRef<std::pair<llvm::Instruction *, FileValue>>
                errors) {
  llvm::outs() << "[\n";
  // Current ending instruction == errors[i].first
  for (unsigned i = 0; i < errors.size(); ++i) {
    auto &[closingInst, instList] = errors[i];

    if (i != 0)
      llvm::outs() << ",\n";

    llvm::outs() << "  [\n";
    // For all begins which precede the current ending, generate a list

    auto closingInstIt = llvm::find(instList, closingInst);
    assert(closingInstIt != instList.end());

    auto printRanges = [&](unsigned fromIdx, unsigned toIdx) {

      unsigned printCount = 0u;
      for (unsigned idx = fromIdx; idx <= toIdx; ++idx) {

        const ImmutableCallSite cs{instList[idx]};
        const auto *fun = getCalledFunction(cs);
        // skip intermittent begins
        if (idx != fromIdx && fun && fun->getName() == ParamContextBegin) continue;
        // skip intermittent ends
        if (idx != toIdx   && fun && fun->getName() == ParamContextEnd) continue;


        auto *instI = dyn_cast<llvm::Instruction>(instList[idx]);
        assert(instI);

        if (printCount % 2 == 0) {
          if (printCount != 0) {
            llvm::outs() << ",\n";
          }

          llvm::outs() << "    {\n      \"begin\":\"";
          llvm::outs() << toLocationString(*instI);
          llvm::outs() << "\",\n";
        } else {
          llvm::outs() << "      \"end\":\"";
          llvm::outs() << toLocationString(*instI);
          llvm::outs() << "\"\n    }";

        }

        ++printCount;
      }

      if ((printCount) % 2 == 1) {
          auto *instI = dyn_cast<llvm::Instruction>(instList[toIdx]);
          assert(instI);
          llvm::outs() << "      \"end\":\"";
          llvm::outs() << toLocationString(*instI);
          llvm::outs() << "\"\n    }";
      }
    };

    bool firstPrint = true;
    for (auto beginFinderIt = instList.begin(); beginFinderIt != closingInstIt; ++beginFinderIt) {
       const ImmutableCallSite cs{*beginFinderIt};
       const auto *fun = getCalledFunction(cs);
       if (fun && fun->getName() == ParamContextBegin) {
         if (!firstPrint)
            llvm::outs() << ",\n";
         firstPrint = false;
         unsigned beginIdx = std::distance(instList.begin(), beginFinderIt);
         unsigned endIdx = std::distance(instList.begin(), closingInstIt);
         assert(beginIdx < endIdx);
         printRanges(beginIdx, endIdx);
       }
    }

    llvm::outs() << "\n  ]";
  }
  llvm::outs() << "\n]\n";
}

static std::string StaticContextBegin{};

int main(int argc, char **argv) {
  // This boilerplate provides convenient stack traces and clean LLVM exit
  // handling. It also initializes the built in support for convenient
  // command line option handling.
  sys::PrintStackTraceOnErrorSignal(argv[0]);
  llvm::PrettyStackTraceProgram X(argc, argv);
  llvm_shutdown_obj shutdown;
  cl::HideUnrelatedOptions(filePolicyCategory);
  cl::ParseCommandLineOptions(argc, argv);

  InitAnalysisParams(beginContext.getValue(), endContext.getValue());

  // Construct an IR file from the filename passed on the command line.
  SMDiagnostic err;
  LLVMContext context;
  StaticContextBegin = beginContext.getValue();
  unique_ptr<Module> module = parseIRFile(inPath.getValue(), err, context);

  if (!module.get()) {
    errs() << "Error reading bitcode file: " << inPath << "\n";
    err.print(argv[0], errs());
    return -1;
  }

  auto *mainFunction = module->getFunction("main");
  if (!mainFunction) {
    llvm::report_fatal_error("Unable to find main function.");
  }

  using Value = FileValue;
  using Transfer = FilePolicyTransfer;
  using Meet = FilePolicyMeet;
  using Analysis = analysis::DataflowAnalysis<Value, Transfer, Meet>;
  Analysis analysis{*module, mainFunction};
  auto results = analysis.computeDataflow();

  std::vector<std::pair<llvm::Instruction *, FileValue>> errors;
  for (auto &[context, contextResults] : results) {
    for (auto &[function, functionResults] : contextResults) {
      collectFileUseBugs(functionResults, std::back_inserter(errors));
    }
  }

  printErrors(errors);

  return 0;
}

