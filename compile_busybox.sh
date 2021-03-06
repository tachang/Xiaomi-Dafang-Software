#!/usr/bin/env bash
TOOLCHAIN=$(pwd)/mips-gcc472-glibc216-64bit/bin
CROSS_COMPILE=$TOOLCHAIN/mips-linux-gnu-
export CC=${CROSS_COMPILE}gcc
export LD=${CROSS_COMPILE}ld
export CFLAGS="-muclibc -O2"
export CPPFLAGS="-muclibc -O2"
export LDFLAGS="-muclibc -O2"

if [ ! -d busybox/.git ]
then
  git clone http://git.busybox.net/busybox/
fi

cd busybox/
make clean
make CROSS_COMPILE=$CROSS_COMPILE defconfig
#Remove some packages that doesn't compile
sed -e 's/CONFIG_FALLOCATE=y/CONFIG_FALLOCATE=n/' -i .config
sed -e 's/CONFIG_NSENTER=y/CONFIG_NSENTER=n/' -i .config
sed -e 's/CONFIG_FSYNC=y/CONFIG_FSYNC=n/' -i .config
sed -e 's/CONFIG_SYNC=y/CONFIG_SYNC=n/' -i .config
make CROSS_COMPILE=$CROSS_COMPILE
