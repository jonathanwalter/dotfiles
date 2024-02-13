alias cim='vim'
alias svenv='source venv/bin/activate'
alias mkvenv="python3 -m venv venv && source venv/bin/activate"

alias bubo="brew update && brew outdated"
alias bugr="brew upgrade && brew outdated"

if [ -n "$ZSH_VERSION" ]; then
    alias h='history -i'
fi

if which lsd > /dev/null 2>&1; then
    alias ls='lsd'
    alias l='ls -l'
    alias la='ls -A'
    alias lla='ls -lA'
    alias lt='ls --tree'
fi

if which bat > /dev/null 2>&1; then
    alias cat='bat'
elif which ccat > /dev/null 2>&1; then
    alias cat='ccat'
fi
