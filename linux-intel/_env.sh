SYSROOT_NATIVE=$(greadlink -f "../../sysroot-native")

if [ ! `echo ${PATH} | grep x86_64-mobiaqua-linux` ]; then
	export PATH=${SYSROOT_NATIVE}/usr/bin/:${SYSROOT_NATIVE}/usr/bin/x86_64-mobiaqua-linux:${PATH}
fi

export TERMINFO=${SYSROOT_NATIVE}/etc/terminfo
export PKG_CONFIG_PATH=${SYSROOT_NATIVE}/usr/lib/pkgconfig
export HOSTCFLAGS="-I${SYSROOT_NATIVE}/usr/include"
export HOSTLDFLAGS="-lncurses -L${SYSROOT_NATIVE}/usr/lib"
export CROSS_COMPILE=x86_64-mobiaqua-linux-
