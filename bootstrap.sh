#!/usr/bin/bash

DOTFILES_DIR="${HOME}/.dotfiles"
TARGET_DIR="${HOME}"

PACKAGES=(
    bin
    clangd
    gdb
    ghostty
    git
    kitty
    hyprland
    hyprpaper
    hyprsunset
    neovim
    private
    tmux
    uwsm
    wezterm
    wget
    xdg-user-dirs
    zsh
    services
)

mkdir -p "${DOTFILES_DIR}" "${TARGET_DIR}"

if [ ! -e "${DOTFILES_DIR}" ]; then
    git clone --recurse-submodules https://github.com/ShelpAm/dotfiles \
        "${DOTFILES_DIR}"
fi

# Note that `--no-folding` is needed due to `--dotfiles` doesn't work in
# conjunction with tree folding. See
# https://lists.gnu.org/archive/html/bug-stow/2025-01/threads.html
# stow -d "${DOTFILES_DIR}" -t "${TARGET_DIR}" --restow \
#     --dotfiles --no-folding ${PACKAGES}

/home/shelpam/Documents/projects/wots/build/linux/x86_64/release/wots-cli -v ~/.dotfiles ~ ${PACKAGES[@]}

