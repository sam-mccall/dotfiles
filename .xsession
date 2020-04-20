if [ -f "$HOME/.xsession.local" ]; then
  source "$HOME/.xsession.local"
fi
export PATH="$PATH:$HOME/bin"
xscreensaver -no-splash &
xss-lock -- xsecurelock &
feh --bg-scale $HOME/background.jpg &
xset r rate 300 25
if [ -f "$HOME/.xsession.local" ]; then
  source "$HOME/.xsession.local"
fi
export _JAVA_AWT_WM_NONREPARENTING=1
exec i3

