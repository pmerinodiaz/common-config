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
    export FCH_CHILE_SDK_FOLDER="$HOME_FOLDER/fch-chile-sdk"
    export TRQ_FUNDACION="$FCH_CHILE_SDK_FOLDER/trq-fundacion"
    mkdir -p $TRQ_FUNDACION

    git config --global credential.helper store

    archivist="$TRQ_FUNDACION/archivist"
    if [ ! -d "$archivist" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/archivist.git
    else
        cd $archivist
        git checkout master
        git pull
    fi

    backend="$TRQ_FUNDACION/backend"
    if [ ! -d "$backend" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/backend.git
    else
        cd $backend
        git checkout master
        git pull
    fi

    beats_consumer="$TRQ_FUNDACION/beats-consumer"
    if [ ! -d "$beats_consumer" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/beats-consumer
    else
        cd $beats_consumer
        git checkout master
        git pull
    fi

    config="$TRQ_FUNDACION/config"
    if [ ! -d "$config" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/config.git
    else
        cd $config
        git checkout master
        git pull
    fi

    ecourse="$TRQ_FUNDACION/ecourse"
    if [ ! -d "$ecourse" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/ecourse.git
    else
        cd $ecourse
        git checkout master
        git pull
    fi

    ef="$TRQ_FUNDACION/ef"
    if [ ! -d "$ef" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/ef.git
    else
        cd $ef
        git checkout master
        git pull
    fi

    emac="$FCH_CHILE_SDK_FOLDER/emac"
    if [ ! -d "$emac" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/emac.git
    else
        cd $emac
        git checkout master
        git pull
    fi

    enrichment="$FCH_CHILE_SDK_FOLDER/enrichment"
    if [ ! -d "$enrichment" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/enrichment.git
    else
        cd $enrichment
        git checkout master
        git pull
    fi

    fake_beats="$FCH_CHILE_SDK_FOLDER/fake-beats"
    if [ ! -d "$fake_beats" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/fake-beats.git
    else
        cd $fake_beats
        git checkout master
        git pull
    fi

    frontend="$FCH_CHILE_SDK_FOLDER/frontend"
    if [ ! -d "$frontend" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/frontend.git
    else
        cd $frontend
        git checkout master
        git pull
    fi

    http_poller_producer="$FCH_CHILE_SDK_FOLDER/http-poller-producer"
    if [ ! -d "$http_poller_producer" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/http-poller-producer.git
    else
        cd $http_poller_producer
        git checkout master
        git pull
    fi

    index_builder="$FCH_CHILE_SDK_FOLDER/index-builder"
    if [ ! -d "$index_builder" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/index-builder.git
    else
        cd $index_builder
        git checkout master
        git pull
    fi

    index_test_cases="$FCH_CHILE_SDK_FOLDER/index-test-cases"
    if [ ! -d "$index_test_cases" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/index-test-cases.git
    else
        cd $index_test_cases
        git checkout master
        git pull
    fi

    qa_load_testing="$FCH_CHILE_SDK_FOLDER/qa-load-testing"
    if [ ! -d "$qa_load_testing" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/qa-load-testing.git
    else
        cd $qa_load_testing
        git checkout master
        git pull
    fi

    qa_snapshots="$FCH_CHILE_SDK_FOLDER/qa-snapshots"
    if [ ! -d "$qa_snapshots" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/qa-snapshots.git
    else
        cd $qa_snapshots
        git checkout master
        git pull
    fi

    qa_testing_framework="$FCH_CHILE_SDK_FOLDER/qa-testing-framework"
    if [ ! -d "$qa_testing_framework" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/qa-testing-framework.git
    else
        cd $qa_testing_framework
        git checkout master
        git pull
    fi

    qa_testing_framework_ci="$FCH_CHILE_SDK_FOLDER/qa-testing-framework-ci"
    if [ ! -d "$qa_testing_framework_ci" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/qa-testing-framework-ci.git
    else
        cd $qa_testing_framework_ci
        git checkout master
        git pull
    fi

    sql_beats_producer="$FCH_CHILE_SDK_FOLDER/sql-beats-producer"
    if [ ! -d "$sql_beats_producer" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/sql-beats-producer.git
    else
        cd $sql_beats_producer
        git checkout master
        git pull
    fi

    stack_dev_local="$FCH_CHILE_SDK_FOLDER/stack-dev-local"
    if [ ! -d "$stack_dev_local" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/stack-dev-local.git
    else
        cd $stack_dev_local
        git checkout master
        git pull
    fi

    stats="$FCH_CHILE_SDK_FOLDER/stats"
    if [ ! -d "$stats" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/stats.git
    else
        cd $stats
        git checkout master
        git pull
    fi

    stream_snapshot="$FCH_CHILE_SDK_FOLDER/stream-snapshot"
    if [ ! -d "$stream_snapshot" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/stream-snapshot.git
    else
        cd $stream_snapshot
        git checkout master
        git pull
    fi

    twiki="$FCH_CHILE_SDK_FOLDER/twiki"
    if [ ! -d "$twiki" ]; then
        cd $FCH_CHILE_SDK_FOLDER
        git clone https://patricio.merino@gitlab.com/trq-fundacion/twiki.git
    else
        cd $twiki
        git checkout master
        git pull
    fi

    answer="y"
    if [[ $ALL_USERS == "false" ]]; then
        # Install the requirements of the repositories
        echo "Install the requirements of the repositories (y:yes or n:not)?"
        read answer
    fi

    if [ "$answer" != "${answer#[Yy]}" ]; then
        cd $backend
        python3 -m venv venv
        source venv/bin/activate
        pip3 install -r requirements.txt
        deactivate
    fi
fi