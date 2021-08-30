#!/bin/bash

username=${SUDO_USER:-$USER}
export HOME_FOLDER="/home/$username"
export FCH_CHILE_SDK_FOLDER="$HOME_FOLDER/fch-chile-sdk"
FILE="$FCH_CHILE_SDK_FOLDER/common-config/vscode.deb"

if [ ! -f "$FILE" ]; then
    # 1.1. Install VSCode
    sudo yum update -y
    sudo yum install -y wget
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo yum install code
fi