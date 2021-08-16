#!/bin/bash

# 1. Install VSCode
sudo apt update -y
sudo apt install -y wget
wget -O vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
sudo apt install -y ./vscode.deb