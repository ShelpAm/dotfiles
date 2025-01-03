source "${ZDOTDIR}/utils.zsh"

# --- XDG Base Directory Specification ---
# BASICS
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-${HOME}/.local/state}"
#export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-}" # Not required to have a default value

# LESS
export LESSHISTFILE="${XDG_STATE_HOME}/less/history"
ensure-parent-dir "${LESSHISTFILE}"

# NPM
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
ensure-parent-dir "${NPM_CONFIG_USERCONFIG}"

# PYTHON
# export PYTHONSTARTUP="${XDG_DATA_HOME}/python/startup.py"
export PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME}/python"
export PYTHONUSERBASE="${XDG_DATA_HOME}/python"
export PYTHONHISTFILE="${XDG_STATE_HOME}/python/history"

# WGET
export WGETRC="${XDG_CONFIG_HOME}/wget/wgetrc"
ensure-parent-dir "${WGETRC}"


typeset -U path
path=($path ~/.local/bin ~/.local/share/python/bin)

typeset -U mailpath
mailpath=($mailpath)

COLORTERM=truecolor

export EDITOR=nvim
export VISUAL=nvim

# # Graphic card for Wayland
# GBM_BACKEND=nvidia-drm
# __GLX_VENDOR_LIBRARY_NAME=nvidia


# GPG (Note: this may mess things up, so I choose to keep everything default.)
# export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
# ensure_dir "${GNUPGHOME}"
# unset SSH_AGENT_PID
## replace ssh-agent with gpg-agent
# if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#   export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
# fi
# export GPG_TTY=$(tty)
# gpg-connect-agent updatestartuptty /bye >/dev/null

# competitive-programming
export COMPETITIVE_PROGRAMMING_DIR="${HOME}/Documents/projects/competitive-programming"


# -- IME setting --
#
# My configuration:
# See: https://fcitx-im.org/wiki/Note_for_GNOME_Later_than_3.6
#
# Useful links:
# See: https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
# See: https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland#Per-window_input_method_state

. "$HOME/.cargo/env"

# Proxy settings
local proxy_host='127.0.0.1'
local proxy_port='7890'
local proxy_address="${proxy_host}:${proxy_port}"
local proxy="http://${proxy_address}"

# QT
# export QT_QPA_PLATFORM=wayland
