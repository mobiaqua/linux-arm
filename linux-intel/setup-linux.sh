#!/bin/bash

[ -z "${OE_BASE}" ] && echo "Script require OE_BASE and DISTRO configured by OE environment." && exit 1

echo
echo "Preparing linux sources..."
echo

if [ ! -e linux/Makefile ]; then
	curdir=$PWD
	cd ${OE_BASE}/build-${DISTRO}-${TARGET} &&
		source env.source &&
		${OE_BASE}/bitbake/bin/bitbake linux-intel -cclean &&
		${OE_BASE}/bitbake/bin/bitbake linux-intel -cconfigure && {
			cd ${curdir}
			echo
			echo "Copy linux sources..."
			echo
			cp -R ${OE_BASE}/build-${DISTRO}-${TARGET}/tmp/work-shared/nuc/kernel-source/ linux/
			cp ${OE_BASE}/build-${DISTRO}-${TARGET}/tmp/work-shared/nuc/kernel-source/.kernel-meta/configs/defconfig linux/.config
			cp build.sh clean.sh menu.sh _env.sh linux/
			chmod +x linux/*.sh
			echo ;echo "--- Setup done ---"; echo
		}
else
	echo
	echo "Nothing to do..."
	echo
fi

cd linux
