return {
    {
        'uloco/bluloco.nvim',
        -- enabled = false,
        lazy = false,
        priority = 1000,
        dependencies = { 'rktjmp/lush.nvim' },
        config = function()
            require("bluloco").setup({
                style       = "auto", -- "auto" | "dark" | "light"
                transparent = true,
                italics     = true,
                terminal    = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
                guicursor   = true,
            })
            vim.opt.termguicolors = true
            vim.cmd('colorscheme bluloco')
        end,
    },
}
