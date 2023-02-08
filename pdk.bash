#!/bin/env bash
#
set -eux

sudo apt install -y python3-pip

pip3 install volare


latest=$(python3 -c "print($($HOME/.local/volare ls-remote)[0])")

bash -c "$HOME/.local/bin/volare enable ${latest} --pdk-root $HOME/pdks"

new_path='export PATH=$PATH:$HOME/.local/bin'
grep -qxF "$new_path" $HOME/.bashrc || echo "$new_path" >> $HOME/.bashrc

