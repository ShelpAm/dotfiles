local config = require('user.core.lsp.config')

require('lspconfig').java_language_server.setup {
  -- filetypes = { 'java' }, -- server has defaulted values
  -- Add additional capabilities supported by nvim-cmp
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = config.default_on_attach,
  cmd = {
    "/home/shelpam/.local/share/nvim/mason/bin/java-language-server",
  },
}
