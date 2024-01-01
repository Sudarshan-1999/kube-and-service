#!/bin/bash
sudo add-apt-repository ppa:git-core/ppa
echo $@
sudo apt update -y
echo $@
sudo apt install git -y
