#!/bin/env bash

sudo apt install -y $(cat ./dependencies.txt)

deb="klayout_0.28.5-1_amd64.deb"
wget https://www.klayout.org/downloads/Ubuntu-22/${deb} -P ${HOME}
sudo dpkg -i ${HOME}/${deb} || { sudo apt -f install && sudo dpkg -i ${HOME}/{deb}; }

