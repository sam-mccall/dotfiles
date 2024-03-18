export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export BROWSER=google-chrome
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/openssh_agent

if [[ -e "$HOME/.bash_profile.local" ]]; then
  source "$HOME/.bash_profile.local"
fi
if [[ -e "$HOME/.cargo/env" ]]; then
  . "$HOME/.cargo/env"
fi
for e in hx nvim vi; do
  if [[ -x "$(command -v $e)" ]]; then
    export EDITOR="$e"
    break
  fi
done

# Run fish if this is an interactive session not inside fish already.
if echo $- | grep -q 'i' && [[ "$(ps -o comm= $PPID)" != "fish" ]] && [[ -x /usr/bin/fish ]] && [[ -z "$NOFISH" ]]; then
  exec /usr/bin/fish -i
fi
