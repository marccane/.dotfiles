# Global Claude Code Instructions

## Linux Commands

Never execute commands with `sudo`. If a command requires elevated privileges, tell the user the exact command to run and let them execute it themselves.

## Git

Commit finished work automatically, on the default branch, without asking first and without opening a feature branch. Match the repository's existing commit message style.

Do not push. Pushing stays an explicit request, so there is a review point before anything reaches a remote. Individual projects may override this and ask for pushing to be automatic too; that belongs in the project's own instructions.

This applies to work that is complete and verified. Nothing half-finished gets committed, and what was committed is always reported.

## Shell aliases and zsh quirks

The Bash tool runs **zsh** with the user's aliases and functions loaded: about 400 aliases from `~/.aliases` and the oh-my-zsh git plugin. Bypass any alias with `command X` or `\X`. Audited 2026-10-28.

**Commands that hang.** They prompt for a y/n answer. With no TTY they block until the timeout.
- `mv='mv -i'` and `cp='cp -i'` prompt before overwriting. Use `command mv -f` / `command cp -f`.
- `rm='rm -I'` prompts when removing more than 3 files or removing recursively. Use `command rm`.

**Changed behaviour**
- `make=~/.scripts/make`.
  - It runs the real make only when there's a Makefile in cwd or when given `-C`/`-f`.
  - Otherwise it walks up to a known project (PlatformIO, `~/projects/stm32h5` CMake, `~/aio/EVB_Firmware`) and builds that.
  - `make flash` flashes hardware: on the EVB that's nrfjprog `--chiperase`. Never run `make flash` or `make monitor` unasked.
  - Use `command make` for plain make.
- `pio='~/.platformio/penv/bin/pio '`: the trailing space means the next word is alias-expanded too.
- `file='file -L'` follows symlinks.
- `objdump='objdump -M intel'`: for ARM use `arm-none-eabi-objdump` or `command objdump`.
- `dd='dd status=progress'` prints progress to stderr. `shred='shred -n1 --remove=wipe'` also deletes the file.
- A `git` function makes `git clone` always add `--recursive`. `history=omz_history`.
- Short names that are commands:
  - `_='sudo '` — never use.
  - `please=sudo`, `c=cat`, `g=git`, `py=python`, `sl=ls`, `rd=rmdir`, `code=codium`.
  - `1`..`9` run `cd -N`, and `-` runs `cd -`.
  - `autocd` is on: a bare directory name typed as a command cds into it.

**Aliases that push or destroy.** Never run these without an explicit request.
- Push:
  - `pushTxts` commits and pushes `~/txts`, then runs `pushClaudeProjects`.
  - `pushClaudeProjects` runs add/commit/push on `~/.claude/projects`, which holds memory and transcripts.
  - `gp`, `ggpush`, `gpf`, `gpf!`, `gpsup`, `gpoat`, `dfp`, and `pushTestDelsTagsJarToWindowsVM`.
- Destructive: `gpristine`, `gwipe`, `grhh`, `groh`, `gbgD`, `gclean`, `gwip`/`gunwip`.

**Git repos that `git rev-parse` can't see.** These are bare repos with work tree `$HOME`. Check them before saying a file "isn't in git". Run `ls-files` from `$HOME`, because it only lists files under cwd.
- `dotfiles` = `/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME` (branch `feina`).
  - It tracks `~/.aliases`, `~/.zshrc`, and this file.
  - The user often has their own uncommitted hunks there; commit only your own.
- `docs` = `git --git-dir=$HOME/aio/.documents_bare_repo --work-tree=$HOME` (branch `main`, `showUntrackedFiles=no`).
  - It tracks only selected documents under `~/aio`.
- `~/.claude/projects` is an ordinary git repo. The user commits it in bulk with `pushClaudeProjects`, so don't commit memory edits there.

**zsh quirks**
- `NOMATCH` is on, so an unmatched glob is an error ("no matches found"). `nobareglobqual` is set, so `*(N)` doesn't work. Use `setopt nullglob` or quote the pattern.
- Globs don't expand in scalar assignments: `R=dir/*.a` stays literal. Unquoted `$var` isn't word-split; use `${=var}`.
- Python resolves to pyenv shims; `~/.python-version` = system.
- Claude Code itself (not the user's aliases) wraps `grep` as ugrep with `--ignore-files -I`. In recursive searches this skips `.gitignore`d files and binary files. Use `command grep` for `.a`/`.bin` files or ignored dirs. It also wraps `find` (bfs) and `pkill`.
