return {
  -- Language server supports
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    priority = 1,
    dependencies = {
      'williamboman/mason-lspconfig.nvim'
    },
    config = function()
      require('user.core.lsp').setup()
    end
  },
}
