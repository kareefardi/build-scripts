#!/bin/env bash
#
set -eux

dependencies=($(cat ./dependencies.txt))

sudo apt install -y ${dependencies[@]}

pip3 install volare

latest=$(python3 -c "print($($HOME/.local/bin/volare ls-remote)[0])")

bash -c "$HOME/.local/bin/volare enable ${latest} --pdk-root $HOME/pdks"

new_path='export PATH=$PATH:$HOME/.local/bin'
grep -qxF "$new_path" $HOME/.bashrc || echo "$new_path" >> $HOME/.bashrc

