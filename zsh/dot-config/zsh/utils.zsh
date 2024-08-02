# Note that dnf won't use this proxy unless you set them up manually.

function proxy_on {
  cp ${ZDOTDIR}/proxy_on.zsh ${ZDOTDIR}/proxy.zsh
  source ${ZDOTDIR}/proxy.zsh
  git config --global http.proxy ${proxy}
  git config --global https.proxy ${proxy}
  gsettings set org.gnome.system.proxy mode 'manual'
  gsettings set org.gnome.system.proxy.http host ${proxy_host}
  gsettings set org.gnome.system.proxy.http port ${proxy_port}
  gsettings set org.gnome.system.proxy.https host ${proxy_host}
  gsettings set org.gnome.system.proxy.https port ${proxy_port}
  echo "Proxy environment variables which are set:"
  env | grep -i proxy
  # For apt
  # echo "We have no access to the apt configuration file, so you may run this to enbale proxy for apt:"
  # echo '`sudo echo "Acquire::http::Proxy \"${ALL_PROXY}\";" > /etc/apt/apt.conf.d/proxy.conf`'
}

function proxy_off {
  cp ${ZDOTDIR}/proxy_off.zsh ${ZDOTDIR}/proxy.zsh
  source ${ZDOTDIR}/proxy.zsh
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
function config {
  nvim "$ZDOTDIR/.zshrc" && reload
}
function ensure_parent_dir {
  [ ! -e "$1" ] && mkdir -p "$(dirname $1)"
}
function ensure_dir {
  [ ! -d "$1" ] && mkdir -p "$1"
}
function turn_on_proxy_with_iphone {
  nmcli connection up ShepAm
  proxy_on
}
function turn_off_proxy_with_iphone {
  proxy_off
  nmcli connection up ACS_6.1G
}
