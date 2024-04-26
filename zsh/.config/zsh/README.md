# Zsh Configuration

Add this to `/etc/zsh/zshenv`, or the configuration files won't be detected by
the zsh.
```zsh
export ZDOTDIR="${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}"
```
