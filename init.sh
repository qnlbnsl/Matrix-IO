#!/bin/bash

mkdir -p build src
cd build || exit
mkdir -p matrix-creator-hal matrix-creator-init matrixio-kernel-modules matrix-lite-py matrix-creator-openocd xc3sprog
cd ../src || exit

echo "Downloading source code..."

git clone git@github.com:qnlbnsl/matrix-creator-hal.git
git clone git@github.com:qnlbnsl/matrix-creator-init.git
git clone git@github.com:qnlbnsl/matrixio-kernel-modules.git
git clone git@github.com:qnlbnsl/matrix-lite-py.git
git clone git@github.com:qnlbnsl/matrix-creator-openocd.git
git clone git@github.com:qnlbnsl/xc3sprog.git
# git clone https://github.com/msteveb/jimtcl.git
