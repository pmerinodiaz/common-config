#!/bin/bash

answer="y"
if [[ $ALL_USERS == "false" ]]; then
    echo "Configure S3 Optimize Throughput of Large Files (y:yes or n:not)?"
    read answer
fi

if [[ "$answer" != "${answer#[Yy]}" ]]; then
    sudo pip3 install --upgrade awscli
    aws configure set default.region us-west-2
    aws configure set default.s3.max_concurrent_requests 1
    aws configure set default.s3.multipart_threshold 64MB
    aws configure set default.s3.multipart_chunksize 16MB
fi