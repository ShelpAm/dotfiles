local config = require('user.core.lsp.config')

require('lspconfig').clangd.setup({
  -- Add additional capabilities supported by nvim-cmp
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = config.default_on_attach,
  cmd = {
    "clangd",
    "-j=8",
    -- "--completion-style=detailed",
    "--header-insertion=never",
    -- "--pch-storage=memory",
    -- "--header-insertion-decorators",
    -- "--print-options",
    -- "--log=verbose"
  },
})
