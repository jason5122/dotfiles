# dotfiles

## Setup

[One-line Chezmoi binary install](https://www.chezmoi.io/install/#one-line-binary-install):

```bash
sh -c "$(curl -fsLS https://get.chezmoi.io/lb)" -- init --ssh jason5122
```

## Completions

Completions that are not managed by Homebrew need to be manually generated:

```bash
mkdir -p "$ZDOTDIR/completions"
rustup completions zsh > "$ZDOTDIR/completions/_rustup"
rustup completions zsh cargo > "$ZDOTDIR/completions/_cargo"
dprint completions zsh > "$ZDOTDIR/completions/_dprint"
runpodctl completion zsh > "$ZDOTDIR/completions/_runpodctl"
uv generate-shell-completion zsh > "$ZDOTDIR/completions/_uv"
```
