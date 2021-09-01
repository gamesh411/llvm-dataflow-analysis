; ModuleID = 'urcu6.c'
source_filename = "urcu6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = external dso_local global i32, align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @will_end_urcu() #0 !dbg !9 {
entry:
  %0 = load i32, i32* @i, align 4, !dbg !12
  %tobool = icmp ne i32 %0, 0, !dbg !12
  br i1 %tobool, label %if.then, label %if.end, !dbg !14

if.then:                                          ; preds = %entry
  call void (...) @urcu_end(), !dbg !15
  br label %if.end, !dbg !17

if.end:                                           ; preds = %if.then, %entry
  br label %while.cond, !dbg !18

while.cond:                                       ; preds = %while.body, %if.end
  %1 = load i32, i32* @i, align 4, !dbg !19
  %dec = add nsw i32 %1, -1, !dbg !19
  store i32 %dec, i32* @i, align 4, !dbg !19
  %cmp = icmp ne i32 %dec, 0, !dbg !20
  br i1 %cmp, label %while.body, label %while.end, !dbg !18

while.body:                                       ; preds = %while.cond
  call void (...) @urcu_end(), !dbg !21
  br label %while.cond, !dbg !18, !llvm.loop !23

while.end:                                        ; preds = %while.cond
  ret void, !dbg !26
}

declare dso_local void @urcu_end(...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !27 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void (...) @urcu_begin(), !dbg !31
  call void (...) @f(), !dbg !32
  call void @will_end_urcu(), !dbg !33
  call void (...) @urcu_end(), !dbg !34
  ret i32 0, !dbg !35
}

declare dso_local void @urcu_begin(...) #1

declare dso_local void @f(...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "urcu6.c", directory: "/home/gamesh411/llvm-dataflow-analysis")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 14.0.0"}
!9 = distinct !DISubprogram(name: "will_end_urcu", scope: !1, file: !1, line: 7, type: !10, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{null}
!12 = !DILocation(line: 8, column: 7, scope: !13)
!13 = distinct !DILexicalBlock(scope: !9, file: !1, line: 8, column: 7)
!14 = !DILocation(line: 8, column: 7, scope: !9)
!15 = !DILocation(line: 9, column: 5, scope: !16)
!16 = distinct !DILexicalBlock(scope: !13, file: !1, line: 8, column: 10)
!17 = !DILocation(line: 10, column: 3, scope: !16)
!18 = !DILocation(line: 12, column: 3, scope: !9)
!19 = !DILocation(line: 12, column: 10, scope: !9)
!20 = !DILocation(line: 12, column: 14, scope: !9)
!21 = !DILocation(line: 13, column: 5, scope: !22)
!22 = distinct !DILexicalBlock(scope: !9, file: !1, line: 12, column: 20)
!23 = distinct !{!23, !18, !24, !25}
!24 = !DILocation(line: 14, column: 3, scope: !9)
!25 = !{!"llvm.loop.mustprogress"}
!26 = !DILocation(line: 15, column: 1, scope: !9)
!27 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 17, type: !28, scopeLine: 17, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{!30}
!30 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!31 = !DILocation(line: 18, column: 3, scope: !27)
!32 = !DILocation(line: 19, column: 3, scope: !27)
!33 = !DILocation(line: 20, column: 3, scope: !27)
!34 = !DILocation(line: 21, column: 3, scope: !27)
!35 = !DILocation(line: 22, column: 3, scope: !27)
