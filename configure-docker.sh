#!/bin/bash

# How : Devops
# Want: Configure a user account to use Docker in the local or remote AWS EC2
# For : Start to use Docker with the user account

username=${SUDO_USER:-$USER}

if [[ $username != "" ]]; then
    sudo groupadd docker -f
    sudo usermod -aG docker $username
    newgrp docker
fi