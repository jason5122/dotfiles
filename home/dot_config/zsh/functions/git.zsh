alias gw='git worktree'

gwa() {
  local branch="${1:?usage: gwa <branch> <base>}"
  local base="${2:?usage: gwa <branch> <base>}"
  git worktree add --no-track -b "$branch" "./$branch" "$base"
}

gwr() {
  local branch="${1:?usage: gwr <branch>}"
  git worktree remove "$branch" && git branch -D "$branch"
}

gwi() (
  set -euo pipefail
  remote="${1:?usage: gwi <remote-url>}"
  if [[ -e .bare || -e .git ]]; then
    echo "gwi: .bare or .git already exists" >&2
    exit 1
  fi
  git init --bare .bare
  echo 'gitdir: ./.bare' >.git
  cd .bare
  git remote add origin "$remote"
  git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
  git fetch origin
)
