# Sakura sets TERM=xterm, but actually is more like xterm-256color.
if [[ "$(ps -o comm= $PPID)" == "sakura" ]]; then
  export TERM=xterm-256color
fi
# Run fish if this is an interactive session not inside fish already.
if echo $- | grep -q 'i' && [[ "$(ps -o comm= $PPID)" != "fish" ]] && [[ -x /usr/local/bin/fish ]]; then
  exec /usr/local/bin/fish -i
fi
