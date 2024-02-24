#!/bin/bash

sudo apt install build-essential \
	devscripts \
	debhelper \
	cmake \
	git \
	curl \
  python3-full \
	python3-pip

sudo apt install \
	cdbs \
	texinfo \
	texlive \
	libjim-dev \
	libftdi-dev \
	libfftw3-dev \
	libgflags-dev \
	libncurses5 \
  libreadline8 \
	libusb-1.0-0-dev \
  raspberrypi-kernel-headers \
  raspberrypi-kernel \
  m4 \
  automake \
  pkg-config \
  libtool \
  dkms \
  dh-dkms

# echo "Adding armf architecture and installing libncurses5:armhf"
# sudo dpkg --add-architecture armhf
# sudo apt-get update
# sudo apt-get install libncurses5:armhf
# echo "Installing libreadline6 and wiringpi packages manually"
# sudo dpkg -i libreadline6_6.3-8ubuntu2_armhf.deb
# sudo dpkg -i libreadline6_6.3-8ubuntu2_arm64.deb
# sudo dpkg -i deps/wiringpi-2.61-1-arm64.deb
