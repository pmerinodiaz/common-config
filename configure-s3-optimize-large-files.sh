#!/bin/bash

# How : Devops
# Want: Configure a user account to optimize large files in AWS S3 in the local or remote AWS EC2
# For : Start to use large files in AWS S3 with the user account

answer="y"
if [[ $ALL_USERS == "false" ]]; then
    echo "Configure S3 Optimize Throughput of Large Files (y:yes or n:not)?"
    read answer
fi

if [[ "$answer" != "${answer#[Yy]}" ]]; then
    sudo pip3 install --upgrade awscli

    . /etc/os-release
    echo "ID_LIKE: $ID_LIKE"

    if [[ $ID_LIKE =~ .*fedora.* || $ID_LIKE =~ .*centos.* || $ID_LIKE =~ .*rhel.* ]]; then
        aws configure set default.region us-west-2
        aws configure set default.s3.max_concurrent_requests 1
        aws configure set default.s3.multipart_threshold 64MB
        aws configure set default.s3.multipart_chunksize 16MB
    fi
fi