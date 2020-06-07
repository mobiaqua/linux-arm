toolsroot="${OE_BASE}/build-${DISTRO}/tmp/sysroots/`uname -m`-`uname -s | awk '{print tolower($0)}'`/usr"
sysroot="${OE_BASE}/build-${DISTRO}/tmp/sysroots/armv7a-hf-linux-gnueabi"
if [ ! `echo ${PATH} | grep armv7a-hf/bin` ]; then
	export PATH="${OE_BASE}/oe/bin:${PATH}:${toolsroot}/bin:${toolsroot}/armv7a-hf/bin"
fi
ssl_cflags=`${toolsroot}/bin/pkg-config --cflags libssl`
ssl_ldflags=`${toolsroot}/bin/pkg-config --libs libssl`
export HOSTCFLAGS="${ssl_cflags} -I${toolsroot}/include"
export HOSTLDFLAGS="${ssl_ldflags} -I${toolsroot}/lib"
export CROSS_COMPILE=arm-linux-gnueabi-
export LOADADDR=0x80008000
export LD_LIBRARY_PATH=${toolsroot}/lib
