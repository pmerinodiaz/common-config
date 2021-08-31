#!/bin/bash

vscode_version=$(code --version)
echo "VSCode: $vscode_version"

git_version=$(git --version)
echo "Git: $git_version"

dvc_version=$(dvc --version)
echo "DVC: $dvc_version"

docker_version=$(docker --version)
echo "Docker: $docker_version"

docker_compose_version=$(docker-compose version)
echo "Docker-compose: $docker_compose_version"

python3_version=$(python3 --version)
echo "Python3: $python3_version"

pip3_version=$(pip3 --version)
echo "Pip3: $pip3_version"

aws_version=$(aws --version)
echo "AWS: $aws_version"

nodejs_version=$(node -v)
echo "Node.js: $nodejs_version"

npm_version=$(npm -v)
echo "NPM: $npm_version"

yarn_version=$(yarn --version)
echo "Yarn: $yarn_version"

create_react_app_version=$(create-react-app --version)
echo "Create-react-app: $create_react_app_version"

kubectl_version=$(kubectl version --client)
echo "Kubectl: $kubectl_version"