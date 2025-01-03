#!/usr/bin/env bash

DOTFILES_DIR="${HOME}/.dotfiles"
TARGET_DIR="${HOME}"

mkdir -p "${DOTFILES_DIR}" "${TARGET_DIR}"

if [ ! -e "${DOTFILES_DIR}" ]; then
    git clone --recurse-submodules https://github.com/ShelpAm/dotfiles \
        "${DOTFILES_DIR}"
fi

stow -d "${DOTFILES_DIR}" -t "${TARGET_DIR}" --dotfiles --restow \
    clangd gdb git kitty hyprland neovim private tmux wezterm wget xdg-user-dirs zsh
