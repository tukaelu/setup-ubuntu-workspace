setup-ubuntu-workspace
---

🐧 Setup my ubuntu workspace.

## Getting started

### Install basic packages & Linuxbrew & Ansible

```
## Install packages & linuxbrew
sudo apt install build-essential curl git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

## Add PATH env
test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
test -r ~/.bash_profile && echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.bash_profile
echo "export PATH='$(brew --prefix)/bin:$(brew --prefix)/sbin'":'"$PATH"' >>~/.profile

## Install Ansible
brew install ansible
```

### Clone this repository

```
git clone git@github.com:tukaelu/setup-ubuntu-workspace.git && cd setup-ubuntu-workspace
ansible-playbook setup.yml -vv -i hosts
```
