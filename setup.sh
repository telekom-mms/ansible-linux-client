#!/bin/bash

# set up ansible in a virtualenv
set -eux;
    sudo apt-get update > /dev/null
    sudo apt-get install python3 -y > /dev/null

echo "create ansible virtualenv in home dir"
set -eux;
    python3 -m venv ~/.ansible-test
    source ~/.ansible-test/bin/activate
    pip install --upgrade pip
    pip install ansible
    pip install ansible-lint
    pip install yamllint

echo "setup linux client with ansible"
set -eux;
    source ~/.ansible-test/bin/activate
    ansible-playbook playbooks/setup.yml --diff -v
