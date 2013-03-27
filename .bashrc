# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

shopt -s cdspell 

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '

# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
#    ;;
#*)
#    ;;
#esac

if [ -f /etc/bash_completion.d/git ] ; then
    . /etc/bash_completion.d/git
fi
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    . /usr/local/etc/bash_completion.d/git-completion.bash
fi
if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
    . /usr/local/etc/bash_completion.d/git-prompt.sh
fi

function set_prompt() {
  if [[ `/usr/bin/id -u` == 0 ]] ; then
    local PROMPT_TAIL='\[\e[31;1m\]\u@\h\[\e[0m\]:\[\e[34;1m\]\w \$ \[\e[0m\]'
  elif type __git_ps1 2>/dev/null | grep -q function; then
    local PROMPT_TAIL='\[\e[32;1m\]\u@\h\[\e[0m\]:\[\e[34;1m\]\w\[\e[35;1m\]$(__git_ps1)\[\e[34;1m\] \$ \[\e[0m\]'
  else
    local PROMPT_TAIL='\[\e[32;1m\]\u@\h\[\e[0m\]:\[\e[34;1m\]\w\[\e[35;1m\]\[\e[34;1m\] \$ \[\e[0m\]'
  fi
  local PROMPT_HEAD='\[\e]0;\u@\h:\w\a\]'

  # if first argument is --no-dynamic then don't change terminal title
  if [ "$1" = "--no-dynamic" ] ; then
    PS1=${PROMPT_TAIL}
    shift
    if [ -n "$*" ] ; then
      echo -ne "\033]0;$*\007"
    fi
  else
    PS1="${PROMPT_HEAD}${PROMPT_TAIL}"
  fi
  export PS1
}

set_prompt

alias hold_title='set_prompt --no-dynamic'
alias set_title='set_prompt --no-dynamic $*'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if which brew; then
    if [ -f `brew --prefix`/etc/autojump ]; then
        . `brew --prefix`/etc/autojump
    fi
fi

# For ninja to work better
export CC=clang
export CXX=clang++
#export CC_COMPILER=clang
#export CXX_COMPILER=clang++
