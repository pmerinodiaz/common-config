#!/bin/bash

# How : Devops
# Want: Create the path for DVC cache in the local or remote server (AWS EC2)
# For : Perform fast updates in the datasets

if [[ ( $# -eq 2 ) ]]; then
    echo "There are not group."
    echo "Input group"
    read group
else
    group=$1
fi

cd /home

for d in */; do
    directory="$d"
    username=${directory/\//}
    cd $directory
    ln -s "/srv/data/$group-dvc/cache" "$group-dvc"
    sudo chown -R $username:$group "$group-dvc"
    cd ..
done
