#!/bin/env bash

set -eux

sudo apt install -y $(cat ./dependencies.txt)

deb="klayout_0.28.5-1_amd64.deb"
rm -rf ${HOME}/${deb}
wget https://www.klayout.org/downloads/Ubuntu-22/${deb} -P ${HOME}
sudo dpkg -i ${HOME}/${deb} || { sudo apt -fy install && sudo dpkg -i ${HOME}/${deb} ; }

