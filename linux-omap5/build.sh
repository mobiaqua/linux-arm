#!/bin/bash

. _env.sh

#export KCFLAGS=-DDEBUG

make ARCH=arm uImage -j4
#make ARCH=arm modules -j4
make ARCH=arm omap5-igep0050.dtb
