#!/bin/bash

echo "downlaoding source code"
./init.sh

echo "updating submodules"

dirs=(
  "matrix-creator-hal"
  "matrix-creator-init"
  "matrix-creator-openocd"
  "matrix-lite-py"
  "matrixio-kernel-modules"
  "matrixio-zwave-utils"
  "xc3sprog"
)

for dir in "${dirs[@]}"
do
  echo "updating $dir"
  cd $dir || exit
  git pull origin master
  cd ..
done

echo "done"
