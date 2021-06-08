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
alias c="composer"
alias gito="git show-branch; echo; git status"
alias dr=drush
alias la='ls -a'
alias lal='ls -al'
alias ll='ls -l'
alias orca="COLUMNS=$(tput cols) /Users/travis.carden/Projects/acquia/orca/bin/orca"
alias composer-stage="COLUMNS=$(tput cols) /Users/travis.carden/Projects/autoupdates/composer-stager/bin/composer-stage"
alias cs="composer-stage"
# cd to the root of a Git repository.
# See https://stackoverflow.com/a/957978/895083.
alias git-root='cd "$(git rev-parse --show-toplevel)"'

# Prompt.
source_if_exists `brew --prefix`/etc/bash_completion.d/git-prompt.sh
source_if_exists ~/.drush/drush.prompt.sh

# Completion.
source_if_exists `brew --prefix`/etc/bash_completion

# History. See bash(1).
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend

# Non-public features.
source_if_exists ~/.bash_secret

# General.
export CLICOLOR=1
export BASH_SILENCE_DEPRECATION_WARNING=1

# Composer.
export PATH="$PATH:$HOME/.composer/vendor/bin"

# GPG.
export GPG_TTY=$(tty)

# Homebrew.
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Homeshick.
export HOMESHICK_DIR=/usr/local/opt/homeshick
source_if_exists /usr/local/opt/homeshick/homeshick.sh

# iTerm.
source_if_exists ~/.iterm2_shell_integration.bash

# SQLite
export PATH="/usr/local/opt/sqlite/bin:$PATH"

export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
