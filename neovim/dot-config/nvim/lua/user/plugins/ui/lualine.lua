return {
    {
        'nvim-lualine/lualine.nvim',
        -- enabled = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        event = {
            'UIEnter'
        },
        config = function()
            require('lualine').setup({
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = { 'neo-tree', 'NvimTree' },
                        winbar = { 'neo-tree', 'NvimTree' },
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 100,
                        tabline = 100,
                        winbar = 100,
                    }
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { { 'filename', path = 0 } },
                    lualine_c = { 'diagnostics' },
                    lualine_x = { '' },
                    lualine_y = { 'location' },
                    lualine_z = { 'filetype' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            })
        end,
    },
}
