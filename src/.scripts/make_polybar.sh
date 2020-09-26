#! /bin/bash

# Dependencies
sudo apt install -y build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libpulse-dev libnl-genl-3-dev

git clone --recursive https://github.com/polybar/polybar /tmp/polybar
cd /tmp/polybar

mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install
