---
description: Set up a new PC with all dotfiles dependencies and symlinks
allowed-tools: Bash, Read, AskUserQuestion
---

You are setting up a fresh PC using this dotfiles repository. Follow these steps carefully, checking each tool before installing and skipping anything already present.

## Step 0: Detect environment

- Detect the OS (Linux distro, macOS, WSL)
- Detect the current shell
- Determine the dotfiles repo root (the directory containing this `.claude/` folder)
- Print a summary of the detected environment

## Step 1: Install Zsh (if not the current shell)

- On Ubuntu/Debian: `sudo apt update && sudo apt install -y zsh`
- On Fedora: `sudo dnf install -y zsh`
- On Arch: `sudo pacman -S --noconfirm zsh`
- On macOS: already included
- After installing, ask the user if they want to set zsh as the default shell (`chsh -s $(which zsh)`)

## Step 2: Install Homebrew

- Check if `brew` is available
- If not, install it: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
- On Linux, ensure the shellenv is loaded: `eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"`

## Step 3: Install CLI tools via Homebrew

Install all of these with `brew install`:

| Package | What it is |
|---------|-----------|
| `starship` | Cross-shell prompt |
| `zoxide` | Smart cd replacement |
| `eza` | Modern ls replacement |
| `bat` | Cat with syntax highlighting |
| `btop` | System monitor |
| `fzf` | Fuzzy finder (includes `fzf-tmux`) |
| `tmux` | Terminal multiplexer |
| `neovim` | Modern Vim editor (required by LunarVim) |
| `zsh-abbr` | Zsh abbreviation plugin |
| `jq` | JSON processor |
| `ghq` | Repository management |
| `uv` | Fast Python package manager |

Run: `brew install starship zoxide eza bat btop fzf tmux neovim zsh-abbr jq ghq uv`

Skip any that are already installed.

## Step 4: Install LunarVim

- LunarVim requires Neovim (installed in Step 3), Rust, Node.js, and Python3
- Install via: `LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)`
- Verify with: `lvim --version`

## Step 5: Install Rust and Cargo (optional)

- Check if `cargo` is available
- If not, ask the user if they want to install Rust
- If yes: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y`

## Step 6: Create symlinks

Using the detected dotfiles repo root (`$DOTFILES_ROOT`), create these symlinks. Back up any existing files first by renaming them with a `.backup` suffix.

```
~/.zshrc        -> $DOTFILES_ROOT/zsh/.zshrc
~/.zshenv       -> $DOTFILES_ROOT/zsh/.zshenv
~/.zsh          -> $DOTFILES_ROOT/zsh/.zsh
~/.config/starship.toml -> $DOTFILES_ROOT/starship/starship.toml
~/.config/zsh-abbr/user-abbreviations -> $DOTFILES_ROOT/zsh-abbr/user-abbreviations
~/.config/.tmux.conf    -> $DOTFILES_ROOT/tmux/.tmux.conf
```

Make sure `~/.config`, `~/.config/zsh-abbr` directories exist before creating symlinks.

## Step 7: Create secrets template

If `~/.zshenv.local` does not exist, create it with this template:

```bash
# API keys and tokens (not tracked by git)
# Uncomment and fill in as needed:
# export OPENAI_API_KEY=""
# export ANTHROPIC_API_KEY=""
# export GEMINI_API_KEY=""
```

## Step 8: Optional tools

Ask the user which optional tools they want to install (multi-select):

- **Claude CLI** (`npm install -g @anthropic-ai/claude-code` or `brew install claude`)
- **Conda/Miniconda** (https://docs.conda.io/en/latest/miniconda.html)
- **Docker** (platform-dependent)
- **nodenv** (`brew install nodenv`)
- **direnv** (`brew install direnv`)
- **mise** (`curl https://mise.run | sh`)

## Step 9: Verify

After everything is installed:

1. Run `starship --version`, `zoxide --version`, `eza --version`, `bat --version`, `btop --version`, `fzf --version`, `fzf-tmux --version`, `tmux -V`, `nvim --version`, `lvim --version`, `jq --version`, `ghq --version`, `uv --version` to verify installations
2. Check all symlinks point to the correct targets
3. Print a summary of what was installed and what was skipped
4. Remind the user to:
   - Fill in `~/.zshenv.local` with their API keys
   - Open a new terminal or run `exec zsh` to load the new configuration
