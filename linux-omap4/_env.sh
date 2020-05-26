toolsroot="${OE_BASE}/build-${DISTRO}/tmp/sysroots/`uname -m`-`uname -s | awk '{print tolower($0)}'`/usr"
sysroot="${OE_BASE}/build-${DISTRO}/tmp/sysroots/armv7a-hf-linux-gnueabi"
if [ ! `echo ${PATH} | grep armv7a-hf/bin` ]; then
	export PATH="${OE_BASE}/oe/bin:${PATH}:${toolsroot}/bin:${toolsroot}/armv7a-hf/bin"
fi
export HOST_INC="-I${toolsroot}/include"
export CROSS_COMPILE=arm-linux-gnueabi-
