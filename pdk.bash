#!/bin/env bash
#
set -eux

sudo apt install -y python3-pip

pip3 install volare

latest=$(python3 -c "print($(volare ls-remote)[0])")

volare enable ${latest} --pdk-root $HOME/pdks

