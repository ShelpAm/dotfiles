function proxy_on {
  local proxy_ip='127.0.0.1'
  local proxy_port='7890'

  local proxy_address="${proxy_ip}:${proxy_port}"
  local proxy="http://${proxy_address}"
  export http_proxy=$proxy https_proxy=$proxy ftp_proxy=$proxy \
    rsync_proxy=$proxy all_proxy=$proxy
  git config --global http.proxy ${proxy}
  git config --global https.proxy ${proxy}
  echo "Proxy environment variables set."
  # echo "We have no access to the apt configuration file, so you may run this to enbale proxy for apt:"
  # echo '`sudo echo "Acquire::http::Proxy \"${ALL_PROXY}\";" > /etc/apt/apt.conf.d/proxy.conf`'
}

function proxy_off {
  unset http_proxy https_proxy ftp_proxy rsync_proxy all_proxy \
    HTTP_PROXY HTTPS_PROXY FTP_PROXY RSYNC_PROXY ALL_PROXY
  git config --global --unset http.proxy
  git config --global --unset https.proxy
  echo "Proxy environment variables unset."
  # echo 'Run `sudo echo "" > /etc/apt/apt.conf.d/proxy.conf` to disable proxy for apt.'
}

function reload {
  exec zsh
}

function config {
  nvim "$ZDOTDIR/.zshrc" "$ZDOTDIR/.zshenv" && reload
}

function ensure_parent_dir {
  [ ! -e "$1" ] && mkdir -p "$(dirname $1)"
}

function ensure_dir {
  [ ! -d "$1" ] && mkdir -p "$1"
}
