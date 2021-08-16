#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 1.1. Install VSCode
/bin/bash local-install-mac.sh

# 1.2. Install Docker
brew cask install docker

# 1.3. Install Docker-compose
brew install docker-compose

# 1.4. Install Git
brew install git

# 1.5. Install Python3
brew install python

# 1.6. Install AWS-CLI
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /

# 1.7. Install DVC
brew install dvc

# 1.8. Install Node.js
brew install node
sudo npm install -g create-react-app