set -o vi

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.claude/bin:$PATH"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"

# Tool integrations
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
# eval "$(direnv hook zsh)"    # uncomment after: brew install direnv
# eval "$(mise activate zsh)"  # uncomment after: curl https://mise.run | sh

source $HOME/.zsh/alias.zsh
source $(brew --prefix)/share/zsh-abbr/zsh-abbr.zsh

# Completion
fpath+=~/.zfunc; autoload -Uz compinit; compinit
zstyle ':completion:*' menu select
