SYSROOT_NATIVE=$(greadlink -f "../../sysroot-native")

if [ ! `echo ${PATH} | grep arm-mobiaqua-linux-gnueabi` ]; then
	export PATH=${SYSROOT_NATIVE}/usr/bin/:${SYSROOT_NATIVE}/usr/bin/arm-mobiaqua-linux-gnueabi:${PATH}
fi

export TERMINFO=${SYSROOT_NATIVE}/etc/terminfo
export PKG_CONFIG_PATH=${SYSROOT_NATIVE}/usr/lib/pkgconfig
export HOSTCFLAGS="-I${SYSROOT_NATIVE}/usr/include"
export HOSTLDFLAGS="-lncurses -L${SYSROOT_NATIVE}/usr/lib"
export CROSS_COMPILE=arm-mobiaqua-linux-gnueabi-
export LOADADDR=0x80008000
