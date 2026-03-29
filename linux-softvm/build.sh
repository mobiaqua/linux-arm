#!/bin/bash

. _env.sh

make ARCH=arm64 Image -j16
