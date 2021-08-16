#!/bin/bash

# 1.1. Install VSCode
sudo yum update -y
sudo yum install -y wget
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo yum install code