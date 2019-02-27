DOT_FILES=( .config .hyper.js .vimrc .xinitrc .xprofile .Xresources .zshenv .zshrc )
for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
