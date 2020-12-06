SYSROOT_NATIVE=$(greadlink -f "../sysroot-native")

if [ ! `echo ${PATH} | grep arm-mobiaqua-linux-gnueabi` ]; then
	export PATH=${SYSROOT_NATIVE}/usr/bin/:${SYSROOT_NATIVE}/usr/bin/arm-mobiaqua-linux-gnueabi:${PATH}
fi

export HOST_INC="-I${SYSROOT_NATIVE}/usr/include"
export CROSS_COMPILE=arm-mobiaqua-linux-gnueabi-
export LOADADDR=0x80008000
