local wezterm = require 'wezterm'

local config = {
    color_scheme = 'Bluloco Zsh Light (Gogh)',
    enable_wayland = false,
    font = wezterm.font('Input Mono'),
    font_size = 16,

    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.8,
    },

    window_background_opacity = 0.95,

    window_padding = {
        -- left = '0.8cell',
        -- right = '0.8cell',
        -- top = '0.4cell',
        bottom = '0.4cell',
    },
    initial_rows = 43,
    initial_cols = 132,

    -- Tab bar
    enable_tab_bar = false,
    tab_bar_at_bottom = true,
}

return config
