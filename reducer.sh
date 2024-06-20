#!/bin/bash

make -C $HOME/llvm-dataflow-analysis/build 2>&1 &&\
clang -g -S -emit-llvm urcu_example2.c -o urcu_example2.ll &&\
$HOME/llvm-dataflow-analysis/build/bin/filepolicy urcu_example2.ll --context-begin=urcu_mb_read_lock --context-end=urcu_mb_read_unlock 2>&1 | grep 'ERROR: AddressSanitizer'
