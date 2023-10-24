#!/bin/bash

echo "Installing Libraries"
sudo apt install libc6 \
  libfftw3-single3 \
  libgcc-s1 \
  libstdc++6 \
  libfftw3-dev \
  libgflags-dev \
  libc6-dev \
  libncurses5 \
  libreadline6 \
  libtinfo5 \
  libjim0.81 \
  libftdi1 \
  libusb-0.1-4

echo "Installing libreadline6 and wiringpi packages manually"
sudo dpkg -i deps/libreadline6_6.3-8ubuntu4_arm64.deb
sudo dpkg -i deps/wiringpi-2.61-1-arm64.deb
echo "Installing kernel headers"
sudo apt install dkms raspberrypi-kernel-headers raspberrypi-kernel
