alias cd='z'
alias cat='bat -pp'

# claude
function cc() {
  claude --dangerously-skip-permissions "$@"
}

wrepo() {
  builtin cd "$(
    /opt/homebrew/bin/gwq list --json -g \
    | /usr/bin/jq -r '.[].path' \
    | /opt/homebrew/bin/fzf-tmux -p
  )"
}
