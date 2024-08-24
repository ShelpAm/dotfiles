return {
  -- Language server support
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason-lspconfig.nvim' -- Find server executables from here
    },
    -- enabled = false,
    -- priority = 1,
    -- event = "BufRead",
    config = function()
      require('user.core.lsp').setup()
    end
  },
}
