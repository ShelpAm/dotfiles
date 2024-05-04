function proxy_on {
  local proxy_host='127.0.0.1'
  local proxy_port='7890'

  local proxy_address="${proxy_host}:${proxy_port}"
  local proxy="http://${proxy_address}"
  export http_proxy=$proxy https_proxy=$proxy ftp_proxy=$proxy rsync_proxy=$proxy all_proxy=$proxy
  git config --global http.proxy ${proxy}
  git config --global https.proxy ${proxy}
  gsettings set org.gnome.system.proxy mode 'manual'
  gsettings set org.gnome.system.proxy.http host ${proxy_host}
  gsettings set org.gnome.system.proxy.http port ${proxy_port}
  gsettings set org.gnome.system.proxy.https host ${proxy_host}
  gsettings set org.gnome.system.proxy.https port ${proxy_port}
  echo "Proxy environment variables set."
  # For apt
  # echo "We have no access to the apt configuration file, so you may run this to enbale proxy for apt:"
  # echo '`sudo echo "Acquire::http::Proxy \"${ALL_PROXY}\";" > /etc/apt/apt.conf.d/proxy.conf`'
}

function proxy_off {
  unset http_proxy https_proxy ftp_proxy rsync_proxy all_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY RSYNC_PROXY ALL_PROXY
  git config --global --unset http.proxy
  git config --global --unset https.proxy
  gsettings set org.gnome.system.proxy mode 'none'
  gsettings reset org.gnome.system.proxy.http host
  gsettings reset org.gnome.system.proxy.http port
  gsettings reset org.gnome.system.proxy.https host
  gsettings reset org.gnome.system.proxy.https port
  echo "Proxy environment variables unset."
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
