#!/bin/env bash

set -eux

dependencies=($(cat ./dependencies.txt))

sudo apt install -y ${dependencies[@]}

git clone https://github.com/RTimothyEdwards/netgen $HOME/netgen

cd $HOME/netgen

./configure
make -j$(nproc)
sudo make install
