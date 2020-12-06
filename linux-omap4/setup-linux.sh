#!/bin/bash

[ -z "${OE_BASE}" ] && echo "Script require OE_BASE, DISTRO and TARGET configured by Yocto environment." && exit 1

echo
echo "Preparing..."
echo

if [ ! -e linux/Makefile ]; then
	curdir=$PWD
	cd ${OE_BASE}/build-${DISTRO}-${TARGET} &&
		source env.source &&
		${OE_BASE}/bitbake/bin/bitbake linux-omap4 -cclean &&
		${OE_BASE}/bitbake/bin/bitbake linux-omap4 -cconfigure && {
			cd ${curdir}
			echo
			echo "Copy linux sources and toolchain..."
			echo
			cp -R ${OE_BASE}/build-${DISTRO}-${TARGET}/tmp/work-shared/board-tv/kernel-source linux/
			cp ${OE_BASE}/build-${DISTRO}-${TARGET}/tmp/work/board_tv-*-linux-gnueabi/linux-omap4/*/*-standard-build/.config* linux/
			cp build.sh clean.sh debug.sh menu.sh _env.sh linux/
			chmod +x linux/*.sh
			cp -R ${OE_BASE}/build-${DISTRO}-${TARGET}/tmp/work/board_tv-*-linux-gnueabi/linux-omap4/*/recipe-sysroot-native sysroot-native/
		} &&
		${OE_BASE}/bitbake/bin/bitbake linux-omap4 -cclean && {
			echo
			echo "--- Setup done ---"
			echo
		}
else
	echo
	echo "Nothing to do..."
	echo
fi

cd linux
