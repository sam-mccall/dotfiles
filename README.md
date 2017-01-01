These are my dotfiles. There are many like them, but these ones are mine.

    alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    git clone --bare git@github.com:sam-mccall/dotfiles.git $HOME/.cfg
    cfg config status.showUntrackedFiles no
    cfg checkout

The following packages are required:

   - xmonad
   - fish
   - suckless-tools
   - feh
   - xscreensaver
   - stalonetray

And custom installs:

   - [xcape](https://github.com/alols/xcape)
