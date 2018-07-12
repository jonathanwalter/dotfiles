#!/bin/bash

DIR=$(dirname $(realpath $0)) #$(dirname $0)
DATE=$(date "+%Y-%m-%d-%H.%M")

function link_files() {
    if [[ -f ~/.$1 && ! -h ~/.$1 ]]; then
        echo Backing up old .$1 to ~/.$1.$DATE 
        mv ~/.$1 ~/.$1.$DATE
    elif [[ -h ~/.$1 ]]; then
        echo "Unlinking old .$1"
        unlink ~/.$1
    fi

    echo "Linking ~/.$1 to $(dirname $(realpath $0))/$2"
    ln -s $DIR/$2 ~/.$1
}

function link_folders() {
    if [[ -d ~/.$1 && ! -h ~/.$1 ]]; then
      echo Backing up old .$1 to ~/.$1.$DATE 
      mv ~/.$1 ~/.$1.$DATE
    elif [[ -h ~/.$1 ]]; then
      echo "Unlinking old .$1"
      unlink ~/.$1
    fi

    echo "Linking .$1 to $(dirname $(realpath $0))/$2"
    ln -s $DIR/$2 ~/.$1
}

link_files "gitignore" "gitignore"
link_files "tmux.conf" "tmux.conf"
link_files "vimrc" "vim/vimrc"
link_folders "vim" "vim/vim"
link_files "zshrc" "zsh/zshrc"
link_folders "zgen" "zsh/zgen"

# osx specifics
if [[ $(uname) = "Darwin" ]]; then
    link_files "hammerspoon" "hammerspoon"
fi
