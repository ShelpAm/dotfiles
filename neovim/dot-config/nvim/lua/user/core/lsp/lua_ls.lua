local config = require('user.core.lsp.config')

require('lspconfig').lua_ls.setup({
    -- Add additional capabilities supported by nvim-cmp
    capabilities = require('cmp_nvim_lsp').default_capabilities(),
    on_attach = function(client, bufnr)
        config.default_on_attach(client, bufnr)
    end,
    settings = {
        root_dir = vim.fs.dirname('lua'),
        Lua = {
            completion = {
                callSnippet = "Replace",
            },
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                checkThirdParty = false,
                -- Make the server aware of Neovim runtime files
                library = {
                    vim.env.VIMRUNTIME
                },
            },
            telemetry = {
                enable = true,
            },
        },
    },
})
