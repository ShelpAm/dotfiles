source "${ZDOTDIR}/utils.zsh"

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-${HOME}/.local/state}"
# export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-}" # Not required to have a default value

typeset -U path
path=(/sbin ~/.local/bin ~/competitive_programming $path)

typeset -U mailpath
mailpath=($mailpath)

export EDITOR=nvim
export VISUAL=nvim

# input method
# now I'm using ibus
# export GLFW_IM_MODULE=ibus
# export GTK_IM_MODULE=ibus
# export QT_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
export GLFW_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

# Python
export PYTHONSTARTUP="${XDG_DATA_HOME}/python/startup.py"
export PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME}/python"
export PYTHONUSERBASE="${XDG_DATA_HOME}/python"
export PYTHONHISTFILE="${XDG_STATE_HOME}/python/history"

# GPG
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
ensure_dir "${GNUPGHOME}"
unset SSH_AGENT_PID
### replace ssh-agent with gpg-agent
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
export GPG_TTY=$(tty)
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
