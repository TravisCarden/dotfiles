#!/usr/bin/env bash

# NAME
#     .drush_prompt - Drush-aware bash prompt.
#
# SYNOPSIS
#     if [ -f ~/.drush_prompt ]; then
#       . ~/.drush_prompt
#     fi
#
# DESCRIPTION
#     .drush_prompt displays Git repository and Drush alias status in your prompt. See
#     https://github.com/drush-ops/drush/blob/master/examples/example.prompt.sh.

if [ -n "$(type -t __git_ps1)" ] && [ "$(type -t __git_ps1)" = function ] && [ "$(type -t __drush_ps1)" ] && [ "$(type -t __drush_ps1)" = function ]; then

  COLOR_BLUE='\[\e[34m\]'
  COLOR_CYAN='\[\e[36m\]'
  COLOR_GREEN='\[\e[32m\]'
  COLOR_LIGHT_GRAY='\[\e[37m\]'
  COLOR_MAGENTA='\[\e[35m\]'
  COLOR_RED='\[\e[31m\]'
  COLOR_WHITE='\[\e[97m\]'
  COLOR_YELLOW='\[\e[33m\]'
  COLOR_NONE='\[\e[39m\]'

  # Prints succinct details about the current working directory in the following form:
  # [GIT_REPO_ROOT_DIRNAME/]CWD_DIRNAME.
  function dir_details() {
    # If within a Git repository but not its root directory.
    git rev-parse &> /dev/null
    if [ $? == 0 ] && [ $(git rev-parse --show-toplevel) != $(pwd) ]; then
      pushd "$(git rev-parse --show-cdup)" > /dev/null
      DIR_DETAILS=${PWD##*/}"/"
      popd > /dev/null
    fi

    DIR_DETAILS=${DIR_DETAILS}${PWD##*/}
    if [ -z ${DIR_DETAILS} ]; then
      pwd
    else
      echo ${DIR_DETAILS}
    fi
  }

  __drush_ps1_colorize_alias() {
    case "$__DRUPAL_SITE" in
      *.live|*.prod) local ENV_COLOR="$COLOR_RED" ;;
      *.stage|*.test) local ENV_COLOR="$COLOR_YELLOW" ;;
      *.local) local ENV_COLOR="$COLOR_GREEN" ;;
      *) local ENV_COLOR="$COLOR_BLUE" ;;
    esac
    __DRUPAL_SITE="${ENV_COLOR}${__DRUPAL_SITE}${COLOR_NONE}"
  }

  GIT_PS1_SHOWCOLORHINTS=true
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM=auto
  GIT_PS1_SHOWSTASHSTATE=true
  DRUSH_PS1_SHOWCOLORHINTS=true

  export PROMPT_COMMAND='__git_ps1 "${COLOR_BLUE}$(date +%r) \w${COLOR_NONE}" "$(__drush_ps1 " [%s]") \\\$ "'

fi
