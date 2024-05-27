# Zsh Configuration

Add this to `/etc/zsh/zshenv` to make zsh configuration files visible to zsh.
```zsh
export ZDOTDIR="${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}"
```
