xrandr --dpi 120 # TODO: Laptop-only?
xkbcomp $HOME/keyboard.xkb $DISPLAY
xscreensaver -no-splash &
xss-lock -- xscreensaver-command -lock &
feh --bg-center $HOME/Pictures/south-island-new-zealand-24517-2560x1600.jpg &
xset r rate 300 25
stalonetray &
nm-applet &
exec xmonad

