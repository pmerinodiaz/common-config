#!/bin/bash

if [[ $USERNAME != "" ]]; then
    sudo groupadd docker -f
    sudo usermod -aG docker $USERNAME
    newgrp docker
fi