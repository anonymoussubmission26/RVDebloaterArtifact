#!/bin/bash

# 
# Script to configure environment for RVDebloater project
#

echo "--- Running Prerequisites ---"

# navigate to project directory
cd ${RVD_PROJ}

# install SVF dependencies
echo "--- Installing SVF Dependencies ---"
sudo apt install cmake gcc g++ libtinfo5 libz-dev libzstd-dev zip wget libncurses5-dev
echo "--- Finished Installing SVF Dependencies ---"

# install GLLVM dependencies
echo "--- Installing GLLVM Dependencies ---"
sudo apt-get install llvm libclang-dev clang libapr1-dev libaprutil1-dev libpcre3-dev make
echo "--- Finished Installing GLLVM Dependencies ---"


# # Check LLVM version and install it if it is not version 16
# echo "--- Checking LLVM Version and Install Version 16 ---"
# LLVM_VERSION=$(llvm-config --version)
# REQUIRED_MAJOR_VERSION="16"

# # Extract major and minor versions from the installed version
# LLVM_MAJOR_VERSION=$(echo "$LLVM_VERSION" | cut -d'.' -f1)

# if [[ "$LLVM_MAJOR_VERSION" != "$REQUIRED_MAJOR_VERSION" ]]; then
#     echo "--- LLVM version is not $REQUIRED_MAJOR_VERSION. Installing LLVM $REQUIRED_MAJOR_VERSION ---"
    
#     # Clone and build LLVM if version is not 16
#     git clone https://github.com/llvm/llvm-project.git
#     cd llvm-project
#     git checkout release/16.x
#     cd ..
#     mkdir llvm-project/build
#     cd llvm-project/build
#     # cmake -G Ninja ../llvm -DLLVM_ENABLE_PROJECTS="tools;clang;compiler-rt"  -DLLVM_TARGETS_TO_BUILD="host"  -DLLVM_ENABLE_ASSERTIONS=ON -DLLVM_ENABLE_RTTI=ON -DLLVM_OPTIMIZED_TABLEGEN=ON -DCMAKE_BUILD_TYPE=Release
#     cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local/llvm-16 ../llvm
#     ninja -j10
#     sudo ninja install
#     export PATH=/usr/local/llvm-16/bin:$PATH

#     # Verify the installation
#     LLVM_VERSION=$(llvm-config --version)
#     echo "Installed LLVM version: $LLVM_VERSION"
# else
#     echo "--- LLVM version is already $REQUIRED_MAJOR_VERSION ---"
# fi
# cd ${RVD_PROJ}

# echo "--- Cloning LLVM Project ---"
# FILE_URL="https://github.com/shamedgh/temporal-specialization/raw/master/llvm-7.0.0.src.wclang.tar.xz"
# DESTINATION_FOLDER=${RVD_PROJ}
# curl -L $FILE_URL -o $DESTINATION_FOLDER/llvm-7.0.0.src.wclang.tar.xz

# # git clone git@github.com:shamedgh/temporal-specialization.git llvm-7.0.0.src.wclang.tar.xz
# tar -Jxvf llvm-7.0.0.src.wclang.tar.xz  
# echo "--- Finished Cloning LLVM Repository ---"

# echo "--- Building LLVM Project ---"
# cd llvm-7.0.0.src/
# mkdir build/
# cd build
# cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=../install ../
# make -j10 
# make install
# echo "--- Finished Building LLVM Project ---"



# Only this part works for llvm 7: (29 Jan, we commented prior wget implementation so that we can have llvm build directory and llvmgold for PX4)
echo "--- Cloning LLVM Project ---"
cd ${RVD_PROJ} 
# wget https://releases.llvm.org/7.0.0/clang+llvm-7.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz
# wget https://releases.llvm.org/7.0.0/llvm-7.0.0.src.tar.xz
# tar -Jxvf clang+llvm-7.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz
# tar -Jxvf llvm-7.0.0.src.tar.xz
# mv ./clang+llvm-7.0.0-x86_64-linux-gnu-ubuntu-16.04 ./llvm-7
# rm clang+llvm-7.0.0-x86_64-linux-gnu-ubuntu-16.04.tar.xz
# rm llvm-7.0.0.src.tar.xz
# cd llvm-7.0.0.src
# mkdir build/
# cd build

# New version: (29 Jan 2025)
git clone https://github.com/llvm/llvm-project.git
cd llvm-project
git checkout release/7.x
cmake -G Ninja \
-DLLVM_BINUTILS_INCDIR=~/binutils/include \
-DLLVM_TARGETS_TO_BUILD="X86;ARM" \
-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INSTALL_PREFIX=../install \
-DLLVM_ENABLE_PROJECTS="clang;lld;clang-tools-extra" \
../llvm-project/llvm
ninja -j10
sudo ninja install  
# LLVM_DIR=${RVD_PROJ}/llvm-7/bin
LLVM_DIR=${RVD_PROJ}/llvm-project/bin
PATH=$LLVM_DIR/:$PATH
echo "--- Finished Building LLVM Project ---"
# End of llvm implementation new version

cd ${RVD_PROJ}

# install AP-GLLVM
# First install Go and then using `go` to install `gllvm`
RVDebloater/scripts/dependent/install-ap-gllvm.sh

# clone SVF
echo "--- Cloning SVF Repository ---"
# git clone https://github.com/SVF-tools/SVF.git
cd ${RVD_PROJ}/RVDebloater/SVF/
./build.sh
. ./setup.sh
cd Release-build/
echo "--- Finished Building SVF ---"


# clone ArduPilot
cd ${RVD_PROJ}
echo "--- Cloning ArduPilot Repository ---"
git clone --recursive https://github.com/ArduPilot/ardupilot.git
echo "--- Finished Cloning Ardupilot ---"


# clone PX4
cd ${RVD_PROJ}
echo "--- Cloning PX4 Repository ---"
git clone https://github.com/PX4/PX4-Autopilot.git --recursive
bash ./PX4-Autopilot/Tools/setup/ubuntu.sh
cd PX4-Autopilot
# git checkout v1.13.3
git submodule sync --recursive
git submodule update --init --recursive
# git clone https://github.com/PX4/Firmware.git --recursive
echo "--- Finished Cloning PX4 ---"


# Configure and Build SVF
# To set `clang` to version `16` used by SVF and also other building
# echo "--- Build and Configure SVF ---"
# cd ${RVD_PROJ}/SVF

# Build SVF
# source ./build.sh # Don't use "source" if you just run this command directly in the terminal 

# Setup SVF and add it to ${PATH}
# . ./setup.sh
# echo "--- Finished Configuring SVF ---"

echo "--- Finished Running Prequisites ---"
