#!/bin/bash

[ -z "${OE_BASE}" ] && echo "Script require OE_BASE and DISTRO configured by OE environment." && exit 1

echo
echo "Preparing linux sources..."
echo

if [ ! -e linux/Makefile ]; then
	curdir=$PWD
	cd ${OE_BASE}/build-${DISTRO} &&
		source env.source &&
		${OE_BASE}/bb/bin/bitbake linux-omap5 -cclean &&
		${OE_BASE}/bb/bin/bitbake linux-omap5 -cconfigure && {
			cd ${curdir}
			echo
			echo "Copy linux sources..."
			echo
			cp -R ${OE_BASE}/build-${DISTRO}/tmp/work/board-tv-linux-gnueabi/linux-omap5-*/git/ linux/
			cp build.sh clean.sh debug.sh menu.sh _env.sh linux/
			chmod +x linux/*.sh
			echo ;echo "--- Setup done ---"; echo
		}
else
	echo
	echo "Nothing to do..."
	echo
fi

cd linux
