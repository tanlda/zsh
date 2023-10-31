#!/bin/bash

# Append sources to .zshrc
if grep -q "ZSH_PATH" "$HOME/.zshrc"; then
  echo "ZSH_PATH already exists"
else
  CUSTOM_PATH=$(pwd)/custom
  cat >> $HOME/.zshrc << EOF

# ZSH custom sources
ZSH_PATH=$CUSTOM_PATH
source \$ZSH_PATH/utils.zsh
source \$ZSH_PATH/bash.zsh
source \$ZSH_PATH/fix.zsh
source \$ZSH_PATH/git.zsh
source \$ZSH_PATH/infra.zsh
source \$ZSH_PATH/node.zsh
source \$ZSH_PATH/python.zsh
source \$ZSH_PATH/vendors.zsh
source \$ZSH_PATH/works.zsh
EOF
  echo "ZSH_PATH has been added to .zshrc"
fi

function link() {
  if [[ -f $1 ]]; then
    echo "$1 already exists"
  else
    ln -s $HOME/$1 $1
    echo "$1 has been created"
  fi
}

link .zshrc
link .bashrc
link .gitconfig
