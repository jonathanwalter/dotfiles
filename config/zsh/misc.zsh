# linux specific stuff
if [[ $(uname) = "Linux" ]]; then
  source ~/.profile
fi

# osx specific stuff
if [[ $(uname) = "Darwin" ]]; then
  # see https://github.com/mobile-shell/mosh/issues/98#issuecomment-347985957
  export LC_CTYPE=en_US.UTF-8
  export LC_ALL=en_US.UTF-8
fi

# make gpg work
if which gpg > /dev/null 2>&1; then export GPG_TTY=$(tty); fi