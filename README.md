These are my dotfiles. There are many like them, but these ones are mine.

    alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    git clone --bare git@github.com:sam-mccall/dotfiles.git $HOME/.cfg
    cfg config status.showUntrackedFiles no
    cfg checkout

Extra things (automate?):

   - symlink things in ~/.global into place
   - `sysctl enable udevmon`

The following packages are required:

   - sway
   - i3-status
   - fish
   - suckless-tools
   - foot
   - udevmon
   - wireless-tools

And custom installs:

   - ~/bg.jpg
