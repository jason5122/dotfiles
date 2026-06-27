# Bash command conventions

## One command per call
- Run exactly **one** command per Bash tool call.
- Do **not** chain commands with `;`, `&&`, `||`, or newlines to group otherwise-independent steps. Each step gets its own Bash call so it can be matched against the permission allowlist and approved automatically.
- Pipes (`|`) are allowed **only** when they form one genuine logical command (e.g. `grep -n foo file | head`). Do not use a pipe to staple unrelated commands together.

## No echo headers
- Do **not** emit `echo "=== ... ==="` (or similar) section labels to annotate or separate output. Run the commands separately instead; their results come back as distinct blocks already.
- Do not add decorative banners, separators, or progress narration to command output.

## Search scope
- Scope all file searches to the current working directory (`.`) first. The user is normally `cd`'d into the relevant repository, so an unqualified filename refers to a file in this repo.
- Never search `$HOME`, `/Users/...`, or other absolute paths outside the project unless explicitly told to.
- If a file genuinely cannot be found within the repo, say so rather than broadening the search to the whole filesystem.

## Why
Chained commands are not statically analyzable, so they fall through to manual approval even when every individual command is allowlisted. Single, repo-scoped commands match the allowlist and run without prompting.
