toolsroot="${OE_BASE}/build-${DISTRO}/tmp/sysroots/`uname -m`-`uname -s | awk '{print tolower($0)}'`/usr"
sysroot="${OE_BASE}/build-${DISTRO}/tmp/sysroots/armv4-linux-gnueabi"
if [ ! `echo ${PATH} | grep armv4/bin` ]; then
	export PATH="${OE_BASE}/oe/bin:${PATH}:${toolsroot}/bin:${toolsroot}/armv4/bin"
fi
export HOST_INC="-I${toolsroot}/include"
export CROSS_COMPILE=arm-linux-gnueabi-
