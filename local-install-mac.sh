#!/bin/bash

username=${SUDO_USER:-$USER}
export HOME_FOLDER="/home/$username"
export FCH_CHILE_SDK_FOLDER="$HOME_FOLDER/fch-chile-sdk"
FILE="$FCH_CHILE_SDK_FOLDER/common-config/vscode.deb"

if [ ! -f "$FILE" ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # 1. Install VSCode
    brew update
    brew tap caskroom/cask
    brew cask search visual-studio-code
    brew cask install visual-studio-code
fi