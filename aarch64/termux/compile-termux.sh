#!/data/data/com.termux/files/usr/bin/bash
# compile-termux.sh — Equivalente al compile-debian.sh pero para Termux nativo

set -euo pipefail

LLAMA_DIR="${LLAMA_DIR:-$HOME/llama.cpp}"
JOBS="${JOBS:-3}"   # 3 hilos: térmicamente sostenible en tu P40 Lite

if [ ! -d "$LLAMA_DIR" ]; then
    echo "ERROR: no existe $LLAMA_DIR" >&2
    echo "Clona primero: git clone --depth 1 https://github.com/ggml-org/llama.cpp.git ~/llama.cpp" >&2
    exit 1
fi
cd "$LLAMA_DIR"

# Dependencias (equivalente a apt-get install, pero con pkg de Termux)
pkg install -y git cmake make python clang ccache curl libandroid-spawn

export CC="ccache clang"
export CXX="ccache clang++"

# Wakelock: imprescindible en Android para que no te maten la compilación
termux-wake-lock 2>/dev/null || true
trap 'termux-wake-unlock 2>/dev/null || true' EXIT

rm -rf build && mkdir build && cd build
cmake .. \
  -DCMAKE_BUILD_TYPE=Release \
  -DGGML_BACKEND_DL=OFF \
  -DGGML_NATIVE=ON \
  -DLLAMA_CURL=ON
make -j"$JOBS"

echo
echo "Binarios en: $(pwd)/bin/"
