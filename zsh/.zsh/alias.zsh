alias cd='z'
alias cat='bat -pp'

# claude
function cc() {
  claude --dangerously-skip-permissions "$@"
}
