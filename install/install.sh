#!/bin/bash

# Check username.
USER=`whoami`


# If this user is not root, add 'sudo' to 'apt install' command.
if [ ! $USER = 'root' ]; then
  SUDO='sudo'
fi


# If User want get golang...
echo "Do you want to get Golang? (Please select a number.)"
ans1="yes"
ans2="no"

select ANS in "$ans1" "$ans2"
do
    if [ -z "$ANS" ]; then
        continue
    else
        break
    fi
done

echo You selected $REPLY\) $ANS

if [ ! $ANS = 'yes' ]; then
    git clone https://github.com/syndbg/goenv.git ~/.goenv
    echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.zshrc
    echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(goenv init -)"' >> ~/.zshrc
    echo 'export PATH="$GOROOT/bin:$PATH"' >> ~/.zshrc
    echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.zshrc
    source ~/.zshrc
    goenv install 1.14.0
    goenv global 1.14.0
    source ~/.zshrc
fi


# Get the application names from a text file.
APP_NAMES=`cat requirements.txt`


# Execute install.
$SUDO apt install $APP_NAMES -y
