#!/bin/sh

echo
echo "Checking linux-pda prepared..."
echo
curdir=$PWD
cd ${OE_BASE}/build-${DISTRO} && source env.source && ${OE_BASE}/bb/bin/bitbake linux-pda -cconfigure && {
	cd ${curdir}
	if [ ! -e linux-pda-sa1110/Makefile ]; then
		echo
		echo "Copy linux-pda sources..."
		echo
		if [ ! -e ${OE_BASE}/build-${DISTRO}/tmp/work/pda-*-linux-gnueabi/linux-pda-*/linux-*/ ]; then
			echo "Error: linux-pda OE build dir not exist, you must disable INHERIT = \"rm_work\","
			echo "       rebuild linux-pda and try again."
			echo
			exit 1
		fi
		cp -R ${OE_BASE}/build-${DISTRO}/tmp/work/pda-*-linux-gnueabi/linux-pda-*/linux-*/*  linux-pda-sa1110/
		cp ${OE_BASE}/build-${DISTRO}/tmp/work/pda-*-linux-gnueabi/linux-pda-*/linux-*/.config* linux-pda-sa1110/
	fi
	cp _compile.sh _debug.sh _env.sh linux-pda-sa1110/
	chmod +x linux-pda-sa1110/_compile.sh linux-pda-sa1110/_debug.sh
	echo ;echo "--- Setup done ---"; echo
}
