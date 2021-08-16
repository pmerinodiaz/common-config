#!/bin/bash

# How : Devops
# Want: Synchronize the sources and dependencies for all user accounts of some group in the local or remote AWS EC2.
# For : Update the latest sources and dependencies for all the user account of some group in the system.

if [[ ( $# -eq 2 ) ]]; then
    echo "There are not group."
    echo "Input group (Mandatory)"
    read group
else
    group=$1
fi

if [[ $dist == "Ubuntu" || $dist == "Debian" ]]; then
    sudo apt install members -y
elif [[ $ID_LIKE =~ .*fedora.* || $ID_LIKE =~ .*centos.* || $ID_LIKE =~ .*rhel.* ]]; then
    sudo dnf install members -y
fi

exclude_list=()
#mem_list=$(members $group)
#mem_list=(aabreu amaass areyes avalencia avignaga cvargas datascientist1 datascientist2 datascientist3 deveillard hcarrillo hlira inria jsaintemarie jsalomon lmarti mschoenauer msebag naguilera nsanchez obernard obernard pmarquet pmerinodiaz psanchez wdjema ec2-user)
mem_list=(datascientist1 datascientist2 datascientist3 inria pmerinodiaz ec2-user)

for val in $mem_list; do
    echo $val
    if [[ ${exclude_list[*]} =~ $val ]]; then
        continue
    fi

    git config --global credential.helper store

    HOME_FOLDER="/home/$val"
    common_config="$HOME_FOLDER/inria-chile-sdk/common-config"

    echo "group: $group"

    bash $common_config/synchronize-build.sh $group $val
    sudo chown -R $username:$username $HOME_FOLDER
done
