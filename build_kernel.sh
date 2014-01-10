#!/bin/bash
###############################################################################
#
#                           Kernel Build Script 
#
###############################################################################
##############################################################################
# set toolchain
##############################################################################
# export PATH=$(pwd)/$(your tool chain path)/bin:$PATH
# export CROSS_COMPILE=$(your compiler prefix)
export ARCH=arm
#export PATH=$(pwd)/toolchain/arm-eabi-4.6/bin:$PATH
export PATH=/home/android/CM11/prebuilt/linux-x86/toolchain/linaro-4.7/bin:$PATH
export CROSS_COMPILE=/home/android/CM11/prebuilt/linux-x86/toolchain/linaro-4.7/bin/arm-eabi-

##############################################################################
# make zImage
##############################################################################
mkdir -p ./obj/KERNEL_OBJ/
make O=./obj/KERNEL_OBJ/ im820l_defconfig
make -j4 O=./obj/KERNEL_OBJ/

##############################################################################
# Copy Kernel Image
##############################################################################
cp -f ./obj/KERNEL_OBJ/arch/arm/boot/zImage .
mkdir -p ./modules/
cp -r `find ./obj/KERNEL_OBJ/ -iname '*.ko'` ./modules/
