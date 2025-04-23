return {
    -- Language server support
    {
        'neovim/nvim-lspconfig',
        enabled = true,
        dependencies = {
            'williamboman/mason-lspconfig.nvim' -- Find server executables from here
        },
        -- priority = 1,
        -- event = "BufRead",
        config = function()
            require('user.core.lsp').setup()
        end
    },
}
