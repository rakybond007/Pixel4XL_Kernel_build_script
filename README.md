# Pixel4XL_Kernel_build_script

## build script reference : github.com/GrapheneOS.kernel_google_coral
## 빌드과정 참고 구글 사이트 : https://source.android.com/setup/build/building?hl=ko

## Prepare
### Cross Compiler && Toolchain from AOSP
repo init -u https://android.googlesource.com/platform/manifest -b android-10.0.0_r40
After building AOSP, Set the AOSP path as ROOT_DIR
### Kernel Source && branch
git clone https://android.googlesource.com/kernel/msm
git checkout android-msm-coral-4.14-android10

## 실제 해보기
### 스크립트 실행 순서
make clean -> ./build_defconfig.sh -> ./build.sh
새롭게 빌드하려 할 때 out 디렉토리 지운 다음 하기.
### sys_call_table 주소 얻는법
1. grep "sys_call_table" kernel_dir/out/System.map
2. adb shell 접속, su 모드 -> echo 0 > /proc/sys/kernel/kptr_restrict -> cat /proc/kallsyms | grep sys_call_table
