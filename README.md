# dotfiles

This is my dotfiles (and scripts to set it up) for the following configs.

`.gitignore` and `.gitconfig`
for git configuration

`.tmux.conf`
for tmux

`.vimrc` and `.vim/`
for vim

`.zshrc`, `.zgen` and `.alias`
for the shell

`hammerspoon`
(OS X only)


## Setting up

### Clone the repo

Start by cloning this repo somewhere:
```
git clone https://gitlab.com/jonathanwalter/dotfiles.git
```

### Change the shell

Run the setup script for your platform of choice.

**OS X**
```
bash dotfiles/zsh/install-osx.sh
```

**Ubuntu**
```
bash dotfiles/zsh/install-ubuntu.sh
```

### Make the links

`make-links.sh` sets up symlinks to all the needed files and directories. It is probably a good idea to run it from your home dir. 

```
bash dotfiles/make-links.sh
```

Log out or reboot for changes to take effect.

### Vim setup

Clone Vundle `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

Install vim plugins `vim +PluginInstall +qall`
