# install zgen
git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"

# Change to the Homebrew version of zsh
BREWDIR=$(dirname $(which brew))
echo sudo sh -c "echo '${BREWDIR}/zsh' >> /etc/shells" && chsh -s ${BREWDIR}/zsh