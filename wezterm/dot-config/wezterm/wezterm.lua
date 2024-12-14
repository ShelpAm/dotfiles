local wezterm = require 'wezterm'

local config = {
    color_scheme = 'Bluloco Zsh Light (Gogh)',
    -- color_scheme = 'BlulocoDark', -- Dark theme
    enable_wayland = false,
    font = wezterm.font('Input Mono'),
    font_size = 9,

    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8,
    },

    window_background_opacity = 0.95,

    window_padding = {
        left = '0',
        right = '0',
        top = '0',
        bottom = '0',
    },
    initial_rows = 43,
    initial_cols = 132,

    -- Tab bar
    enable_tab_bar = false,
    tab_bar_at_bottom = true,
}

return config
