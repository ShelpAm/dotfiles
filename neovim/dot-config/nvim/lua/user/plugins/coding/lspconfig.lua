return {
  -- Language server support
  {
    'neovim/nvim-lspconfig',
    -- enabled = false,
    priority = 1,
    dependencies = {
      'williamboman/mason-lspconfig.nvim'
    },
    config = function()
      require('user.core.lsp').setup()
    end
  },
}
