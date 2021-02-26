# dotfiles

These are my dotfiles. There are many like it, but these ones are mine. My dotfiles are my best friend. They are my life. I must master them as I master my life.

My dotfiles, without me, are useless. Without my dotfiles I am useless.

## Setting up

### 1. Clone the repo

Start by cloning this repo somewhere:

```
git clone https://gitlab.com/jonathanwalter/dotfiles.git
```

### 2. Change the shell

Run the setup script for your platform of choice.

**OS X**

```
bash dotfiles/zsh/install-osx.sh
```

**Ubuntu**

```
bash dotfiles/zsh/install-ubuntu.sh
```

### 3. Make the links

`make-links.sh` sets up symlinks to the needed files and directories. It is probably a good idea to run it from your home dir.

```
bash dotfiles/make-links.sh
```

Log out or reboot for changes to take effect.

### 4. Vim setup

Clone Vundle `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

Install vim plugins `vim +PluginInstall +qall`
