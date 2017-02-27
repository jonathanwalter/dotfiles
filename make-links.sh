DIR=$(dirname $(realpath $0)) #$(dirname $0)
DATE=$(date "+%Y-%m-%d-%H.%M")

################# zshrc
if [[ -f ~/.zshrc && ! -h ~/.zshrc ]]; then
	echo Backing up old .zshrc to ~/.zshrc.$DATE 
	mv ~/.zshrc ~/.zshrc.$DATE
elif [[ -h ~/.zshrc ]]; then
	echo "Unlinking old link"
	unlink ~/.zshrc
fi

echo "Linking .zshrc to $(dirname $(realpath $0))/zsh/zshrc"
ln -s $DIR/zsh/zshrc ~/.zshrc


################# zgen
if [[ -d ~/.zgen && ! -h ~/.zgen ]]; then
	echo Backing up old .zgen to ~/.zgen.$DATE 
	mv ~/.zgen ~/.zgen.$DATE
elif [[ -h ~/.zgen ]]; then
	echo "Unlinking old link"
	unlink ~/.zgen
fi

echo "Linking .zgen to $(dirname $(realpath $0))/zsh/zgen"
ln -s $DIR/zsh/zgen ~/.zgen


################# tmux.conf
if [[ -d ~/.tmux.conf && ! -h ~/.tmux.conf ]]; then
  echo Backing up old .tmux.conf to ~/.tmux.conf.$DATE 
  mv ~/.tmux.conf ~/.tmux.conf.$DATE
elif [[ -h ~/.tmux.conf ]]; then
  echo "Unlinking old link"
  unlink ~/.tmux.conf
fi

echo "Linking .tmux.conf to $(dirname $(realpath $0))/zsh/tmux.conf"
ln -s $DIR/zsh/tmux.conf ~/.tmux.conf




# osx specifics
if [[ $(uname) = "Darwin" ]]; then
################# hammerspoon
  if [[ -d ~/.hammerspoon && ! -h ~/.hammerspoon ]]; then
    echo Backing up old .hammerspoon to ~/.hammerspoon.$DATE 
    mv ~/.hammerspoon ~/.hammerspoon.$DATE
  elif [[ -h ~/.hammerspoon ]]; then
    echo "Unlinking old link"
    unlink ~/.hammerspoon
  fi

  echo "Linking .hammerspoon to $(dirname $(realpath $0))/hammerspoon"
  ln -s $DIR/hammerspoon ~/.hammerspoon
fi