# Personal Tmux Configuration

## Installation

Before using this configuration, you should first install tpm with:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm
```
If you want to change the directory to install plugins, you can modify the following line in
`~/.config/tmux/tmux.conf`, find the line with `set-environment -g TMUX_PLUGIN_MANAGER_PATH`,
and modify it as below:
```tmux
set-environment -g TMUX_PLUGIN_MANAGER_PATH "/path/to/plugins_dir"
```
Then, source the configuration:
```bash
tmux source ~/.config/tmux/tmux.conf
```
At last, install plugins by pressing `<prefix>I`, where the prefix is defaulted to be `Ctrl-B`.
(note that the letter `I` is capitalized).


## Troubleshooting

If you got a `'~/.local/share/tmux/plugins/tpm/tpm' returned 127` after sourcing the configuration file, you
probably forgot to run `$ git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm`
