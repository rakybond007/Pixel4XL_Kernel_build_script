#!/bin/bash

[[ $# -eq 0 ]] || exit 1

ROOT_DIR=/hdd_ext/hdd3000/bin

export KBUILD_BUILD_VERSION=1
export KBUILD_BUILD_USER=grapheneos
export KBUILD_BUILD_HOST=grapheneos
export KBUILD_BUILD_TIMESTAMP="$(date -d "@$(git --no-pager show -s --format=%ct)")"

PATH="$ROOT_DIR/prebuilts/build-tools/linux-x86/bin:$PATH"
PATH="$ROOT_DIR/prebuilts/build-tools/path/linux-x86:$PATH"
PATH="$ROOT_DIR/prebuilts/gcc/linux-x86/aarch64/aarch64-linux-android-4.9/bin:$PATH"
PATH="$ROOT_DIR/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin:$PATH"
PATH="$ROOT_DIR/prebuilts/clang/host/linux-x86/clang-r383902/bin:$PATH"
PATH="$ROOT_DIR/prebuilts/misc/linux-x86/lz4:$PATH"
PATH="$ROOT_DIR/prebuilts/misc/linux-x86/dtc:$PATH"
PATH="$ROOT_DIR/prebuilts/misc/linux-x86/libufdt:$PATH"
export LD_LIBRARY_PATH="$ROOT_DIR/prebuilts/clang/host/linux-x86/clang-r383902/bin:$LD_LIBRARY_PATH"
export DTC_EXT="$ROOT_DIR/prebuilts/misc/linux-x86/dtc/dtc"
export DTC_OVERLAY_TEST_EXT="$ROOT_DIR/prebuilts/misc/linux-x86/libufdt/ufdt_apply_overlay"

chrt -bp 0 $$

make -j4 \
    O=out \
    ARCH=arm64 \
    CC=clang \
    LD=ld.lld \
    AR=llvm-ar \
    NM=llvm-nm \
    OBJCOPY=llvm-objcopy \
    OBJDUMP=llvm-objdump \
    STRIP=llvm-strip \
    HOSTCC=clang \
    HOSTCXX=clang++ \
    CLANG_TRIPLE=aarch64-linux-gnu- \
    CROSS_COMPILE=aarch64-linux-android- \
    CROSS_COMPILE_ARM32=arm-linux-androideabi-
