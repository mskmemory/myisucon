#!/bin/bash

# Check username.
USER=`whoami`


# If this user is not root, add 'sudo' to 'apt install' command.
if [ ! $USER = 'root' ]; then
  SUDO='sudo'
fi

$SUSO apt install zsh

chsh -s $(which zsh)