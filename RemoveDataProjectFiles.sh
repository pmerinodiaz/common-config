#!/bin/bash

# How : Devops
# Want: Remove the files in the DVC path of local or remote server AWS EC2
# For : Initial usage of the DVC paths

if [[ ( $# -eq 2 ) ]]; then
    echo "There are not group."
    echo "Input group (Required)"
    read group
else
    group=$1
fi

if [[ $group != "" ]]; then
    cd "/srv/data/$group-dvc/cache"
    sudo rm -rf *
    cd "/srv/data/$group-dvc/existing-data"
    sudo rm -rf *
    cd "/srv/data/$group-dvc/external"
    sudo rm -rf *
    cd "/srv/data/$group-dvc/storage"
    sudo rm -rf *
    cd "/srv/data/$group-dvc/storage-master"
    sudo rm -rf *
fi