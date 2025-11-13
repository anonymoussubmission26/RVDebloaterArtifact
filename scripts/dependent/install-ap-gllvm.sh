#!/bin/bash -e

echo "--- Installing AP-GLLVM ---"

# If you would like to install go in another directory change this line
cd ${RVD_PROJ}

# Add go to path
export PATH=${PATH}:/usr/local/go/bin

# If go is not installed we install it
if ! which go >/dev/null 2>&1; then
    echo "--- Installing GO ---"
    # Install go (minimum version: 1.17)
    wget https://golang.org/dl/go1.19.5.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf go1.19.5.linux-amd64.tar.gz # Go is stored /usr/local/go

    # Remove the tar file
    rm go1.19.5.linux-amd64.tar.gz
    echo "--- Finished Installing GO ---"
else
    echo "--- GO Is Already Installed ---"
fi

# Install our version of gllvm
echo "--- Installing AP-GLLVM Binaries With GO ---"
go install github.com/anonymous-submission-25/ap-gllvm/cmd/...@v1.0.5 # GLLVM is stored ${HOME}/go/bin
# go install github.com/SRI-CSL/gllvm/cmd/...@latest # Use for PX4 (run-simulationPX) , now it works only for llvm-14 (export PATH=/usr/lib/llvm-14/bin:$PATH)
echo "--- Finished Installing AP-GLLVM Binaries With GO ---"
# After this command we have the gllvm binaries: gclang, gclang++, get-bc, etc. in ${HOME}/go/bin

echo "--- Finished Installing AP-GLLVM ---"
