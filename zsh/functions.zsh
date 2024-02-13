function proxy {
  local proxy_ip='127.0.0.1'
  local proxy_port='7890'

  local proxy_address=${proxy_ip}:${proxy_port}
  local proxy_url=http://${proxy_address}
  export http_proxy=$proxy_url \
    https_proxy=$proxy_url \
    ftp_proxy=$proxy_url  \
    rsync_proxy=$proxy_url
    all_proxy=$proxy_url
  git config --global http.proxy $proxy_address
  git config --global https.proxy ${proxy_address}
  echo Proxy environment variables set.
  echo "We have no access to the apt configuration file, so you may run this to enbale proxy for apt:"
  echo '`sudo echo "Acquire::http::Proxy \"${ALL_PROXY}\";" > /etc/apt/apt.conf.d/proxy.conf`'
}

function unproxy {
  unset http_proxy https_proxy ftp_proxy rsync_proxy all_proxy \
    HTTP_PROXY HTTPS_PROXY FTP_PROXY RSYNC_PROXY ALL_PROXY
  git config --global --unset http.proxy
  git config --global --unset https.proxy
  echo Run `sudo echo '' > /etc/apt/apt.conf.d/proxy.conf` to turn off proxy for apt:
}

function reload {
  exec zsh
}

function config {
  nvim $ZDOTDIR/.zshrc $ZDOTDIR/.zshenv && reload
}

function ensure_filedir() {
  [ ! -d $1 ] && mkdir -p "$(dirname $1)"
}
