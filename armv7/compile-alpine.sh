apk add git build-base cmake make python3 linux-headers curl-dev ccache

export CC="ccache gcc"
export CXX="ccache g++"
# export CFLAGS="-O3 -march=armv7-a -mfpu=neon"
# export CXXFLAGS="$CFLAGS"

rm build/ -rf && mkdir ./build && cd ./build && cmake ../../ && make -j$(nproc)
