local config = require('user.core.lsp.config')

require('lspconfig').ruff.setup({
    -- Add additional capabilities supported by nvim-cmp
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = config.default_on_attach,
    cmd = {
        "ruff",
        "server",
        -- "--preview",
    },
})
