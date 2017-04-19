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

echo "Linking .tmux.conf to $(dirname $(realpath $0))/tmux.conf"
ln -s $DIR/tmux.conf ~/.tmux.conf


################# .vimrc
if [[ -d ~/.vimrc && ! -h ~/.vimrc ]]; then
  echo Backing up old .vimrc to ~/.vimrc.$DATE 
  mv ~/.vimrc ~/.vimrc.$DATE
elif [[ -h ~/.vimrc ]]; then
  echo "Unlinking old link"
  unlink ~/.vimrc
fi

echo "Linking .vimrc to $(dirname $(realpath $0))/vim/vimrc"
ln -s $DIR/vim/vimrc ~/.vimrc

################# .vim
if [[ -d ~/.vim && ! -h ~/.vim ]]; then
  echo Backing up old .vim to ~/.vim.$DATE 
  mv ~/.vim ~/.vim.$DATE
elif [[ -h ~/.vim ]]; then
  echo "Unlinking old link"
  unlink ~/.vimrc
fi

echo "Linking .vimrc to $(dirname $(realpath $0))/vim/vim"
ln -s $DIR/vim/vim ~/.vim

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
