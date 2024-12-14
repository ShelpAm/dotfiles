return {
    {
        'uloco/bluloco.nvim',
        -- enabled = false,
        lazy = false,
        priority = 1000,
        dependencies = { 'rktjmp/lush.nvim' },
        opts = {
            style       = "auto", -- "auto" | "dark" | "light"
            transparent = false,
            italics     = true,
            terminal    = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
            guicursor   = true,
        },
        config = function(_, opts)
            require("bluloco").setup(opts)
            vim.cmd('colorscheme bluloco')
        end,
    },
}
