#!/bin/bash

# How : Devops
# Want: Synchronize the sources and dependencies in the user account in the local or remote AWS EC2.
# For : Update the latest sources and dependencies in the system.

if [[ ( $# -eq 3 ) ]]; then
    echo "There are not group."
    echo "Input group (Mandatory*)"
    read group
    echo "There are not username."
    echo "Input username (Mandatory)"
    read username
else
    group=$1
    username=$2
fi

if [[ $group != "" && $username != "" ]]; then
    export HOME_FOLDER="/home/$username"
    export INRIA_CHILE_SDK_FOLDER="$HOME_FOLDER/fch-chile-sdk"
    export GROUP_FOLDER="$HOME_FOLDER/fch-chile-sdk/$group"
    mkdir -p $INRIA_CHILE_SDK_FOLDER
    cd $INRIA_CHILE_SDK_FOLDER

    git config --global credential.helper store

    # Clone the config repo
    common_config="$INRIA_CHILE_SDK_FOLDER/common-config"
    if [ ! -d "$common_config" ]; then
        cd $INRIA_CHILE_SDK_FOLDER
        git clone https://github.com/pmerinodiaz/common-config.git
        cd $common_config
        bash clone-repositories.sh $username
    else
        cd $common_config
        git fetch
        git checkout dev
        git pull
    fi

    # Clone the config repo
    group_config="$INRIA_CHILE_SDK_FOLDER/$group/config"
    if [ ! -d "$group_config" ]; then
        cd $GROUP_FOLDER
        git clone https://gitlab.com/$group/config.git
    else
        cd $group_config
        git fetch
        git checkout master
        git pull
    fi

    cd $group_config
    bash clone-repositories.sh $group $username

    sudo chown -R $username:$username $HOME_FOLDER
fi