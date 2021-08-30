#!/bin/bash

# How : Devops
# Want: Install the credentials of AWS s3 in the local or remote server (AWS EC2)
# For : Usage of the AWS CLI or boto3

if [[ ( $# -eq 5 ) ]]; then
    echo "There are not access_key_id."
    echo "Input access_key_id (Required)"
    read access_key_id
    echo "There are not secret_access_key."
    echo "Input secret_access_key (Required)"
    read secret_access_key
    echo "There are not username."
    echo "Input username (Required)"
    read username
    echo "There are not group."
    echo "Input group (Required)"
    read group
else
    access_key_id=$1
    secret_access_key=$2
    username=$3
    group=$4
fi

if [[ $access_key_id != "" && $secret_access_key != "" && $username != "" && $group != "" ]]; then
    answer="y"
    if [[ $ALL_USERS == "false" ]]; then
        echo "Install the credentials of AWS S3 of $group (y:yes or n:not)?"
        read answer
    fi

    if [ "$answer" != "${answer#[Yy]}" ]; then
        export access_key_id=$access_key_id
        export secret_access_key=$secret_access_key
        export HOME_FOLDER="/home/$username"
        export FCH_CHILE_SDK_FOLDER="$HOME_FOLDER/fch-chile-sdk"
        export GROUP_FOLDER="$FCH_CHILE_SDK_FOLDER/$group"
        # cd $FCH_CHILE_SDK_FOLDER/common-mlops
        # ./install.sh $access_key_id $secret_access_key $username $group
        # cd $GROUP_FOLDER/data-read
        # ./install.sh $access_key_id $secret_access_key $username $group
    fi
fi