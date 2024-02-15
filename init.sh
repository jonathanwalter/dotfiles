# install stow if needed
if ! which stow > /dev/null 2>&1; then
  # linux
  if test $(uname) = "Linux"; then
    which apt > /dev/null 2>&1 && apt install stow
    which dnf > /dev/null 2>&1 && dnf install stow
  fi

  # macos
  if test $(uname) = "Darwin"; then
    which brew > /dev/null 2>&1 && brew install stow
  fi
fi

# install zsh if needed
if test ${SHELL} != "/bin/zsh"; then
    # linux
    if test $(uname) = "Linux"; then
      if ! which zsh > /dev/null 2>&1; then
        which apt > /dev/null 2>&1 && apt install zsh
        which dnf > /dev/null 2>&1 && dnf install zsh
      fi
      chsh -s /bin/zsh
    fi

    # macos
    if test $(uname) = "Darwin"; then
      if ! which zsh > /dev/null 2>&1; then
        which brew > /dev/null 2>&1 && brew install zsh
      fi
      echo /bin/zsh | sudo tee -a /etc/shells && chsh -s /bin/zsh
    fi
fi

stow . -t $HOME --restow --dotfiles

if test ! -r ~/.config/tmux/plugins/tpm; then
  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
  ~/.config/tmux/plugins/tpm/bin/install_plugins
fi


if ! test -r ~/.vim/bundle/Vundle.vim; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall
