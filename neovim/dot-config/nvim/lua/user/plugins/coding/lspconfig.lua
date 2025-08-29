return {
    -- Language server support
    {
        'neovim/nvim-lspconfig',
        -- enabled = false,
        dependencies = {
            'williamboman/mason-lspconfig.nvim' -- Find server executables from here
        },
        event = "VeryLazy",
    },
}
