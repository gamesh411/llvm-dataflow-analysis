; ModuleID = '<stdin>'
source_filename = "c/04mergeBuggy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@.str = private unnamed_addr constant [18 x i8] c"/tmp/doesntmatter\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@cond = external dso_local global i32, align 4
@.str.2 = private unnamed_addr constant [12 x i8] c"Marvelous!\0A\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"Spectacular!\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !9 {
entry:
  %call = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !13
  call void @llvm.dbg.value(metadata %struct._IO_FILE* %call, metadata !14, metadata !DIExpression()), !dbg !77
  %0 = load i32, i32* @cond, align 4, !dbg !78
  %tobool = icmp ne i32 %0, 0, !dbg !78
  br i1 %tobool, label %if.then, label %if.else, !dbg !80

if.then:                                          ; preds = %entry
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i64 0, i64 0)), !dbg !81
  br label %if.end, !dbg !83

if.else:                                          ; preds = %entry
  %call2 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !84
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %call, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
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
!1 = !DIFile(filename: "c/04mergeBuggy.c", directory: "/home/gamesh411/llvm-dataflow-analysis/test/filepolicy")
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
!13 = !DILocation(line: 7, column: 19, scope: !9)
!14 = !DILocalVariable(name: "outfile", scope: !9, file: !1, line: 7, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !17, line: 7, baseType: !18)
!17 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "")
!18 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !19, line: 49, size: 1728, elements: !20)
!19 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "")
!20 = !{!21, !22, !25, !26, !27, !28, !29, !30, !31, !32, !33, !34, !35, !38, !40, !41, !42, !46, !48, !50, !54, !57, !59, !62, !65, !66, !68, !72, !73}
!21 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !18, file: !19, line: 51, baseType: !12, size: 32)
!22 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !18, file: !19, line: 54, baseType: !23, size: 64, offset: 64)
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!25 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !18, file: !19, line: 55, baseType: !23, size: 64, offset: 128)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !18, file: !19, line: 56, baseType: !23, size: 64, offset: 192)
!27 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !18, file: !19, line: 57, baseType: !23, size: 64, offset: 256)
!28 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !18, file: !19, line: 58, baseType: !23, size: 64, offset: 320)
!29 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !18, file: !19, line: 59, baseType: !23, size: 64, offset: 384)
!30 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !18, file: !19, line: 60, baseType: !23, size: 64, offset: 448)
!31 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !18, file: !19, line: 61, baseType: !23, size: 64, offset: 512)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !18, file: !19, line: 64, baseType: !23, size: 64, offset: 576)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !18, file: !19, line: 65, baseType: !23, size: 64, offset: 640)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !18, file: !19, line: 66, baseType: !23, size: 64, offset: 704)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !18, file: !19, line: 68, baseType: !36, size: 64, offset: 768)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !19, line: 36, flags: DIFlagFwdDecl)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !18, file: !19, line: 70, baseType: !39, size: 64, offset: 832)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !18, file: !19, line: 72, baseType: !12, size: 32, offset: 896)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !18, file: !19, line: 73, baseType: !12, size: 32, offset: 928)
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !18, file: !19, line: 74, baseType: !43, size: 64, offset: 960)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !44, line: 152, baseType: !45)
!44 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!45 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !18, file: !19, line: 77, baseType: !47, size: 16, offset: 1024)
!47 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!48 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !18, file: !19, line: 78, baseType: !49, size: 8, offset: 1040)
!49 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !18, file: !19, line: 79, baseType: !51, size: 8, offset: 1048)
!51 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 8, elements: !52)
!52 = !{!53}
!53 = !DISubrange(count: 1)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !18, file: !19, line: 81, baseType: !55, size: 64, offset: 1088)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 64)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !19, line: 43, baseType: null)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !18, file: !19, line: 89, baseType: !58, size: 64, offset: 1152)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !44, line: 153, baseType: !45)
!59 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !18, file: !19, line: 91, baseType: !60, size: 64, offset: 1216)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !19, line: 37, flags: DIFlagFwdDecl)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !18, file: !19, line: 92, baseType: !63, size: 64, offset: 1280)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !64, size: 64)
!64 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !19, line: 38, flags: DIFlagFwdDecl)
!65 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !18, file: !19, line: 93, baseType: !39, size: 64, offset: 1344)
!66 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !18, file: !19, line: 94, baseType: !67, size: 64, offset: 1408)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !18, file: !19, line: 95, baseType: !69, size: 64, offset: 1472)
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !70, line: 46, baseType: !71)
!70 = !DIFile(filename: ".local/lib/clang/14.0.0/include/stddef.h", directory: "/home/gamesh411")
!71 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!72 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !18, file: !19, line: 96, baseType: !12, size: 32, offset: 1536)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !18, file: !19, line: 98, baseType: !74, size: 160, offset: 1568)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 160, elements: !75)
!75 = !{!76}
!76 = !DISubrange(count: 20)
!77 = !DILocation(line: 0, scope: !9)
!78 = !DILocation(line: 8, column: 7, scope: !79)
!79 = distinct !DILexicalBlock(scope: !9, file: !1, line: 8, column: 7)
!80 = !DILocation(line: 8, column: 7, scope: !9)
!81 = !DILocation(line: 9, column: 5, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !1, line: 8, column: 13)
!83 = !DILocation(line: 10, column: 3, scope: !82)
!84 = !DILocation(line: 11, column: 5, scope: !85)
!85 = distinct !DILexicalBlock(scope: !79, file: !1, line: 10, column: 10)
!86 = !DILocation(line: 13, column: 3, scope: !9)
!87 = !DILocation(line: 14, column: 3, scope: !9)
