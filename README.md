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
   - xmobar
   - rxvt-unicode-256color
   - xbacklight
   - xss-lock
   - xcape
   - wireless-tools

And custom installs:

   - ~/background.jpg
   - [Source Code Pro](https://github.com/adobe-fonts/source-code-pro)
   - [re-search](https://github.com/jbonjean/re-search)

Vim setup requires:
  - [pathogen](https://github.com/tpope/vim-pathogen)
  - vim-monokai
  - vim-airline
  - nerdtree
  - vim-bbye
  - vim-fish
  - vim-signify
