; ModuleID = '<stdin>'
source_filename = "c/01-callahan-86.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"%d, %d, %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"%d, %d, %d, %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @ralph(i32 %a, i32 %b, i32 %c) #0 !dbg !9 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %a.addr, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %b, i32* %b.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %b.addr, metadata !15, metadata !DIExpression()), !dbg !16
  store i32 %c, i32* %c.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %c.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* %a.addr, align 4, !dbg !19
  %1 = load i32, i32* %c.addr, align 4, !dbg !20
  %mul = mul nsw i32 %0, %1, !dbg !21
  %div = sdiv i32 %mul, 2000, !dbg !22
  store i32 %div, i32* %b.addr, align 4, !dbg !23
  %2 = load i32, i32* %a.addr, align 4, !dbg !24
  %3 = load i32, i32* %b.addr, align 4, !dbg !25
  %4 = load i32, i32* %c.addr, align 4, !dbg !26
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i32 %2, i32 %3, i32 %4), !dbg !27
  ret void, !dbg !28
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @joe(i32 %i, i32 %j, i32 %k) #0 !dbg !29 {
entry:
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %o = alloca i32, align 4
  %q = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %i.addr, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 %j, i32* %j.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %j.addr, metadata !32, metadata !DIExpression()), !dbg !33
  store i32 %k, i32* %k.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %k.addr, metadata !34, metadata !DIExpression()), !dbg !35
  call void @llvm.dbg.declare(metadata i32* %l, metadata !36, metadata !DIExpression()), !dbg !37
  %0 = load i32, i32* %k.addr, align 4, !dbg !38
  %mul = mul nsw i32 2, %0, !dbg !39
  store i32 %mul, i32* %l, align 4, !dbg !37
  call void @llvm.dbg.declare(metadata i32* %m, metadata !40, metadata !DIExpression()), !dbg !41
  %1 = load i32, i32* %j.addr, align 4, !dbg !42
  %cmp = icmp eq i32 %1, 100, !dbg !44
  br i1 %cmp, label %if.then, label %if.else, !dbg !45

if.then:                                          ; preds = %entry
  %2 = load i32, i32* %j.addr, align 4, !dbg !46
  %mul1 = mul nsw i32 10, %2, !dbg !48
  store i32 %mul1, i32* %m, align 4, !dbg !49
  br label %if.end, !dbg !50

if.else:                                          ; preds = %entry
  %3 = load i32, i32* %i.addr, align 4, !dbg !51
  store i32 %3, i32* %m, align 4, !dbg !53
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %4 = load i32, i32* %l, align 4, !dbg !54
  %5 = load i32, i32* %m, align 4, !dbg !55
  %6 = load i32, i32* %k.addr, align 4, !dbg !56
  call void @ralph(i32 %4, i32 %5, i32 %6), !dbg !57
  call void @llvm.dbg.declare(metadata i32* %o, metadata !58, metadata !DIExpression()), !dbg !59
  %7 = load i32, i32* %m, align 4, !dbg !60
  %mul2 = mul nsw i32 %7, 2, !dbg !61
  store i32 %mul2, i32* %o, align 4, !dbg !59
  call void @llvm.dbg.declare(metadata i32* %q, metadata !62, metadata !DIExpression()), !dbg !63
  store i32 2, i32* %q, align 4, !dbg !63
  %8 = load i32, i32* %o, align 4, !dbg !64
  %9 = load i32, i32* %q, align 4, !dbg !65
  %10 = load i32, i32* %k.addr, align 4, !dbg !66
  call void @ralph(i32 %8, i32 %9, i32 %10), !dbg !67
  %11 = load i32, i32* %q, align 4, !dbg !68
  %12 = load i32, i32* %m, align 4, !dbg !69
  %13 = load i32, i32* %o, align 4, !dbg !70
  %14 = load i32, i32* %l, align 4, !dbg !71
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i32 %11, i32 %12, i32 %13, i32 %14), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @joe(i32 10, i32 100, i32 1000), !dbg !77
  ret i32 0, !dbg !78
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "c/01-callahan-86.c", directory: "/home/gamesh411/llvm-dataflow-analysis/test/constant-propagation")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 14.0.0"}
!9 = distinct !DISubprogram(name: "ralph", scope: !1, file: !1, line: 5, type: !10, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{null, !12, !12, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !1, line: 5, type: !12)
!14 = !DILocation(line: 5, column: 11, scope: !9)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !1, line: 5, type: !12)
!16 = !DILocation(line: 5, column: 18, scope: !9)
!17 = !DILocalVariable(name: "c", arg: 3, scope: !9, file: !1, line: 5, type: !12)
!18 = !DILocation(line: 5, column: 25, scope: !9)
!19 = !DILocation(line: 6, column: 7, scope: !9)
!20 = !DILocation(line: 6, column: 11, scope: !9)
!21 = !DILocation(line: 6, column: 9, scope: !9)
!22 = !DILocation(line: 6, column: 13, scope: !9)
!23 = !DILocation(line: 6, column: 5, scope: !9)
!24 = !DILocation(line: 7, column: 26, scope: !9)
!25 = !DILocation(line: 7, column: 29, scope: !9)
!26 = !DILocation(line: 7, column: 32, scope: !9)
!27 = !DILocation(line: 7, column: 3, scope: !9)
!28 = !DILocation(line: 8, column: 1, scope: !9)
!29 = distinct !DISubprogram(name: "joe", scope: !1, file: !1, line: 12, type: !10, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!30 = !DILocalVariable(name: "i", arg: 1, scope: !29, file: !1, line: 12, type: !12)
!31 = !DILocation(line: 12, column: 9, scope: !29)
!32 = !DILocalVariable(name: "j", arg: 2, scope: !29, file: !1, line: 12, type: !12)
!33 = !DILocation(line: 12, column: 16, scope: !29)
!34 = !DILocalVariable(name: "k", arg: 3, scope: !29, file: !1, line: 12, type: !12)
!35 = !DILocation(line: 12, column: 23, scope: !29)
!36 = !DILocalVariable(name: "l", scope: !29, file: !1, line: 13, type: !12)
!37 = !DILocation(line: 13, column: 7, scope: !29)
!38 = !DILocation(line: 13, column: 15, scope: !29)
!39 = !DILocation(line: 13, column: 13, scope: !29)
!40 = !DILocalVariable(name: "m", scope: !29, file: !1, line: 14, type: !12)
!41 = !DILocation(line: 14, column: 7, scope: !29)
!42 = !DILocation(line: 15, column: 7, scope: !43)
!43 = distinct !DILexicalBlock(scope: !29, file: !1, line: 15, column: 7)
!44 = !DILocation(line: 15, column: 9, scope: !43)
!45 = !DILocation(line: 15, column: 7, scope: !29)
!46 = !DILocation(line: 16, column: 14, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !1, line: 15, column: 17)
!48 = !DILocation(line: 16, column: 12, scope: !47)
!49 = !DILocation(line: 16, column: 7, scope: !47)
!50 = !DILocation(line: 17, column: 3, scope: !47)
!51 = !DILocation(line: 18, column: 9, scope: !52)
!52 = distinct !DILexicalBlock(scope: !43, file: !1, line: 17, column: 10)
!53 = !DILocation(line: 18, column: 7, scope: !52)
!54 = !DILocation(line: 20, column: 9, scope: !29)
!55 = !DILocation(line: 20, column: 12, scope: !29)
!56 = !DILocation(line: 20, column: 15, scope: !29)
!57 = !DILocation(line: 20, column: 3, scope: !29)
!58 = !DILocalVariable(name: "o", scope: !29, file: !1, line: 21, type: !12)
!59 = !DILocation(line: 21, column: 7, scope: !29)
!60 = !DILocation(line: 21, column: 11, scope: !29)
!61 = !DILocation(line: 21, column: 13, scope: !29)
!62 = !DILocalVariable(name: "q", scope: !29, file: !1, line: 22, type: !12)
!63 = !DILocation(line: 22, column: 7, scope: !29)
!64 = !DILocation(line: 23, column: 9, scope: !29)
!65 = !DILocation(line: 23, column: 12, scope: !29)
!66 = !DILocation(line: 23, column: 15, scope: !29)
!67 = !DILocation(line: 23, column: 3, scope: !29)
!68 = !DILocation(line: 24, column: 30, scope: !29)
!69 = !DILocation(line: 24, column: 33, scope: !29)
!70 = !DILocation(line: 24, column: 36, scope: !29)
!71 = !DILocation(line: 24, column: 39, scope: !29)
!72 = !DILocation(line: 24, column: 3, scope: !29)
!73 = !DILocation(line: 25, column: 1, scope: !29)
!74 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 29, type: !75, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!12}
!77 = !DILocation(line: 30, column: 3, scope: !74)
!78 = !DILocation(line: 31, column: 3, scope: !74)
