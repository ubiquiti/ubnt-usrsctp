OS_VERSION=16
OS_ARCH=armeabi-v7a
NDK_ARCH_COMPILER=armv7a-linux-androideabi
NDK_ROOT_PATH=$(dirname $(which ndk-build))
NDK_HOST_NAME=$(basename $(dirname $(dirname $(realpath $(ndk-which --abi ${OS_ARCH} ar)))))
NDK_COMPILER_BASE=${NDK_ROOT_PATH}/toolchains/llvm/prebuilt/${NDK_HOST_NAME}/bin/${NDK_ARCH_COMPILER}${OS_VERSION}-
export LIBUSRSCTP_CUSTOM_CONFIGURE="--host=${NDK_ARCH_COMPILER} --enable-static --disable-shared --disable-programs"
export CFLAGS="-fPIC"
export CC=${NDK_COMPILER_BASE}clang
export CXX=${NDK_COMPILER_BASE}clang++
export LINK=${CXX}
export LD=$(realpath $(ndk-which --abi ${OS_ARCH} ld))
export AR=$(realpath $(ndk-which --abi ${OS_ARCH} ar))
export RANLIB=$(realpath $(ndk-which --abi ${OS_ARCH} ranlib))
export STRIP=$(realpath $(ndk-which --abi ${OS_ARCH} strip))



(git clean -dxff ./ \
    && mkdir m4 \
	&& touch NEWS README AUTHORS ChangeLog INSTALL COPYING \
	&& autoreconf -vfi \
)


./configure --disable-programs --enable-shared=no --disable-debug --prefix="/tmp/bla" ${LIBUSRSCTP_CUSTOM_CONFIGURE}

make

# /Users/shiretu/Library/Android/sdk/ndk-bundle/toolchains/llvm/prebuilt/darwin-x86_64/sysroot/usr/include/ifaddrs.h