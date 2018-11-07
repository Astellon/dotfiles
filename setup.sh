DOT_FILES=( .zshrc .hyper.js )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
