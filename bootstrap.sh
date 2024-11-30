#!/usr/bin/env bash

DOTFILES_DIR="${HOME}/.dotfiles"
TARGET_DIR="${HOME}"

mkdir -p "${DOTFILES_DIR}" "${TARGET_DIR}"

git clone --recurse-submodules https://github.com/ShelpAm/dotfiles \
  "${DOTFILES_DIR}"

stow -d "${DOTFILES_DIR}" -t "${TARGET_DIR}" --dotfiles \
  clangd gdb git kitty neovim private tmux wezterm wget xdg-user-dirs zsh
