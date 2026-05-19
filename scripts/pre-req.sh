#!/bin/bash

set -e  # Exit on any error

echo "--- Running Prerequisites ---"

# Navigate to project directory
cd "${RVD_PROJ}"

# ── Enable universe repo first (needed for ninja-build, uthash-dev, etc.) ───
echo "--- Enabling universe repository ---"
sudo add-apt-repository -y universe
sudo apt-get update

# ── SVF Dependencies ────────────────────────────────────────────────────────
echo "--- Installing SVF Dependencies ---"
sudo apt-get install -y \
    git \
    cmake ninja-build make \
    gcc g++ \
    python3-pip \
    libtinfo6 libz-dev libzstd-dev \
    zip wget \
    libncurses5-dev
echo "--- Finished Installing SVF Dependencies ---"

# ── GLLVM / General Build Dependencies ──────────────────────────────────────
# NOTE: We do NOT install llvm/clang/libc++ from apt here because:
#   - Ubuntu 22.04 default repos don't carry these under the unversioned names.
#   - The script builds LLVM 7 from source below and uses that instead.
echo "--- Installing Build Dependencies ---"
sudo apt-get install -y \
    libapr1-dev libaprutil1-dev \
    libpcre3-dev \
    uthash-dev \
    binutils-dev \
    libc6-dev

# On Ubuntu 22.04 librt is merged into glibc but the linker symlink may be missing
# This is required for ArduPilot waf configure to find librt
if [ ! -f /usr/lib/x86_64-linux-gnu/librt.so ]; then
    sudo ln -s /usr/lib/x86_64-linux-gnu/librt.so.1 /usr/lib/x86_64-linux-gnu/librt.so
fi
echo "--- Finished Installing Build Dependencies ---"

# ── LLVM 7 Build from Source ─────────────────────────────────────────────────
echo "--- Cloning and Building LLVM 7 ---"
cd "${RVD_PROJ}"

git clone https://github.com/llvm/llvm-project.git
cd llvm-project
git checkout release/7.x

mkdir build
cd build

cmake -G Ninja \
    -DLLVM_BINUTILS_INCDIR="${HOME}/binutils/include" \
    -DLLVM_TARGETS_TO_BUILD="X86;ARM" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="${RVD_PROJ}/llvm-project" \
    -DLLVM_ENABLE_PROJECTS="clang;lld;clang-tools-extra;libcxx;libcxxabi" \
    ../llvm   

ninja -j"$(nproc)"   
sudo ninja install

cd "${RVD_PROJ}"

# Update PATH to use the freshly built LLVM 7
LLVM_DIR="${RVD_PROJ}/llvm-project/bin"
export PATH="${LLVM_DIR}:${PATH}"

# Persist LLVM path across terminal sessions
echo "export PATH=${RVD_PROJ}/llvm-project/bin:\$PATH" >> ${HOME}/.bashrc

# Persist libc++ library path so ardurover and other binaries can find it
echo "export LD_LIBRARY_PATH=${RVD_PROJ}/llvm-project/lib:\$LD_LIBRARY_PATH" >> ${HOME}/.bashrc

source ${HOME}/.bashrc

echo "--- Finished Building LLVM 7 ---"

# ── MAVProxy and pymavlink ───────────────────────────────────────────────────
echo "--- Installing MAVProxy and pymavlink ---"
pip3 install MAVProxy pymavlink opencv-python Pillow

# python3-wxgtk4.0 is required for MAVProxy console and map GUI
sudo apt-get install -y python3-wxgtk4.0

# Persist ~/.local/bin to PATH (pip installs MAVProxy here)
echo "export PATH=\$PATH:\${HOME}/.local/bin" >> ${HOME}/.bashrc
source ${HOME}/.bashrc
echo "--- Finished Installing MAVProxy and pymavlink ---"

# ── AP-GLLVM (Go + gllvm) ───────────────────────────────────────────────────
echo "--- Installing AP-GLLVM ---"
cd "${RVD_PROJ}"
RVDebloater/scripts/dependent/install-ap-gllvm.sh
echo "--- Finished Installing AP-GLLVM ---"

# ── SVF Build ────────────────────────────────────────────────────────────────
echo "--- Building SVF ---"
cd "${RVD_PROJ}/RVDebloater/SVF/"
./build.sh
. ./setup.sh
cd Release-build/
echo "--- Finished Building SVF ---"

# ── ArduPilot Clone ──────────────────────────────────────────────────────────
cd "${RVD_PROJ}"
echo "--- Cloning ArduPilot Repository (Copter-4.6.3) ---"
git clone --branch Copter-4.6.3 --depth 1 \
    https://github.com/ArduPilot/ardupilot.git
cd ardupilot
git submodule update --init --recursive
cd "${RVD_PROJ}"
echo "--- Finished Cloning ArduPilot ---"

# ── PX4 Clone ────────────────────────────────────────────────────────────────
cd "${RVD_PROJ}"
echo "--- Cloning PX4 Repository (v1.16.0) ---"
git clone --branch v1.16.0 --depth 1 \
    https://github.com/PX4/PX4-Autopilot.git
cd PX4-Autopilot
git submodule sync --recursive
git submodule update --init --recursive
bash ./Tools/setup/ubuntu.sh
cd "${RVD_PROJ}"
echo "--- Finished Cloning PX4 ---"

echo "--- Finished Running Prerequisites ---"
