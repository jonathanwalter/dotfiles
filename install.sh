DIR=$(dirname $0)
DATE=$(date "+%Y-%m-%d-%H.%M")

if [[ -f ~/.zshrc && ! -h ~/.zshrc ]]; then
	echo Backing up old .zshrc to ~/.zshrc.$DATE 
	mv ~/.zshrc ~/.zshrc.$DATE
elif [[ -h ~/.zshrc ]]; then
	echo "Unlinking old link"
	unlink ~/.zshrc
fi

echo "Linking .zshrc to $(dirname $(realpath $0))/zsh/zshrc"
ln -s $DIR/zsh/zshrc ~/.zshrc