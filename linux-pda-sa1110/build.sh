#!/bin/bash

. _env.sh

#export KCFLAGS=-DDEBUG

make ARCH=arm uImage -j4
