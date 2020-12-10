# Pixel4XL_Kernel_build_script

## build script reference : github.com/GrapheneOS.kernel_google_coral

## Prepare
### Cross Compiler && Toolchain from AOSP
repo init -u https://android.googlesource.com/platform/manifest -b android-11.0.0_r17
After building AOSP, Set the AOSP path as ROOT_DIR
### Kernel Source && branch
git clone https://android.googlesource.com/kernel/msm
git checkout android-msm-coral-4.14-android11
### 스크립트 실행 순서
make clean -> ./build_defconfig.sh -> ./build.sh
새롭게 빌드하려 할 때 out 디렉토리 지운 다음 하기.
