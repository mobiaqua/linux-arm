#!/bin/bash

. _env.sh

make ARCH=arm zImage -j8
make ARCH=arm intel/socfpga/socfpga_cyclone5_de10_nano.dtb
