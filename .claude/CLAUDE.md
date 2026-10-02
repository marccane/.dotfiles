# Global Claude Code Instructions

## Linux Commands

Never execute commands with `sudo`. If a command requires elevated privileges, tell the user the exact command to run and let them execute it themselves.

## Git

Commit finished work automatically, on the default branch, without asking first and without opening a feature branch. Match the repository's existing commit message style.

Do not push. Pushing stays an explicit request, so there is a review point before anything reaches a remote. Individual projects may override this and ask for pushing to be automatic too; that belongs in the project's own instructions.

This applies to work that is complete and verified. Nothing half-finished gets committed, and what was committed is always reported.
