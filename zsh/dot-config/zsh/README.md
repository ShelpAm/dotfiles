# Zsh Configuration

Add the following line to `/etc/zshenv` to make zsh configuration files under
`ZDOTDIR` (`$HOME/.config/zsh`) visible to zsh.

```zsh
export ZDOTDIR="${ZDOTDIR:-${XDG_CONFIG_HOME:-${HOME}/.config}/zsh}"
```
