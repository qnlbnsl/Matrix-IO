#!/bin/bash

echo "starting builds"
current_dir=$(pwd)

# Building JimTCL | Required for openocd | DEPRECATED
# echo "Building JimTCL..."
# cd "$current_dir"/jimtcl || exit
# ./configure
# make
function clean($path) {
    rm $path/*.buildinfo
    rm $path/*.changes
    rm $path/*.build
}
function move_files($slug) {

}
# XC3SPORG
echo "Building xc3sprog..."
cd "$current_dir"/xc3sprog || exit
debuild -us -uc -b
echo "xc3sprog built"
mv matrixio-xc3sprog* "$current_dir"/../../build/xc3sprog/


# Matrix OpenOCD
# echo "Building matrix-creator-openocd..."
# cd "$current_dir"/matrix-creator-openocd || exit
# ./bootstrap && ./configure
# debuild -us -uc -b
# echo "matrix-creator-openocd built"
# mv matrix-creator-* "$current_dir"/../../build/matrix-creator-openocd/

# Matrix Creator Init
echo "Building matrix-creator-init..."
cd "$current_dir"/matrix-creator-init || exit
debuild -us -uc -b
echo "matrix-creator-init built"
mv matrix-creator-* "$current_dir"/../../build/matrix-creator-init/

# Matrix Creator HAL
echo "Building matrix-creator-hal..."
cd "$current_dir"/matrix-creator-hal || exit
debuild -us -uc -b
echo "matrix-creator-hal built"
mv matrix-creator-* "$current_dir"/../../build/matrix-creator-hal/

# Matrix Creator Kernel Modules
echo "Building matrixio-kernel-modules..."
cd "$current_dir"/matrixio-kernel-modules || exit
debuild -us -uc -b
echo "matrixio-kernel-modules built"
mv matrixio-kernel-* "$current_dir"/../../build/matrixio-kernel-modules/
