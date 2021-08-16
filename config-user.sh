#!/bin/bash

# How : Devops
# Want: Configure a user account in the local or remote AWS EC2. Install the remote tools.
# For : Start to use the user account

if [[ ( $# -ne 4 ) ]]; then
    echo "There are not group."
    echo "Input group (Mandatory)"
    read group
    echo "There are not username."
    echo "Input username (Mandatory)"
    read username
    echo "There are not access_key_id."
    echo "Input access_key_id (Mandatory)"
    read access_key_id
    echo "There are not secret_access_key."
    echo "Input secret_access_key (Mandatory)"
    read secret_access_key
else
    group=$1
    username=$2
    access_key_id=$3
    secret_access_key=$4
fi

if [[ $group != "" && $username != "" && $access_key_id != "" && $secret_access_key != "" ]]; then
    export access_key_id=$access_key_id
    export secret_access_key=$secret_access_key

    export HOME_FOLDER="/home/$username"
    export INRIA_CHILE_SDK_FOLDER="$HOME_FOLDER/inria-chile-sdk"
    mkdir -p $INRIA_CHILE_SDK_FOLDER
    mypasswordfile="$INRIA_CHILE_SDK_FOLDER/mypasswordfile"

    touch $mypasswordfile
    echo "inria" > $mypasswordfile

    cd $INRIA_CHILE_SDK_FOLDER

    git config --global credential.helper store
    git clone https://gitlab.com/Inria-Chile/vscode-local-remote.git
    cd vscode-local-remote
    ./install-remote.sh $group $username $access_key_id $secret_access_key

    sudo chown -R $username:$username $HOME_FOLDER
fi