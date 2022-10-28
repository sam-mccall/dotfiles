export PATH="$PATH:$HOME/bin"
xscreensaver -no-splash &
xss-lock -- xsecurelock &
feh --bg-scale $HOME/background.jpg &
xset r rate 300 25
if [ -f "$HOME/.xsession.local" ]; then
  source "$HOME/.xsession.local"
fi
export _JAVA_AWT_WM_NONREPARENTING=1
xrdb -merge ~/.Xresources
xkbcomp $HOME/keyboard.xkb $DISPLAY
xcape -t 200 -e "Caps_Lock=Escape;Shift_L=Shift_L|parenleft;Shift_R=Shift_R|parenright"
exec i3

