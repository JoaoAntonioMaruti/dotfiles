export ZSH="$HOME/.oh-my-zsh"
export PATH=~/Developer/flutter/bin:$PATH

ZSH_THEME="funky"

preexec () {
  local TIME=`date +"[%H:%M:%S] "`
  local zero='%([BSUbfksu]|([FK]|){*})'
  local PROMPTLEN=${#${(S%%)PROMPT//$~zero/}}
  echo " \033[1A\033[$(($(echo -n $1 | wc -m)+$PROMPTLEN))C $fg[blue]⌚️ ${TIME}$reset_color"
}

plugins=(git zsh-autosuggestions zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.bash_profile

source $HOME/.cargo/env

export PATH="$HOME/.cargo/bin:$PATH"

export PATH=/opt/homebrew/bin:/Users/joaoantoniomarut/.nvm/versions/node/v14.19.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:/usr/local/bin

export PNPM_HOME="/Users/joaoantoniomarut/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
