#!/bin/sh

. _env.sh

make ARCH=arm uImage -j 4
