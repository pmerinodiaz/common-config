#!/bin/bash

# How : Devops
# Want: Get the source repos commons in the local or remote AWS EC2
# For : Perform developments in their

if [[ ( $# -eq 2 ) ]]; then
    echo "There are not username."
    echo "Input username (Required)"
    read username
else
    username=$1
fi

if [[ $username != "" ]]; then
    export HOME_FOLDER="/home/$username"
    export INRIA_CHILE_SDK_FOLDER="$HOME_FOLDER/inria-chile-sdk"
    mkdir -p $INRIA_CHILE_SDK_FOLDER

    git config --global credential.helper store

    common_mlops="$INRIA_CHILE_SDK_FOLDER/common-mlops"
    if [ ! -d "$common_mlops" ]; then
        cd $INRIA_CHILE_SDK_FOLDER
        git clone https://gitlab.com/Inria-Chile/common-mlops.git
    else
        cd $common_mlops
        git checkout dev
        git pull
    fi

    common_dvc="$INRIA_CHILE_SDK_FOLDER/common-dvc"
    if [ ! -d "$common_dvc" ]; then
        cd $INRIA_CHILE_SDK_FOLDER
        git clone https://gitlab.com/Inria-Chile/common-dvc.git
    else
        cd $common_dvc
        git checkout dev
        git pull
    fi

    common_compute="$INRIA_CHILE_SDK_FOLDER/common-compute"
    if [ ! -d "$common_compute" ]; then
        cd $INRIA_CHILE_SDK_FOLDER
        git clone https://gitlab.com/Inria-Chile/common-compute.git
    else
        cd $common_compute
        git checkout dev
        git pull
    fi

    common_frontend="$INRIA_CHILE_SDK_FOLDER/common-frontend"
    if [ ! -d "$common_frontend" ]; then
        cd $INRIA_CHILE_SDK_FOLDER
        git clone https://gitlab.com/Inria-Chile/common-frontend.git
    else
        cd $common_frontend
        git checkout dev
        git pull
    fi

    common_index_builder="$INRIA_CHILE_SDK_FOLDER/common-index-builder"
    if [ ! -d "$common_index_builder" ]; then
        cd $INRIA_CHILE_SDK_FOLDER
        git clone https://gitlab.com/Inria-Chile/common-index-builder.git
    else
        cd $common_index_builder
        git checkout dev
        git pull
    fi

    common_index_test_cases="$INRIA_CHILE_SDK_FOLDER/common-index-test-cases"
    if [ ! -d "$common_index_test_cases" ]; then
        cd $INRIA_CHILE_SDK_FOLDER
        git clone https://gitlab.com/Inria-Chile/common-index-test-cases.git
    else
        cd $common_index_test_cases
        git checkout dev
        git pull
    fi

    common_pipeline="$INRIA_CHILE_SDK_FOLDER/common-pipeline"
    if [ ! -d "$common_pipeline" ]; then
        cd $INRIA_CHILE_SDK_FOLDER
        git clone https://gitlab.com/Inria-Chile/common-pipeline.git
    else
        cd $common_pipeline
        git checkout dev
        git pull
    fi

    vscode_local="$INRIA_CHILE_SDK_FOLDER/vscode-local"
    if [ ! -d "$vscode_local" ]; then
        cd $INRIA_CHILE_SDK_FOLDER
        git clone https://gitlab.com/Inria-Chile/vscode-local.git
    else
        cd $vscode_local
        git checkout dev
        git pull
    fi

    vscode_local_remote="$INRIA_CHILE_SDK_FOLDER/vscode-local-remote"
    if [ ! -d "$vscode_local_remote" ]; then
        cd $INRIA_CHILE_SDK_FOLDER
        git clone https://gitlab.com/Inria-Chile/vscode-local-remote.git
    else
        cd $vscode_local_remote
        git checkout dev
        git pull
    fi

    vscode_web="$INRIA_CHILE_SDK_FOLDER/vscode-web"
    if [ ! -d "$vscode_web" ]; then
        cd $INRIA_CHILE_SDK_FOLDER
        git clone https://gitlab.com/Inria-Chile/vscode-web.git
    else
        cd $vscode_web
        git checkout dev
        git pull
    fi

    template_data_science="$INRIA_CHILE_SDK_FOLDER/template-data-science"
    if [ ! -d "$template_data_science" ]; then
        cd $INRIA_CHILE_SDK_FOLDER
        git clone https://github.com/Inria-Chile/template-data-science.git
    else
        cd $template_data_science
        git checkout dev
        git pull
    fi

    answer="y"
    if [[ $ALL_USERS == "false" ]]; then
        # Install the requirements of the repositories
        echo "Install the requirements of the repositories (y:yes or n:not)?"
        read answer
    fi

    if [ "$answer" != "${answer#[Yy]}" ]; then
        cd $common_mlops
        python3 -m venv venv
        source venv/bin/activate
        pip3 install -r requirements.txt
        deactivate
    fi
fi