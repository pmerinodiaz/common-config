#!/bin/bash

# How : Devops
# Want: Configure the current user account in the local or remote AWS EC2. Clone repos, configure AWS S3 credentials and configure ssh-keygen to use Gitlab.
# For : Start to use the user account

if [[ ( $# -eq 4 ) ]]; then
    echo "There are not group."
    echo "Input group (Mandatory)"
    read GROUP
    echo "There are not access_key_id."
    echo "Input access_key_id (Required)"
    read ACCESS_KEY_ID
    echo "There are not secret_access_key."
    echo "Input secret_access_key (Required)"
    read SECRET_ACCESS_KEY

else
    GROUP=$1
    ACCESS_KEY_ID=$2
    SECRET_ACCESS_KEY=$3
fi

username=${SUDO_USER:-$USER}

if [[ $username != "" ]]; then
    export HOME_FOLDER="/home/$username"
    export INRIA_CHILE_SDK_FOLDER="$HOME_FOLDER/inria-chile-sdk"
    mkdir -p $INRIA_CHILE_SDK_FOLDER

    git config --global credential.helper store
    
    # 8.1. Clone the repositories and install credentials of AWS
    common_config="$INRIA_CHILE_SDK_FOLDER/common-config"
    if [ ! -d "$common_config" ]; then
        cd $INRIA_CHILE_SDK_FOLDER
        git clone https://gitlab.com/Inria-Chile/common-config.git
    else
        cd $common_config
        git fetch
        git checkout dev
        git pull
    fi
    cd $INRIA_CHILE_SDK_FOLDER
    bash common-config/clone-repositories.sh $username
    if [[ $GROUP != "" ]]; then
        export GROUP_FOLDER="$INRIA_CHILE_SDK_FOLDER/$GROUP"
        mkdir -p $GROUP_FOLDER
        config="$GROUP_FOLDER/config"
        if [ ! -d "$config" ]; then
            cd $GROUP_FOLDER
            echo "You need to have a https://gitlab.com/Inria-Chile/$GROUP/config/clone-repositories.sh with the git commands for clone repos of $GROUP"
            git clone https://gitlab.com/Inria-Chile/$GROUP/config.git
        else
            cd $config
            git fetch
            git checkout dev
            git pull
        fi
        cd $GROUP_FOLDER
        bash config/clone-repositories.sh $GROUP $username

        if [[ $ACCESS_KEY_ID != "" && $SECRET_ACCESS_KEY != "" ]]; then
            cd $GROUP_FOLDER
            echo "You need to have the https://gitlab.com/Inria-Chile/common-config/install-credentials.sh with the aws commands for create credentials of $GROUP"
            bash install-credentials.sh $ACCESS_KEY_ID $SECRET_ACCESS_KEY $username $GROUP
        fi
    fi

    answer="y"
    if [[ $ALL_USERS == "false" ]]; then
        # 8.2. GitLab SSH Keys (Optional)
        echo "Configure the GitLab SSH Keys for user $username (y:yes or n:not)?"
        read answer
    fi

    if [ "$answer" != "${answer#[Yy]}" ]; then
        ssh-keygen
        cat $HOME_FOLDER/.ssh/id_rsa.pub
        echo "1. Navigate to https://gitlab.com or your local GitLab instance URL and sign in."
        echo "2. In the top-right corner, select your avatar."
        echo "3. Select Edit profile."
        echo "4. In the left sidebar, select SSH Keys."
        echo "5. Paste the public key that you copied into the Key text box."
        echo "6. Make sure your key includes a descriptive name in the Title text box, such as Work Laptop or Home Workstation."
        echo "7. Include an (optional) expiry date for the key under “Expires at” section. (Introduced in GitLab 12.9.)."
        echo "8. Click the Add key button."
    fi

    echo "Changing the permissions of the home folder. This could be take several minutes..."
    sudo chown -R $username:$username $HOME_FOLDER
fi