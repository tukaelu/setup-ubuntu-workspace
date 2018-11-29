setup-ubuntu-workspace
---

🐧 Setup my ubuntu workspace.

## Getting started

### Install basic packages & Ansible

```
## Install packages
sudo apt install build-essential curl git python

## Upgrade pip
pip install --upgrade pip

## Add PATH env
echo 'export PATH="~/.local/bin:$PATH"' >> ~/.profile && . ~/.profile

## Install Ansible
pip install ansible
```

### Clone this repository

```
git clone git@github.com:tukaelu/setup-ubuntu-workspace.git && cd setup-ubuntu-workspace
ansible-playbook setup.yml -vv -i hosts
```
