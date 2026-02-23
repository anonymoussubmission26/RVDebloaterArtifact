#!/bin/bash -e

# The following script is to rebuild a local version of ap-gllvm after changes have been made
#
# In order to make local changes to ap-gllvm you must clone the repository first:
#   git clone https://github.com/anonymous-submission-25/ap-gllvm.git
#
# Edit AP_GLLVM_PATH and GLLVM_BIN_DIR to ensure they point to the correct directories
# The default has go/bin and ap-gllvm both in the ${HOME} directory
#
# Then rerun this script everytime you make edits to local ap-gllvm to rebuild and overwrite the binaries

# Set the following variables:
AP_GLLVM_PATH=${HOME}/ap-gllvm # Set this to the location of your cloned ap-gllvm repository
GLLVM_BIN_DIR=${HOME}/go/bin # Set this to the go bin directory containing pre-existing gllvm binaries (gclang, gclang++, get-bc, etc.)
GO=/usr/local/go/bin/go

# Navigate to gclang source directory
cd ${AP_GLLVM_PATH}/cmd/gclang

# Build gclang
echo "--- Building GCLANG ---"
${GO} build
echo "--- GCLANG Built ---"

# Overwrite gclang binary with newly built version
echo "--- Overwriting gclang Binary ---"
cp gclang ${GLLVM_BIN_DIR}
echo "--- GCLANG Binary Overwritten ---"

# Navigate to gclang++ source directory
cd ${AP_GLLVM_PATH}/cmd/gclang++

# Build gclang++
echo "--- Building GCLANG++ ---"
${GO} build
echo "--- GCLANG++ Built ---"

# Overwrite gclang binary with newly built version
echo "--- Overwriting gclang++ Binary ---"
cp gclang++ ${GLLVM_BIN_DIR}
echo "--- GCLANG++ Binary Overwritten ---"
