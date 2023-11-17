# Matrix-IO

Master repo to manage matrixio modules

## APT Dependencies

libc6 (>= 2.17),
libfftw3-single3 (>= 3.3.10),
libgcc-s1 (>= 3.0),
libstdc++6 (>= 12),
wiringpi,
libfftw3-dev,
libgflags-dev,
libc6-dev,
libncurses5 (>= 6),
libreadline6 (>= 6.0),
libtinfo5 (>= 6),
libjim0.81 (>= 0.73),
libftdi1,
libusb-0.1-4 (>= 2:0.1.12),

## Kernel Dependencies

dkms (>= 2.1.0.0),
raspberrypi-kernel-headers,
raspberrypi-kernel

## Manual installation

wiringpi,
libreadline6

## Initialization

```bash
git clone --recursive -j8  git@github.com:qnlbnsl/Matrix-IO.git
```

If you already cloned the repository then you can update the submodules with:

```bash
git submodule update --init
```

## Build

```bash