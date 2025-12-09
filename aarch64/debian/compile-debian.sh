apt-get install -y git build-essential cmake make python3 libcurl4-openssl-dev ccache

export CC="ccache gcc"
export CXX="ccache g++"
# export CFLAGS="-O3 -march=armv8-a"
# export CXXFLAGS="$CFLAGS"

rm build/ -rf && mkdir ./build && cd ./build && cmake ../../../ && make -j$(nproc)
