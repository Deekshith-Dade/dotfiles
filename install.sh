#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

link() {
  local src="$DOTFILES/$1"
  local dst="$HOME/$2"

  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mkdir -p "$BACKUP/$(dirname "$2")"
    mv "$dst" "$BACKUP/$2"
    echo "backed up existing $dst -> $BACKUP/$2"
  fi

  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "linked $dst -> $src"
}

link zshrc            .zshrc
link zprofile         .zprofile
link bashrc           .bashrc
link profile          .profile
link vimrc            .vimrc
link tmux.conf.local  .tmux.conf.local
link config/nvim      .config/nvim
link config/ghostty   .config/ghostty

echo
echo "done. backups (if any) in $BACKUP"
