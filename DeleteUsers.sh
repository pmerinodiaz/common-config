#!/bin/bash

# How : Devops
# Want: Delete an existing user in the remote server (AWS EC2)
# For : Perform task of deletion of credentials AWS, remove folders of repos and configuration of the user

if [[ ( $# -eq 2 ) ]]; then
    echo "There are not group."
    echo "Input group (Required)"
    read group
else
    group=$1
fi

if [[ $group != "" ]]; then
    answer="y"
    if [[ $ALL_USERS == "false" ]]; then
        echo "The delete operation of users is destructive"
        echo "Continue wih deletion of all users of $group (y:yes or n:not)?"
        read answer
    fi

    if [ "$answer" != "${answer#[Yy]}" ]; then
        dist=$(tr -s ' \011' '\012' < /etc/issue | head -n 1)
        echo "Distribution Name: $dist"

        . /etc/os-release
        echo "ID_LIKE: $ID_LIKE"

        uname=$(uname -av)
        echo "Uname: $uname"

        if [[ $dist == "Ubuntu" || $dist == "Debian" ]]; then
            sudo apt install members -y
            export mem_list=$(members $group)
        elif [[ $ID_LIKE =~ .*fedora.* || $ID_LIKE =~ .*centos.* || $ID_LIKE =~ .*rhel.* ]]; then
            sudo dnf install members -y
            export mem_list=$(awk -F: '/^$group/ {print $4;}' /etc/group | tr ',' ' ')
        fi

        exclude_list=(pmerinodiaz root)

        export HOME_FOLDER="/home/$username"
        export INRIA_CHILE_SDK_FOLDER="$HOME_FOLDER/inria-chile-sdk"
        mkdir -p $INRIA_CHILE_SDK_FOLDER
        cd $INRIA_CHILE_SDK_FOLDER

        git config --global credential.helper store

        # Clone the config repo
        common_config="$INRIA_CHILE_SDK_FOLDER/common-config"
        if [ ! -d "$common_config" ]; then
            cd $INRIA_CHILE_SDK_FOLDER
            git clone https://github.com/pmerinodiaz/common-config.git
        else
            cd $common_config
            git fetch
            git checkout dev
            git pull
        fi

        for val in $mem_list; do
            echo $val
            if [[ ${exclude_list[*]} =~ $val ]]; then
                continue
            fi
            bash "$INRIA_CHILE_SDK_FOLDER/common-config/delete-user.sh" $group $val
        done
    fi
fi