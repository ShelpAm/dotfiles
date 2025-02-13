# Work with tmux:'ofirgall/tmux-window-name'
function tmux-window-name {
    if [ -n "$TMUX_PLUGIN_MANAGER_PATH" ]; then
        "$TMUX_PLUGIN_MANAGER_PATH/tmux-window-name/scripts/rename_session_windows.py"
    fi
}

function async-tmux-window-name {
    (tmux-window-name &)
}

add-zsh-hook chpwd async-tmux-window-name


## Trigger tmux-window-name on shell startup (Disabled because too slow)
# tmux-window-name
