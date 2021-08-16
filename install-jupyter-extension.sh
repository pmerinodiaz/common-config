#!/bin/bash

answer="y"
if [[ $ALL_USERS == "false" ]]; then
    echo "Install Jupyter extension (y:yes or n:not)?"
    read answer
fi

if [[ "$answer" != "${answer#[Yy]}" ]]; then
    echo "Install Jupyter extension"
    echo "Launch Visual Studio Code, Quick Open (Ctrl+P), paste the following command, and press enter."
    echo "ext install ms-toolsai.jupyter"
fi