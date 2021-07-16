#!/usr/bin/env bash

mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew

ansible-playbook -i playbooks/hosts playbooks/mac.yml

xcode-select --install

./.macos
