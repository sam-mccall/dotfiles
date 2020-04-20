if [ -f "$HOME/.xsession.local" ]; then
  source "$HOME/.xsession.local"
fi
export PATH="$PATH:$HOME/bin"
xscreensaver -no-splash &
xss-lock -- xscreensaver-command -lock &
feh --bg-scale $HOME/background.jpg &
xset r rate 300 25
stalonetray &
nm-applet &
export _JAVA_AWT_WM_NONREPARENTING=1
exec xmonad

