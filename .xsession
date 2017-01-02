export PATH="$PATH:$HOME/bin"
xkbcomp $HOME/keyboard.xkb $DISPLAY
xscreensaver -no-splash &
xss-lock -- xscreensaver-command -lock &
feh --bg-center $HOME/background.jpg &
xset r rate 300 25
stalonetray &
nm-applet &
if [[ -e "$HOME/.xsession.local" ]]; then
  source "$HOME/.xsession.local"
fi
exec xmonad

