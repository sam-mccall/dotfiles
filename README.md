These are my dotfiles. There are many like them, but these ones are mine.

    alias cfg='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    git clone --bare git@github.com:sam-mccall/dotfiles.git $HOME/.cfg
    cfg config status.showUntrackedFiles no
    cfg checkout


Extra things (automate?):

   - symlink things in ~/.global into place
   - `sysctl enable udevmon`

The following packages are required:

   - fish
   - foot
   - wl-clipboard
   - cliphist
   - dunst
   - swayidle
   - swaybg
   - waybar
   - wofi
   - udevmon
   - suckless-tools
   - wireless-tools
   - interception-tools

Manual installs:

   - tap keys
      - https://gitlab.com/interception/linux/plugins/dual-function-keys.git
      - `sudo apt install libyaml-cpp-dev`
      - `sudo cp ~/.config/interception/dual-function-keys.yaml /etc/interception`
      - `sudo cp ~/.config/interception/udevmon.d/dual-function.yaml /etc/interception/udevmon.d`
   - `mkdir -p ~/.config/systemd/user/default.target.wants`
   - `ln -s /usr/lib/systemd/user/ssh-agent.service ~/.config/systemd/user/default.target.wants/`

Set up global things:

    symlinks.sh
    sudo systemctl enable udevmon

And custom installs:

   - ~/bg.jpg
