#!/bin/bash

. _env.sh

make ARCH=arm64 Image -j8
make ARCH=arm64 modules
make ARCH=arm64 ti/k3-j721e-beagleboneai64.dtb
