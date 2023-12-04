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

## Quick Start

Ensure you have a clean install of bookworm or buster on your Raspberry Pi. Then run the following commands:

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
