return {
    {
        'akinsho/bufferline.nvim',
        -- enabled = false,
        event = { 'VeryLazy' },
        -- version = "v3.*", -- Remove this to resolve this [issue](https://github.com/akinsho/bufferline.nvim/issues/903)
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        opts = {
            options = {
                max_name_length = 24,
                max_prefix_length = 20,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "left",
                        separator = true,
                    }
                },
            }
        },
    },
}
