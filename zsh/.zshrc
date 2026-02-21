set -o vi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
eval "$(nodenv init - zsh)"
eval "$(~/.local/bin/mise activate zsh)"
eval "$(sheldon source)"

export PATH="$HOME/.local/bin:$PATH"

source $HOME/.zsh/alias.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ksterx/Documents/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/ksterx/Documents/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ksterx/Documents/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/ksterx/Documents/google-cloud-sdk/completion.zsh.inc'; fi

export PATH="$HOME/.claude/bin:$PATH"

# bun completions
[ -s "/Users/ksterx/.bun/_bun" ] && source "/Users/ksterx/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Added by Antigravity
export PATH="/Users/ksterx/.antigravity/antigravity/bin:$PATH"

alias claude-mem='bun "/Users/ksterx/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'
