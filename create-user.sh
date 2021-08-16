#!/bin/bash

# How : Devops
# Want: Create an user account in the local or remote AWS EC2. Sets the password and group.
# For : Start to use the user account

if [[ ( $# -eq 3 ) ]]; then
    echo "There are not group."
    echo "Input group (Mandatory)"
    read group
    echo "There are not username."
    echo "Input username (Mandatory)"
    read username
else
    group=$1
    username=$2
fi

if [[ $group != "" && $username != "" ]]; then
    sudo useradd -m $username

    dist=$(tr -s ' \011' '\012' < /etc/issue | head -n 1)
    echo "Distribution Name: $dist"

    . /etc/os-release
    echo "ID_LIKE: $ID_LIKE"

    uname=$(uname -av)
    echo "Uname: $uname"

    # Install Core
    if [[ $dist == "Ubuntu" || $dist == "Debian" ]]; then
        echo "${username}:inria" | sudo chpasswd
    elif [[ $ID_LIKE =~ .*fedora.* || $ID_LIKE =~ .*centos.* || $ID_LIKE =~ .*rhel.* || $uname =~ .*Mac.* ]]; then
        echo -n 'inria' | passwd $username --stdin
    fi

    sudo usermod -a -G sudo $username
    sudo usermod -a -G $group $username
fi