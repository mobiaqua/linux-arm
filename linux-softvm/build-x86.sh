#!/bin/bash

. _env.sh

make ARCH=x86_64 bzImage -j8
make ARCH=x86_64 vmlinux -j8
