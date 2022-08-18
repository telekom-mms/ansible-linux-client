#!/bin/bash

echo -e "\e[1;31minstall python3 to create a virtualenv\e[0m"

sudo apt-get update
sudo apt-get install python3 -y

echo -e "\e[1;31mcreate ansible virtualenv in home dir\e[0m"

python3 -m venv ~/.ansible-venv
source ~/.ansible-venv/bin/activate
pip install --upgrade pip
pip install ansible
pip install ansible-lint
pip install yamllint

if [ ! -f vars/main.yml ]; then
    echo -e "\e[1;31mPlease define your custom configuration at $(pwd)/vars/main.yml\e[0m"
    exit 2
fi

echo "setup linux client with ansible"
source ~/.ansible-venv/bin/activate
ansible-playbook playbooks/setup.yml --diff -v -e @vars/main.yml
