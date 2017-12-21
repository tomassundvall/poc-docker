#!/bin/bash

if ! command -v ansible > /dev/null; then
    echo "Install Ansible dependencies"
    sudo apt-get install -y -qq \
        python-dev \
        python-yaml \
        python-pip \
        build-essential \
        libssl-dev \
        libffi-dev \
        sshpass
    pip install --upgrade pip
    pip install paramiko pyyaml jinja2 markupsafe
    pip install ansible
fi