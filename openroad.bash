#!/bin/env bash

set -eux

dependencies=($(cat ./dependencies.txt))

sudo apt install -y ${dependencies[@]}

or_tools_basename="or-tools_amd64_ubuntu-22.04_cpp_v9.5.2237"
or_tools_tar="${or_tools_basename}.tar.gz"
rm -rf ${HOME}/${or_tools_tar}
wget https://github.com/google/or-tools/releases/download/v9.5/${or_tools_tar} -P $HOME

tar xvf ${HOME}/${or_tools_tar} -C ${HOME}/

sudo rm -rf /etc/ld.so.conf.d/or_tools.conf
sudo bash -c "echo '$HOME/or-tools_x86_64_Ubuntu-22.04_cpp_v9.5.2237/lib' > /etc/ld.so.conf.d/or_tools.conf"
sudo ldconfig

git clone https://github.com/The-OpenROAD-Project/OpenROAD ${HOME}/openroad --depth=1 --recursive
cd ${HOME}/openroad

mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install

