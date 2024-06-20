; ModuleID = '<stdin>'
source_filename = "c/05mergePhisCorrect.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@cond = external dso_local global i32, align 4
@.str = private unnamed_addr constant [19 x i8] c"/tmp/doesntmatter1\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.2 = private unnamed_addr constant [14 x i8] c"Fascinating!\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"/tmp/doesntmatter2\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"Amazing!\0A\00", align 1
@.str.5 = private unnamed_addr constant [12 x i8] c"Marvelous!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %0 = load i32, i32* @cond, align 4, !dbg !13
  %tobool = icmp ne i32 %0, 0, !dbg !13
  br i1 %tobool, label %if.then, label %if.else, !dbg !15

if.then:                                          ; preds = %entry
  %call = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !16
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, metadata !18, metadata !DIExpression()), !dbg !81
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.2, i64 0, i64 0)), !dbg !82
  br label %if.end, !dbg !83

if.else:                                          ; preds = %entry
  %call2 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call2, metadata !18, metadata !DIExpression()), !dbg !81
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call2, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %outfile.0 = phi %struct._IO_FILE* [ %call, %if.then ], [ %call2, %if.else ], !dbg !87
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %outfile.0, metadata !18, metadata !DIExpression()), !dbg !81
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %outfile.0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.5, i64 0, i64 0)), !dbg !88
  %call5 = call i32 @fclose(%struct._IO_FILE* %outfile.0), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local %struct._IO_FILE* @fopen(i8*, i8*) #2

declare dso_local i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare dso_local i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "c/05mergePhisCorrect.c", directory: "/home/gamesh411/llvm-dataflow-analysis/test/filepolicy")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 14.0.0"}
!9 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !10, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocation(line: 8, column: 7, scope: !14)
!14 = distinct !DILexicalBlock(scope: !9, file: !1, line: 8, column: 7)
!15 = !DILocation(line: 8, column: 7, scope: !9)
!16 = !DILocation(line: 9, column: 15, scope: !17)
!17 = distinct !DILexicalBlock(scope: !14, file: !1, line: 8, column: 13)
!18 = !DILocalVariable(name: "outfile", scope: !9, file: !1, line: 7, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !21, line: 7, baseType: !22)
!21 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!22 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !23, line: 49, size: 1728, elements: !24)
!23 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!24 = !{!25, !26, !29, !30, !31, !32, !33, !34, !35, !36, !37, !38, !39, !42, !44, !45, !46, !50, !52, !54, !58, !61, !63, !66, !69, !70, !72, !76, !77}
!25 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !22, file: !23, line: 51, baseType: !12, size: 32)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !22, file: !23, line: 54, baseType: !27, size: 64, offset: 64)
!27 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 64)
!28 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !22, file: !23, line: 55, baseType: !27, size: 64, offset: 128)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !22, file: !23, line: 56, baseType: !27, size: 64, offset: 192)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !22, file: !23, line: 57, baseType: !27, size: 64, offset: 256)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !22, file: !23, line: 58, baseType: !27, size: 64, offset: 320)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !22, file: !23, line: 59, baseType: !27, size: 64, offset: 384)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !22, file: !23, line: 60, baseType: !27, size: 64, offset: 448)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !22, file: !23, line: 61, baseType: !27, size: 64, offset: 512)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !22, file: !23, line: 64, baseType: !27, size: 64, offset: 576)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !22, file: !23, line: 65, baseType: !27, size: 64, offset: 640)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !22, file: !23, line: 66, baseType: !27, size: 64, offset: 704)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !22, file: !23, line: 68, baseType: !40, size: 64, offset: 768)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !23, line: 36, flags: DIFlagFwdDecl)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !22, file: !23, line: 70, baseType: !43, size: 64, offset: 832)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !22, file: !23, line: 72, baseType: !12, size: 32, offset: 896)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !22, file: !23, line: 73, baseType: !12, size: 32, offset: 928)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !22, file: !23, line: 74, baseType: !47, size: 64, offset: 960)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !48, line: 152, baseType: !49)
!48 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!49 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !22, file: !23, line: 77, baseType: !51, size: 16, offset: 1024)
!51 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !22, file: !23, line: 78, baseType: !53, size: 8, offset: 1040)
!53 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !22, file: !23, line: 79, baseType: !55, size: 8, offset: 1048)
!55 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 8, elements: !56)
!56 = !{!57}
!57 = !DISubrange(count: 1)
!58 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !22, file: !23, line: 81, baseType: !59, size: 64, offset: 1088)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !60, size: 64)
!60 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !23, line: 43, baseType: null)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !22, file: !23, line: 89, baseType: !62, size: 64, offset: 1152)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !48, line: 153, baseType: !49)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !22, file: !23, line: 91, baseType: !64, size: 64, offset: 1216)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !23, line: 37, flags: DIFlagFwdDecl)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !22, file: !23, line: 92, baseType: !67, size: 64, offset: 1280)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !23, line: 38, flags: DIFlagFwdDecl)
!69 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !22, file: !23, line: 93, baseType: !43, size: 64, offset: 1344)
!70 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !22, file: !23, line: 94, baseType: !71, size: 64, offset: 1408)
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !22, file: !23, line: 95, baseType: !73, size: 64, offset: 1472)
!73 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !74, line: 46, baseType: !75)
!74 = !DIFile(filename: ".local/lib/clang/14.0.0/include/stddef.h", directory: "/home/gamesh411")
!75 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!76 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !22, file: !23, line: 96, baseType: !12, size: 32, offset: 1536)
!77 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !22, file: !23, line: 98, baseType: !78, size: 160, offset: 1568)
!78 = !DICompositeType(tag: DW_TAG_array_type, baseType: !28, size: 160, elements: !79)
!79 = !{!80}
!80 = !DISubrange(count: 20)
!81 = !DILocation(line: 0, scope: !9)
!82 = !DILocation(line: 10, column: 5, scope: !17)
!83 = !DILocation(line: 11, column: 3, scope: !17)
!84 = !DILocation(line: 12, column: 15, scope: !85)
!85 = distinct !DILexicalBlock(scope: !14, file: !1, line: 11, column: 10)
!86 = !DILocation(line: 13, column: 5, scope: !85)
!87 = !DILocation(line: 0, scope: !14)
!88 = !DILocation(line: 15, column: 3, scope: !9)
!89 = !DILocation(line: 16, column: 3, scope: !9)
!90 = !DILocation(line: 17, column: 3, scope: !9)
