# Note that dnf won't use this proxy unless you set them up manually.

function proxy-on {
  source "${ZDOTDIR}/proxy_on.zsh"
  git config --global http.proxy ${proxy}
  git config --global https.proxy ${proxy}
  gsettings set org.gnome.system.proxy mode 'manual'
  gsettings set org.gnome.system.proxy.http host ${proxy_host}
  gsettings set org.gnome.system.proxy.http port ${proxy_port}
  gsettings set org.gnome.system.proxy.https host ${proxy_host}
  gsettings set org.gnome.system.proxy.https port ${proxy_port}
  echo "Proxy environment variables have been set."
  # For apt
  # echo "We have no access to the apt configuration file, so you may run this to enbale proxy for apt:"
  # echo '`sudo echo "Acquire::http::Proxy \"${ALL_PROXY}\";" > /etc/apt/apt.conf.d/proxy.conf`'
}

function proxy-off {
  source "${ZDOTDIR}/proxy_off.zsh"
  git config --global --unset http.proxy
  git config --global --unset https.proxy
  gsettings set org.gnome.system.proxy mode 'none'
  gsettings reset org.gnome.system.proxy.http host
  gsettings reset org.gnome.system.proxy.http port
  gsettings reset org.gnome.system.proxy.https host
  gsettings reset org.gnome.system.proxy.https port
  echo "Proxy environment variables were unset."
  # For apt
  # echo 'Run `sudo echo "" > /etc/apt/apt.conf.d/proxy.conf` to disable proxy for apt.'
}

function reload {
    exec zsh
}

function config-zsh {
    nvim "${ZDOTDIR}/.zshrc" && reload
}

function config-hyprland {
    nvim "${XDG_CONFIG_HOME}/hypr/hyprland.conf"
}

function config {
    config-zsh
}

function ensure-parent-dir {
  [ ! -e "$1" ] && mkdir -p "$(dirname $1)"
}

function ensure_dir {
  [ ! -d "$1" ] && mkdir -p "$1"
}

function turn_on_proxy_with_iphone {
  nmcli connection up ShepAm
  proxy-on
}

function turn_off_proxy_with_iphone {
  proxy-off
  nmcli connection up ACS_6.1G
}

function fix-tmux-env {
    eval $(tmux show-env -s | grep '^SSH_')
}

# function run-with-nvidia {
#     env  $@
# }

# Untested
function extract {
    if [ $# -eq 0 ]; then
        echo 'Usage: extract <file1> [file2 ... fileN]'
        return 1
    fi

    while [ $# -gt 0 ]; do
        file="$1"
        shift

        if [ ! -f "${file}" ]; then
            echo "'${file}' doesn't exist. Skipping this file..."
            continue
        fi

        case "${file}" in
            *.tar)       ;&
            *.tar.bz2)   ;&
            *.tar.xz)    ;&
            *.tar.gz)
                         tar xvf "${file}"     ;;
            *.bz2)       bunzip2 "${file}"     ;;
            *.rar)       unrar x "${file}"     ;;
            *.gz)        gunzip "${file}"      ;;
            *.tbz2)      tar xvjf "${file}"    ;;
            *.tgz)       tar xvzf "${file}"    ;;
            *.zip)       unzip "${file}"       ;;
            *.Z)         uncompress "${file}"  ;;
            *.xz)        xz -d "${file}"       ;;
            *.7z)        7z x "${file}"        ;;
            *.a)         ar x "${file}"        ;;
            *)           echo "Unable to extract '${file}'. Extension not supported." ;;
        esac
    done
}

