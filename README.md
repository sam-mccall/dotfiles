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
   - interception-tools

Manual installs:

   - `sudo apt install libyaml-cpp-dev`
   - https://gitlab.com/interception/linux/plugins/dual-function-keys.git
   - `mkdir -p ~/.config/systemd/user/default.target.wants`
   - `ln -s /usr/lib/systemd/user/ssh-agent.service ~/.config/systemd/user/default.target.wants/`

Hyprland:
   - `sudo apt install libtomlplusplus-dev libpango1.0-dev libzip-dev librsvg2-dev libliftoff-dev libgbm-dev libdisplay-info-dev hwdata libsystemd-dev`
   - https://github.com/hyprwm/hyprlang.git
   - https://github.com/hyprwm/hyprcursor.git

Set up global things:

    symlinks.sh
    sudo systemctl enable udevmon

And custom installs:

   - ~/bg.jpg
