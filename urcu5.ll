; ModuleID = 'urcu5.c'
source_filename = "urcu5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @will_end_urcu() #0 !dbg !9 {
entry:
  call void (...) @urcu_end(), !dbg !12
  ret void, !dbg !13
}

declare dso_local void @urcu_end(...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !14 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void (...) @urcu_begin(), !dbg !18
  call void (...) @f(), !dbg !19
  call void @will_end_urcu(), !dbg !20
  call void (...) @urcu_end(), !dbg !21
  ret i32 0, !dbg !22
}

declare dso_local void @urcu_begin(...) #1

declare dso_local void @f(...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "urcu5.c", directory: "/home/gamesh411/llvm-dataflow-analysis")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 14.0.0"}
!9 = distinct !DISubprogram(name: "will_end_urcu", scope: !1, file: !1, line: 5, type: !10, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{null}
!12 = !DILocation(line: 6, column: 3, scope: !9)
!13 = !DILocation(line: 7, column: 1, scope: !9)
!14 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 9, type: !15, scopeLine: 9, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DISubroutineType(types: !16)
!16 = !{!17}
!17 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!18 = !DILocation(line: 10, column: 3, scope: !14)
!19 = !DILocation(line: 11, column: 3, scope: !14)
!20 = !DILocation(line: 12, column: 3, scope: !14)
!21 = !DILocation(line: 13, column: 3, scope: !14)
!22 = !DILocation(line: 14, column: 3, scope: !14)
