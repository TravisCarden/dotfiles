#@IgnoreInspection BashAddShebang

function alert {
  time eval $@
  if [ $? -eq 0 ]; then
    say Done
  else
    say Error
  fi
}

function source_if_exists() {
  test -e $1 && source $1
}

# Aliases.
alias dr=drush
alias la='ls -a'
alias lal='ls -al'
alias ll='ls -l'
# cd to the root of a Git repository.
# See https://stackoverflow.com/a/957978/895083.
alias git-root='cd "$(git rev-parse --show-toplevel)"'

# Prompt.
source_if_exists ~/Projects/Work/drush/drush.complete.sh
source_if_exists `brew --prefix`/etc/bash_completion.d/git-prompt.sh
source_if_exists ~/.drush/drush.prompt.sh
source_if_exists ~/.iterm2_shell_integration.bash
source_if_exists /usr/local/opt/nvm/nvm.sh

# Completion.
source_if_exists `brew --prefix`/etc/bash_completion

# History. See bash(1).
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend

# Path.
export PATH="/usr/local/sbin:$PATH" # Homebrew

# Node.
export NVM_DIR="$HOME/.nvm"

# Non-public features.
source_if_exists ~/Dropbox/.bash_secret

# BLT "alias". See https://github.com/acquia/blt.
function blt() {
  if [ "`git rev-parse --show-cdup 2> /dev/null`" != "" ]; then
    GIT_ROOT=$(git rev-parse --show-cdup)
  else
    GIT_ROOT="."
  fi

  if [ -f "$GIT_ROOT/vendor/bin/blt" ]; then
    $GIT_ROOT/vendor/bin/blt "$@"
  else
    echo "You must run this command from within a BLT-generated project repository."
    return 1
  fi
}
