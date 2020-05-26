#!/bin/sh

. _env.sh

#export KCFLAGS=-DDEBUG

make ARCH=arm uImage -j4
#make ARCH=arm modules -j4
make ARCH=arm omap3-igep0030.dtb omap4-panda.dtb omap4-panda-es.dtb omap5-igep0050.dtb am57xx-beagle-x15-revb1.dtb
