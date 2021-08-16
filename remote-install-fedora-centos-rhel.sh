#!/bin/bash

# 1.1. Install Docker
sudo yum update -y
sudo yum install -y wget
sudo yum remove -y docker \
                docker-client \
                docker-client-latest \
                docker-common \
                docker-latest \
                docker-latest-logrotate \
                docker-logrotate \
                docker-engine
yum install -y docker

# 1.2. Install Docker-compose
sudo yum update -y
sudo yum install docker -y
sudo service docker start
docker info
docker ps
sudo systemctl enable docker
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose version

# 1.3. Install Git
sudo yum update -y
sudo yum install -y git

# 1.4. Install AWS-CLI
system_release=$(cat /etc/system-release)
if [[ $system_release == *"Amazon"* ]]; then
    # Automake, Gcc (C/C++), Perl, Python & Debuggers
    sudo yum -y groupinstall "Development Tools"
else
    sudo apt-get install -y awscli
fi
sudo pip3 install awscli

# 1.5. Install DVC
sudo wget \
    https://dvc.org/rpm/dvc.repo \
    -O /etc/yum.repos.d/dvc.repo
sudo rpm --import https://dvc.org/rpm/iterative.asc
sudo yum update -y
sudo yum install -y dvc
sudo pip3 install dvc

# 1.6. Install Python3
sudo yum update -y
sudo yum install -y python3
sudo yum install -y python3-pip
sudo yum install -y python3-venv

# 1.7. Install Node.js
sudo yum clean all && sudo yum makecache fast
sudo yum install -y gcc-c++ make
curl --silent --location https://rpm.nodesource.com/setup_10.x | sudo bash -
sudo yum install -y nodejs
sudo yum install -y npm
curl --silent --location https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo
sudo rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg
sudo yum install -y yarn
sudo npm -g install create-react-app