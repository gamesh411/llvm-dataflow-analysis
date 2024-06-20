; ModuleID = 'urcu_example2.c'
source_filename = "urcu_example2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = dso_local global i32 0, align 4, !dbg !0
@b = dso_local global i32 0, align 4, !dbg !6

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @c() #0 !dbg !15 {
entry:
  %retval = alloca i32, align 4
  %f = alloca i32, align 4
  %0 = load i32, i32* @a, align 4, !dbg !18
  %tobool = icmp ne i32 %0, 0, !dbg !18
  br i1 %tobool, label %if.then, label %if.end, !dbg !20

if.then:                                          ; preds = %entry
  %call = call i32 (...) @d(), !dbg !21
  store i32 1, i32* %retval, align 4, !dbg !23
  br label %return, !dbg !23

if.end:                                           ; preds = %entry
  %call1 = call i32 (...) @e(), !dbg !24
  call void @llvm.dbg.declare(metadata i32* %f, metadata !25, metadata !DIExpression()), !dbg !26
  store i32 3, i32* %f, align 4, !dbg !26
  br label %while.cond, !dbg !27

while.cond:                                       ; preds = %while.body, %if.end
  %1 = load i32, i32* @a, align 4, !dbg !28
  %tobool2 = icmp ne i32 %1, 0, !dbg !28
  br i1 %tobool2, label %land.rhs, label %land.end, !dbg !29

land.rhs:                                         ; preds = %while.cond
  %2 = load i32, i32* %f, align 4, !dbg !30
  %dec = add nsw i32 %2, -1, !dbg !30
  store i32 %dec, i32* %f, align 4, !dbg !30
  %tobool3 = icmp ne i32 %2, 0, !dbg !31
  %lnot = xor i1 %tobool3, true, !dbg !31
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %3 = phi i1 [ false, %while.cond ], [ %lnot, %land.rhs ], !dbg !32
  br i1 %3, label %while.body, label %while.end, !dbg !27

while.body:                                       ; preds = %land.end
  %4 = load i32, i32* @b, align 4, !dbg !33
  %call4 = call i32 (i32, ...) bitcast (i32 (...)* @g to i32 (i32, ...)*)(i32 %4), !dbg !34
  store i32 %call4, i32* @a, align 4, !dbg !35
  br label %while.cond, !dbg !27, !llvm.loop !36

while.end:                                        ; preds = %land.end
  %5 = load i32, i32* @a, align 4, !dbg !39
  %tobool5 = icmp ne i32 %5, 0, !dbg !39
  br i1 %tobool5, label %if.then6, label %if.end8, !dbg !41

if.then6:                                         ; preds = %while.end
  %call7 = call i32 (...) @d(), !dbg !42
  store i32 1, i32* %retval, align 4, !dbg !44
  br label %return, !dbg !44

if.end8:                                          ; preds = %while.end
  store i32 0, i32* %retval, align 4, !dbg !45
  br label %return, !dbg !45

return:                                           ; preds = %if.end8, %if.then6, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !46
  ret i32 %6, !dbg !46
}

declare dso_local i32 @d(...) #1

declare dso_local i32 @e(...) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare dso_local i32 @g(...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !47 {
entry:
  %call = call i32 @c(), !dbg !48
  ret i32 0, !dbg !49
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 1, type: !8, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 14.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "urcu_example2.c", directory: "/home/gamesh411/llvm-dataflow-analysis")
!4 = !{}
!5 = !{!0, !6}
!6 = !DIGlobalVariableExpression(var: !7, expr: !DIExpression())
!7 = distinct !DIGlobalVariable(name: "b", scope: !2, file: !3, line: 1, type: !8, isLocal: false, isDefinition: true)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 14.0.0"}
!15 = distinct !DISubprogram(name: "c", scope: !3, file: !3, line: 2, type: !16, scopeLine: 2, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!16 = !DISubroutineType(types: !17)
!17 = !{!8}
!18 = !DILocation(line: 3, column: 7, scope: !19)
!19 = distinct !DILexicalBlock(scope: !15, file: !3, line: 3, column: 7)
!20 = !DILocation(line: 3, column: 7, scope: !15)
!21 = !DILocation(line: 4, column: 5, scope: !22)
!22 = distinct !DILexicalBlock(scope: !19, file: !3, line: 3, column: 10)
!23 = !DILocation(line: 5, column: 5, scope: !22)
!24 = !DILocation(line: 7, column: 3, scope: !15)
!25 = !DILocalVariable(name: "f", scope: !15, file: !3, line: 8, type: !8)
!26 = !DILocation(line: 8, column: 7, scope: !15)
!27 = !DILocation(line: 9, column: 3, scope: !15)
!28 = !DILocation(line: 9, column: 10, scope: !15)
!29 = !DILocation(line: 9, column: 12, scope: !15)
!30 = !DILocation(line: 9, column: 17, scope: !15)
!31 = !DILocation(line: 9, column: 15, scope: !15)
!32 = !DILocation(line: 0, scope: !15)
!33 = !DILocation(line: 10, column: 11, scope: !15)
!34 = !DILocation(line: 10, column: 9, scope: !15)
!35 = !DILocation(line: 10, column: 7, scope: !15)
!36 = distinct !{!36, !27, !37, !38}
!37 = !DILocation(line: 10, column: 12, scope: !15)
!38 = !{!"llvm.loop.mustprogress"}
!39 = !DILocation(line: 11, column: 7, scope: !40)
!40 = distinct !DILexicalBlock(scope: !15, file: !3, line: 11, column: 7)
!41 = !DILocation(line: 11, column: 7, scope: !15)
!42 = !DILocation(line: 12, column: 5, scope: !43)
!43 = distinct !DILexicalBlock(scope: !40, file: !3, line: 11, column: 10)
!44 = !DILocation(line: 13, column: 5, scope: !43)
!45 = !DILocation(line: 15, column: 3, scope: !15)
!46 = !DILocation(line: 16, column: 1, scope: !15)
!47 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 17, type: !16, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!48 = !DILocation(line: 17, column: 10, scope: !47)
!49 = !DILocation(line: 17, column: 15, scope: !47)
