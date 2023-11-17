#!/bin/bash

echo "starting builds"
PWD=$(pwd)

# Building JimTCL
echo "Building JimTCL..."
cd "$PWD"/src/jimtcl || exit
./configure
make

# XC3SPORG
echo "Building xc3sprog..."
cd "$PWD"/src/xc3sprog || exit
debuild -us -uc -b
echo "xc3sprog built"
mv ../matrixio-xc3sprog* "$PWD"/build/xc3sprog/

# Matrix OpenOCD
echo "Building matrix-creator-openocd..."
cd "$PWD"/src/matrix-creator-openocd || exit
./bootstrap && ./configure
debuild -us -uc -b
echo "matrix-creator-openocd built"
mv ../matrix-creator-* "$PWD"/build/matrix-creator-openocd/

# Matrix Creator Init
echo "Building matrix-creator-init..."
cd "$PWD"/src/matrix-creator-init || exit
debuild -us -uc -b
echo "matrix-creator-init built"
mv ../matrix-creator-* "$PWD"/build/matrix-creator-init/

# Matrix Creator HAL
echo "Building matrix-creator-hal..."
cd "$PWD"/src/matrix-creator-hal || exit
debuild -us -uc -b
echo "matrix-creator-hal built"
mv ../matrix-creator-* "$PWD"/build/matrix-creator-hal/

# Matrix Creator Kernel Modules
echo "Building matrixio-kernel-modules..."
cd "$PWD"/src/matrixio-kernel-modules || exit
debuild -us -uc -b
echo "matrixio-kernel-modules built"
mv ../matrixio-kernel-* "$PWD"/build/matrixio-kernel-modules/
