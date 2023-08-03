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
source \$ZSH_PATH/alias.zsh
source \$ZSH_PATH/dirs.zsh
source \$ZSH_PATH/git.zsh
source \$ZSH_PATH/infra.zsh
source \$ZSH_PATH/node.zsh
source \$ZSH_PATH/python.zsh
source \$ZSH_PATH/utils.zsh
source \$ZSH_PATH/works.zsh
EOF
  echo "ZSH_PATH has been added to .zshrc"
fi

# Create symlink for .zshrc
if [[ -f .zshrc ]]; then
  echo ".zshrc already exists"
else
  ln -s $HOME/.zshrc .zshrc
  echo ".zshrc has been created"
fi

# Create symlink for .gitconfig
if [[ -f .gitconfig ]]; then
  echo ".gitconfig already exists"
else
  ln -s $HOME/.gitconfig .gitconfig
  echo ".gitconfig has been created"
fi