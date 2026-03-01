# Source secrets from local file (not tracked by git)
[ -f "$HOME/.zshenv.local" ] && source "$HOME/.zshenv.local"

# Cargo
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
