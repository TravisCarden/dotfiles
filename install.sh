#!/usr/bin/env bash

chsh -s /bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
rm -r homebrew

brew install ansible

brew install homeshick
homeshick clone TravisCarden/dotfiles

ansible-playbook -i playbooks/hosts playbooks/mac.yml

./.macos
