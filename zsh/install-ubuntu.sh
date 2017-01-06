# install zgen
git clone https://github.com/tarjoilija/zgen.git $(dirname $(realpath $0))/zgen

# install & change to zsh
sudo apt-get update && sudo apt-get -y install zsh && chsh -s /bin/zsh

echo "You need to reboot for changes to take effect"