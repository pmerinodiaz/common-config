#!/bin/bash

git config --global credential.helper store
if [[ $USERNAME != "" ]]; then
    export HOME_FOLDER="/home/$USERNAME"
    export INRIA_CHILE_SDK_FOLDER="$HOME_FOLDER/inria-chile-sdk"
    mkdir -p $INRIA_CHILE_SDK_FOLDER
    
    # 8.1. Clone the repositories and install credentials of AWS
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
    cd $INRIA_CHILE_SDK_FOLDER
    bash common-config/clone-repositories.sh $USERNAME
    if [[ $GROUP != "" ]]; then
        export GROUP_FOLDER="$INRIA_CHILE_SDK_FOLDER/$GROUP"
        mkdir -p $GROUP_FOLDER
        config="$GROUP_FOLDER/config"
        if [ ! -d "$config" ]; then
            cd $GROUP_FOLDER
            echo "You need to have a https://gitlab.com/$GROUP/config/clone-repositories.sh with the git commands for clone repos of $GROUP"
            git clone https://gitlab.com/$GROUP/config.git
        else
            cd $config
            git fetch
            git checkout dev
            git pull
        fi
        cd $GROUP_FOLDER
        bash config/clone-repositories.sh $GROUP $USERNAME

        if [[ $ACCESS_KEY_ID != "" && $SECRET_ACCESS_KEY != "" ]]; then
            cd $GROUP_FOLDER
            echo "You need to have the https://gitlab.com/Inria-Chile/common-config/install-credentials.sh with the aws commands for create credentials of $GROUP"
            bash install-credentials.sh $ACCESS_KEY_ID $SECRET_ACCESS_KEY $USERNAME $GROUP
        fi
    fi

    answer="y"
    if [[ $ALL_USERS == "false" ]]; then
        echo "Configure the GitLab SSH Keys for user $USERNAME (y:yes or n:not)?"
        read answer
    fi

    # 8.2. GitLab SSH Keys (Optional)
    if [[ "$answer" != "${answer#[Yy]}" ]]; then
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
    sudo chown -R $USERNAME:$USERNAME $HOME_FOLDER
fi