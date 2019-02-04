umask 022
limit coredumpsize 0
bindkey -d

# Return if zsh is called from Vim
if [[ -n $VIMRUNTIME ]]; then
  return 0
fi

# tmux_automatically_attaches tmux session
# automatically when you are in zsh
if [[ -n ~/bin/tmuxx ]]; then
  ~/bin/tmuxx
fi

if [[ -f ~/.zplug/init.zsh ]]; then
  export ZPLUG_LOADFILE=~/.zsh/zplug.zsh
  source ~/.zplug/init.zsh

  if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
    echo
  fi
  zplug load
fi

if [[ -f ~/.zshrc.local ]]; then
  source ~/.zshrc.local
fi
