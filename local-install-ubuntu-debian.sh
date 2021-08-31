#!/bin/bash

username=${SUDO_USER:-$USER}
export HOME_FOLDER="/home/$username"
export FCH_CHILE_SDK_FOLDER="$HOME_FOLDER/fch-chile-sdk"
FILE="$FCH_CHILE_SDK_FOLDER/common-config/vscode.deb"

if [ ! -f "$FILE" ]; then
    # 1. Install VSCode
    sudo apt update -y
    sudo apt install -y wget
    wget -O vscode.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
    sudo apt install -y ./vscode.deb
fi