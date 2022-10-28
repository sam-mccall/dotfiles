These are my dotfiles. There are many like them, but these ones are mine.

    alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    git clone --bare git@github.com:sam-mccall/dotfiles.git $HOME/.cfg
    cfg config status.showUntrackedFiles no
    cfg checkout

The following packages are required:

   - i3
   - fish
   - suckless-tools
   - feh
   - xscreensaver
   - rxvt-unicode-256color
   - xss-lock
   - xcape
   - wireless-tools

And custom installs:

   - ~/background.jpg
   - [Source Code Pro](https://github.com/adobe-fonts/source-code-pro)
