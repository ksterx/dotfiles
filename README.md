# dotfiles

## Setup

```sh
# Symlink examples
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/.zshenv ~/.zshenv
ln -sf ~/dotfiles/zsh/.zsh ~/.zsh
ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml
```

## Secrets

API キーやトークンなどの秘密情報はリポジトリに含めず、`*.local` ファイルで管理する。

| ファイル | 内容 |
|---|---|
| `~/.zshenv.local` | `OPENAI_API_KEY`, `ANTHROPIC_API_KEY`, `GEMINI_API_KEY` など環境変数 |

`.zshenv` が起動時に `~/.zshenv.local` を自動で `source` するため、シェルの動作に影響はない。

新しい環境をセットアップする際は `~/.zshenv.local` を手動で作成すること。
