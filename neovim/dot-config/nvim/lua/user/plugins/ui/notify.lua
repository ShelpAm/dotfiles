return {
    {
        "rcarriga/nvim-notify",
        -- enabled = false,
        config = function()
            vim.opt.termguicolors = true
            require("notify").setup()
        end
    }
}
