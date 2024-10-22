# asdf
# test -e "/usr/local/opt/asdf/libexec/asdf.sh" && source "/usr/local/opt/asdf/libexec/asdf.sh"

# iterm shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# load zshrc_local
test -e "${HOME}/.zshrc_local" && source "${HOME}/.zshrc_local"

# load alias file
test -e "${HOME}/.alias" && source "${HOME}/.alias"

# load local alias file
test -e "${HOME}/.alias_local" && source "${HOME}/.alias_local"

# fzf
test -e "${HOME}/.fzf.zsh" && source ~/.fzf.zsh

# activate mise
test -e "${HOME}/.local/bin/mise" && eval "$(~/.local/bin/mise activate zsh)"
