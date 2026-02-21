# Source secrets from local file (not tracked by git)
[ -f "$HOME/.zshenv.local" ] && source "$HOME/.zshenv.local"

. "$HOME/.cargo/env"

# For non-interactive session
eval "$(zoxide init zsh)"
