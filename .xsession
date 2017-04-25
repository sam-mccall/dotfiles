export PATH="$PATH:$HOME/bin"
xscreensaver -no-splash &
xss-lock -- xscreensaver-command -lock &
feh --bg-scale $HOME/background.jpg &
xset r rate 300 25
stalonetray &
nm-applet &
if [[ -e "$HOME/.xsession.local" ]]; then
  source "$HOME/.xsession.local"
fi
export _JAVA_AWT_WM_NONREPARENTING=1
exec xmonad

