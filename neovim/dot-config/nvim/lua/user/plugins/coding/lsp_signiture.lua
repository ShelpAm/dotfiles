return {
    {
        'ray-x/lsp_signature.nvim',
        -- enabled = false,
        event = 'LspAttach',
        opts = {
        },
        config = function()
            require('lsp_signature').on_attach()
        end,
    }
}
