#!/usr/bin/env bash

DOTFILES_DIR="${HOME}/.dotfiles"
TARGET_DIR="${HOME}"

PACKAGES=""
PACKAGES="${PACKAGES} clangd"
PACKAGES="${PACKAGES} gdb"
PACKAGES="${PACKAGES} git"
PACKAGES="${PACKAGES} kitty"
PACKAGES="${PACKAGES} hyprland"
PACKAGES="${PACKAGES} neovim"
PACKAGES="${PACKAGES} private"
PACKAGES="${PACKAGES} tmux"
PACKAGES="${PACKAGES} wezterm"
PACKAGES="${PACKAGES} wget"
PACKAGES="${PACKAGES} xdg-user-dirs"
PACKAGES="${PACKAGES} zsh"

mkdir -p "${DOTFILES_DIR}" "${TARGET_DIR}"

if [ ! -e "${DOTFILES_DIR}" ]; then
    git clone --recurse-submodules https://github.com/ShelpAm/dotfiles \
        "${DOTFILES_DIR}"
fi

# Note that `--no-folding` is needed due to `--dotfiles` doesn't work in
# conjuntion with tree folding. See
# https://lists.gnu.org/archive/html/bug-stow/2025-01/threads.html
stow -d "${DOTFILES_DIR}" -t "${TARGET_DIR}" --restow \
    --dotfiles --no-folding ${PACKAGES}
