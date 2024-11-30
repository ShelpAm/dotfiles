# Personal Tmux Configuration

## Prerequisite

Used for configuration file watching
```bash
apt install entr
dnf install entr
yum install entr
...
```
For 'ofirgall/tmux-window-name': `python3 -m pip install --user libtmux`

## Installation

Before using this configuration, you should first install tpm with:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
```
If you want to change the directory to install plugins, you can modify the following line in
`~/.config/tmux/tmux.conf`, find the line with `set-environment -g TMUX_PLUGIN_MANAGER_PATH`,
and modify it as below:
```tmux
set-environment -g TMUX_PLUGIN_MANAGER_PATH "/path/to/your/plugins/dir"
```
Then, source the configuration:
```bash
tmux source ~/.config/tmux/tmux.conf
```
At last, install plugins by pressing `<prefix>I`, where the `<prefix>` is by
default `Ctrl-B`. (note the capitalized letter `I`).


## Troubleshooting

If you got a `'~/.local/share/tmux/plugins/tpm/tpm' returned 127` after sourcing the configuration file, you
probably forgot to run `$ git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm`

If you want to switch another theme, and failed. Maybe it's the collision of
themes: they're often named `theme`. So remove former installed theme plugin
and re-install the latter.
