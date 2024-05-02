source "${ZDOTDIR}/utils.zsh"

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-${HOME}/.local/state}"
#export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-}" # Not required to have a default value

typeset -U path
path=($path ~/.local/bin ~/.local/share/python/bin)

typeset -U mailpath
mailpath=($mailpath)

COLORTERM=truecolor

export EDITOR=nvim
export VISUAL=nvim

# # for Wayland
# GBM_BACKEND=nvidia-drm
# __GLX_VENDOR_LIBRARY_NAME=nvidia

# Python
# export PYTHONSTARTUP="${XDG_DATA_HOME}/python/startup.py"
export PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME}/python"
export PYTHONUSERBASE="${XDG_DATA_HOME}/python"
export PYTHONHISTFILE="${XDG_STATE_HOME}/python/history"

# GPG
# export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
# ensure_dir "${GNUPGHOME}"
# unset SSH_AGENT_PID
## replace ssh-agent with gpg-agent
# if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
#   export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
# fi
# export GPG_TTY=$(tty)
# gpg-connect-agent updatestartuptty /bye >/dev/null

# NPM
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
ensure_parent_dir "${NPM_CONFIG_USERCONFIG}"

# less
export LESSHISTFILE="${XDG_STATE_HOME}/less/history"
ensure_parent_dir "${LESSHISTFILE}"

# wget
export WGETRC="${XDG_CONFIG_HOME}/wget/wgetrc"
ensure_parent_dir "${WGETRC}"
