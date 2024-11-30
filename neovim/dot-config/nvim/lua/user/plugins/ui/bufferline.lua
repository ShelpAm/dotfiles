return {
    {
        'akinsho/bufferline.nvim',
        -- enabled = false,
        event = { 'VeryLazy' },
        -- version = "v3.*", -- Remove this to resolve this [issue](https://github.com/akinsho/bufferline.nvim/issues/903)
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            vim.opt.termguicolors = true
            require("bufferline").setup {}
        end
    },
}
