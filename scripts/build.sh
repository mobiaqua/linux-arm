#!/bin/bash

. _env.sh

make ARCH=arm uImage -j8
make ARCH=arm omap4-panda.dtb omap4-panda-es.dtb am57xx-beagle-x15-revc.dtb

