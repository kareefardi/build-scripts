#!/bin/env bash
#
set -eux

dependencies=($(cat ./dependencies.txt))

sudo apt install -y ${dependencies[@]}

git clone https://github.com/RTimothyEdwards/magic $HOME/magic

cd $HOME/magic

./configure
make -j$(nproc)
sudo make install
