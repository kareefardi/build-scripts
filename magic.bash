#!/bin/env bash
#
set -eux

dependencies=(
    build-essential
    csh
    freeglut3-dev
    git
    libcairo2-dev
    libgl-dev
    libx11-dev
    m4
    tcl-dev
    tk-dev
    )
sudo apt install -y ${dependencies[@]}

git clone https://github.com/RTimothyEdwards/magic $HOME/magic

cd $HOME/magic

./configure
make -j$(nproc)
sudo make install
