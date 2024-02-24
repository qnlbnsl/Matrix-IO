# Matrix-IO

Master repo to manage matrixio modules

This repository contains the following submodules:

1. [matrixio-creator-hal](https://github.com/qnlbnsl/matrixio-creator-hal)
2. [matrix-creator-init](https://github.com/qnlbnsl/matrix-creator-init)
3. [matrixio-creator-openocd](https://github.com/qnlbnsl/matrix-creator-openocd)
4. [matrix-lite-py](https://github.com/qnlbnsl/matrix-lite-py)
5. [matrixio-kernel-modules](https://github.com/qnlbnsl/matrixio-kernel-modules)
6. [matrixio-zwave-utils](https://github.com/qnlbnsl/matrixio-zwave-utils)
7. [xc3sprog](https://github.com/qnlbnsl/xc3sprog)

If you just want to get started quickly then you can use the [install.sh](install.sh) script to install all the dependencies and packages.

TODO:

1. Replace requirement for matrixio-creator-openocd with regular openocd
2. Create build pipeline with github actions and release binaries
3. Setup a public repository for the debian packages

## Quick Start

Ensure you have a clean install of bookworm on your Raspberry Pi. Then run the following commands:

```bash
git clone https://github.com/qnlbnsl/Matrix-IO.git
cd Matrix-IO
chmod +x install.sh
./install.sh <arm64 || armhf>
```

The install script does the following:

1. Checks the architecture requested. Armhf should be used for 32bit and arm64 for 64bit.
2. Based on the architecture sleeted it will query all packages that need to be installed.
3. Installs all the dependencies. This includes: esptool, libreadline6, python3-reedsolo(esptool dependency), and wiring pi.
4. Next it installs the matrixio packages in the following order
    1. matrix-creator-hal (libmatrixio-creator-hal and libmatrixio-creator-hal-dev)
    2. matrixio-creator-openocd (Required to flash the microcontroller)
    3. xc3sprog (Required to flash the FPGA)
    4. matrix-creator-init (Required to setup creator and voice)
    5. matrixio-kernel-modules (This package is installed after a reboot by scheduling a [cronjob](https://github.com/qnlbnsl/Matrix-IO/blob/17bd59c975dbfce24225742c8ec67bccc1d4ad28/install.sh#L65) with this [script](https://github.com/qnlbnsl/Matrix-IO/blob/17bd59c975dbfce24225742c8ec67bccc1d4ad28/install.sh#L68))
5. Optional. Install the zwave utils debian package to enable zwave functionality

## Initialization

```bash
git clone --recursive -j8  git@github.com:qnlbnsl/Matrix-IO.git
```

If you already cloned the repository then you can update the submodules with:

```bash
git submodule update --init
```

## Package Dependencies

Package: matrix-creator-hal
- Description: Base library to interact with Matric Creator and Matrix Voice
- Dependencies: wiringpi, libfftw3-dev, libgflags-dev, libc6-dev | libc-dev
- Build Dependencies: debhelper, 
- TODO: Update wiring pi based code to whatever latest pi uses.
---
Package: matrix-creator-init
- Description: Set of boot scripts to program Matrix Creator and Matrix Voice. 
- Dependencies: libmatrixio-creator-hal, openocd, wiringpi, matrixio-xc3sprog, python3-pip, esptool, libc6 (>= 2.34), libgcc-s1 (>= 3.5), libncurses5 (>= 6), libreadline8 (>= 8.0), libstdc++6 (>= 4.4), libtinfo5 (>= 6)
- Build Dependencies: debhelper
- TODO: Confirm if wiring pi is actually being used.
---
Package: matrix-creator-openocd
- Description: DEPRECATED
- Dependencies: N/A
- Build Dependencies:
---
Package: matrixio-kernel-modules
- Description: Set of kernel modules to enable microphone and other devices.
- Dependencies: matrixio-creator-init,raspberrypi-kernel-headers,raspberrypi-kernel,dkms,
- Build Dependencies: debhelper, dkms, device-tree-compiler
---
Package: matrixio-zwave-utils
- Description: Replacement package containing zwave programmer and firmware binary
- Dependencies: N/A
---
Package: XC3PROG
- Description: Programmer for the SPARTAN FPGA
- Dependencies: wiringpi
- Build Dependencies: debhelper, cmake, wiringpi, libftdi-dev
- TODO: Find the updated source code or utility. Test it. Remove dependency.
---

## Debug Logs

If you run into issues after installing all packages then please look at the output of the following 

```sh
sudo systemctl status matrixio-devices-firmware.service
```
The service above is what starts the script to program the fpga.


To manually check if everything is working as expected runt he following.
```sh
cd usr/share/matrixlabs/matrixio-devices
./matrix-init.bash
```