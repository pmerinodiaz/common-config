#!/bin/bash

# How : Devops
# Want: Delete an user account in the local or remote AWS EC2. Remove paths of the user.
# For : Remove to use of the system.

if [[ ( $# -eq 3 ) ]]; then
    echo "There are not group."
    echo "Input group (Required)"
    read group
    echo "There are not username."
    echo "Input username (Required)"
    read username
else
    group=$1
    username=$2
fi

if [[ $group != "" && $username != "" ]]; then
    answer="y"
    if [[ $ALL_USERS == "false" ]]; then
        echo "The delete operation of users is destructive"
        echo "Continue wih deletion of the user $username (y:yes or n:not)?"
        read answer
    fi
    if [ "$answer" != "${answer#[Yy]}" ]; then
        sudo userdel $username
        sudo rm -r /home/$username
        gpasswd -d $username $group
    fi
fi