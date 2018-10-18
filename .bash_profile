export PATH="$HOME/bin:$PATH"
export EDITOR="vim"
export BROWSER=google-chrome

# Sakura sets TERM=xterm, but actually is more like xterm-256color.
if [[ "$(ps -o comm= $PPID)" == "sakura" ]]; then
  export TERM=xterm-256color
fi
if [[ -e "$HOME/.bash_profile.local" ]]; then
  source "$HOME/.bash_profile.local"
fi
# Run fish if this is an interactive session not inside fish already.
if echo $- | grep -q 'i' && [[ "$(ps -o comm= $PPID)" != "fish" ]] && [[ -x /usr/bin/fish ]]; then
  exec /usr/bin/fish -i
fi
