xrandr --dpi 120 # TODO: Laptop-only?
xkbcomp $HOME/keyboard.xkb $DISPLAY
xscreensaver -no-splash &
xss-lock -- xscreensaver-command -lock &
feh --bg-center $HOME/background.jpg &
xset r rate 300 25
stalonetray &
nm-applet &
exec xmonad

