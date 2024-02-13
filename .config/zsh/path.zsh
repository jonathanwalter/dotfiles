# Homebrew path
if which brew > /dev/null 2>&1; then
  export PATH="$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH"
fi

# Go paths
if which go > /dev/null 2>&1; then
  export GOPATH=$(go env GOPATH)
  export PATH=$PATH:$(go env GOPATH)/bin
fi

# add ~/bin and ~/.local/bin to path
test -d ~/bin        && export PATH="$HOME/bin:$PATH"
test -d ~/.local/bin && export PATH="$HOME/.local/bin:$PATH"
