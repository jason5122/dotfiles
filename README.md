# dotfiles

## Setup

```bash
# https://www.chezmoi.io/install/#one-line-binary-install
sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply jason5122
```

```bash
chezmoi init --ssh jason5122
```

## Completions

Completions that are not managed by Homebrew need to be manually generated:

```bash
mkdir -p $ZDOTDIR/completions
rustup completions zsh > $ZDOTDIR/completions/_rustup
rustup completions zsh cargo > $ZDOTDIR/completions/_cargo
dprint completions zsh > $ZDOTDIR/completions/_dprint
runpodctl completion zsh > $ZDOTDIR/completions/_runpodctl
```
