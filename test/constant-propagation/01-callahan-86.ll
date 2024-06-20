; ModuleID = 'll/01-callahan-86.ll'
source_filename = "c/01-callahan-86.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"%d, %d, %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"%d, %d, %d, %d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @ralph(i32 %0, i32 %1, i32 %2) #0 !dbg !7 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !15, metadata !DIExpression()), !dbg !16
  %7 = load i32, i32* %4, align 4, !dbg !17
  %8 = load i32, i32* %6, align 4, !dbg !18
  %9 = mul nsw i32 %7, %8, !dbg !19
  %10 = sdiv i32 %9, 2000, !dbg !20
  store i32 %10, i32* %5, align 4, !dbg !21
  %11 = load i32, i32* %4, align 4, !dbg !22
  %12 = load i32, i32* %5, align 4, !dbg !23
  %13 = load i32, i32* %6, align 4, !dbg !24
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i32 %11, i32 %12, i32 %13), !dbg !25
  ret void, !dbg !26
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @joe(i32 %0, i32 %1, i32 %2) #0 !dbg !27 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !28, metadata !DIExpression()), !dbg !29
  store i32 %1, i32* %5, align 4
  call void @llvm.dbg.declare(metadata i32* %5, metadata !30, metadata !DIExpression()), !dbg !31
  store i32 %2, i32* %6, align 4
  call void @llvm.dbg.declare(metadata i32* %6, metadata !32, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %7, metadata !34, metadata !DIExpression()), !dbg !35
  %11 = load i32, i32* %6, align 4, !dbg !36
  %12 = mul nsw i32 2, %11, !dbg !37
  store i32 %12, i32* %7, align 4, !dbg !35
  call void @llvm.dbg.declare(metadata i32* %8, metadata !38, metadata !DIExpression()), !dbg !39
  %13 = load i32, i32* %5, align 4, !dbg !40
  %14 = icmp eq i32 %13, 100, !dbg !42
  br i1 %14, label %15, label %18, !dbg !43

15:                                               ; preds = %3
  %16 = load i32, i32* %5, align 4, !dbg !44
  %17 = mul nsw i32 10, %16, !dbg !46
  store i32 %17, i32* %8, align 4, !dbg !47
  br label %20, !dbg !48

18:                                               ; preds = %3
  %19 = load i32, i32* %4, align 4, !dbg !49
  store i32 %19, i32* %8, align 4, !dbg !51
  br label %20

20:                                               ; preds = %18, %15
  %21 = load i32, i32* %7, align 4, !dbg !52
  %22 = load i32, i32* %8, align 4, !dbg !53
  %23 = load i32, i32* %6, align 4, !dbg !54
  call void @ralph(i32 %21, i32 %22, i32 %23), !dbg !55
  call void @llvm.dbg.declare(metadata i32* %9, metadata !56, metadata !DIExpression()), !dbg !57
  %24 = load i32, i32* %8, align 4, !dbg !58
  %25 = mul nsw i32 %24, 2, !dbg !59
  store i32 %25, i32* %9, align 4, !dbg !57
  call void @llvm.dbg.declare(metadata i32* %10, metadata !60, metadata !DIExpression()), !dbg !61
  store i32 2, i32* %10, align 4, !dbg !61
  %26 = load i32, i32* %9, align 4, !dbg !62
  %27 = load i32, i32* %10, align 4, !dbg !63
  %28 = load i32, i32* %6, align 4, !dbg !64
  call void @ralph(i32 %26, i32 %27, i32 %28), !dbg !65
  %29 = load i32, i32* %10, align 4, !dbg !66
  %30 = load i32, i32* %8, align 4, !dbg !67
  %31 = load i32, i32* %9, align 4, !dbg !68
  %32 = load i32, i32* %7, align 4, !dbg !69
  %33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i32 %29, i32 %30, i32 %31, i32 %32), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !72 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  call void @joe(i32 10, i32 100, i32 1000), !dbg !75
  ret i32 0, !dbg !76
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.0-4ubuntu1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "c/01-callahan-86.c", directory: "/home/gamesh411/llvm-dataflow-analysis/test/constant-propagation")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.0-4ubuntu1 "}
!7 = distinct !DISubprogram(name: "ralph", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null, !10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 5, type: !10)
!12 = !DILocation(line: 5, column: 11, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 5, type: !10)
!14 = !DILocation(line: 5, column: 18, scope: !7)
!15 = !DILocalVariable(name: "c", arg: 3, scope: !7, file: !1, line: 5, type: !10)
!16 = !DILocation(line: 5, column: 25, scope: !7)
!17 = !DILocation(line: 6, column: 7, scope: !7)
!18 = !DILocation(line: 6, column: 11, scope: !7)
!19 = !DILocation(line: 6, column: 9, scope: !7)
!20 = !DILocation(line: 6, column: 13, scope: !7)
!21 = !DILocation(line: 6, column: 5, scope: !7)
!22 = !DILocation(line: 7, column: 26, scope: !7)
!23 = !DILocation(line: 7, column: 29, scope: !7)
!24 = !DILocation(line: 7, column: 32, scope: !7)
!25 = !DILocation(line: 7, column: 3, scope: !7)
!26 = !DILocation(line: 8, column: 1, scope: !7)
!27 = distinct !DISubprogram(name: "joe", scope: !1, file: !1, line: 12, type: !8, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DILocalVariable(name: "i", arg: 1, scope: !27, file: !1, line: 12, type: !10)
!29 = !DILocation(line: 12, column: 9, scope: !27)
!30 = !DILocalVariable(name: "j", arg: 2, scope: !27, file: !1, line: 12, type: !10)
!31 = !DILocation(line: 12, column: 16, scope: !27)
!32 = !DILocalVariable(name: "k", arg: 3, scope: !27, file: !1, line: 12, type: !10)
!33 = !DILocation(line: 12, column: 23, scope: !27)
!34 = !DILocalVariable(name: "l", scope: !27, file: !1, line: 13, type: !10)
!35 = !DILocation(line: 13, column: 7, scope: !27)
!36 = !DILocation(line: 13, column: 15, scope: !27)
!37 = !DILocation(line: 13, column: 13, scope: !27)
!38 = !DILocalVariable(name: "m", scope: !27, file: !1, line: 14, type: !10)
!39 = !DILocation(line: 14, column: 7, scope: !27)
!40 = !DILocation(line: 15, column: 7, scope: !41)
!41 = distinct !DILexicalBlock(scope: !27, file: !1, line: 15, column: 7)
!42 = !DILocation(line: 15, column: 9, scope: !41)
!43 = !DILocation(line: 15, column: 7, scope: !27)
!44 = !DILocation(line: 16, column: 14, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !1, line: 15, column: 17)
!46 = !DILocation(line: 16, column: 12, scope: !45)
!47 = !DILocation(line: 16, column: 7, scope: !45)
!48 = !DILocation(line: 17, column: 3, scope: !45)
!49 = !DILocation(line: 18, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !41, file: !1, line: 17, column: 10)
!51 = !DILocation(line: 18, column: 7, scope: !50)
!52 = !DILocation(line: 20, column: 9, scope: !27)
!53 = !DILocation(line: 20, column: 12, scope: !27)
!54 = !DILocation(line: 20, column: 15, scope: !27)
!55 = !DILocation(line: 20, column: 3, scope: !27)
!56 = !DILocalVariable(name: "o", scope: !27, file: !1, line: 21, type: !10)
!57 = !DILocation(line: 21, column: 7, scope: !27)
!58 = !DILocation(line: 21, column: 11, scope: !27)
!59 = !DILocation(line: 21, column: 13, scope: !27)
!60 = !DILocalVariable(name: "q", scope: !27, file: !1, line: 22, type: !10)
!61 = !DILocation(line: 22, column: 7, scope: !27)
!62 = !DILocation(line: 23, column: 9, scope: !27)
!63 = !DILocation(line: 23, column: 12, scope: !27)
!64 = !DILocation(line: 23, column: 15, scope: !27)
!65 = !DILocation(line: 23, column: 3, scope: !27)
!66 = !DILocation(line: 24, column: 30, scope: !27)
!67 = !DILocation(line: 24, column: 33, scope: !27)
!68 = !DILocation(line: 24, column: 36, scope: !27)
!69 = !DILocation(line: 24, column: 39, scope: !27)
!70 = !DILocation(line: 24, column: 3, scope: !27)
!71 = !DILocation(line: 25, column: 1, scope: !27)
!72 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 29, type: !73, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!10}
!75 = !DILocation(line: 30, column: 3, scope: !72)
!76 = !DILocation(line: 31, column: 3, scope: !72)
