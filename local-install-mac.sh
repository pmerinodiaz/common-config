#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 1. Install VSCode
brew update
brew tap caskroom/cask
brew cask search visual-studio-code
brew cask install visual-studio-code