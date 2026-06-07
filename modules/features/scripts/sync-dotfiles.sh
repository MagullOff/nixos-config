#!/usr/bin/env bash
set -e  # Exit on error

DOTFILES="$HOME/.dotfiles"

log() {
  echo "[INFO] $1"
}

log "Syncing /etc/nixos → $DOTFILES/nixos"
rsync -a --delete /etc/nixos/ "$DOTFILES/nixos/"

log "Syncing ~/.config → $DOTFILES/config"
rsync -a --delete --exclude 'chromium/' "$HOME/.config/" "$DOTFILES/config"

log "Staging changes in $DOTFILES"
git -C "$DOTFILES" add .

if git -C "$DOTFILES" diff --cached --quiet; then
  log "No changes to commit."
else
  COMMIT_MSG="Update $(date +"%Y-%m-%d %H:%M:%S")"
  log "Committing with message: $COMMIT_MSG"
  git -C "$DOTFILES" commit -m "$COMMIT_MSG"
  log "Pushing to origin/master"
  git -C "$DOTFILES" push --set-upstream origin master
fi

log "Sync complete."
