#!/bin/env bash
#
set -eux

sudo apt install -y python3-pip

pip3 install volare

latest=$(python3 -c "print($(volare ls-remote)[0])")

new_path='export PATH=$PATH:$HOME/.local/bin'
grep -qxF "$new_path" $HOME/.bashrc || echo "$new_path" >> $HOME/.bashrc

bash -c "volare enable ${latest} --pdk-root $HOME/pdks"

