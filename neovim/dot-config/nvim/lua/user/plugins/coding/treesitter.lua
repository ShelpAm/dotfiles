return {
  {
    'nvim-treesitter/nvim-treesitter',
    -- enabled = false,
    event = { 'BufEnter' },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {},          -- A list of parser names, or "all"
        sync_install = false,           -- Install parsers synchronously (only applied to `ensure_installed`)
        auto_install = true,            -- Automatically install missing parsers when entering buffer
        ignore_install = {},            -- List of parsers to ignore installing (or "all")
        highlight = { enable = true, }, -- Highlight supports
        indent = { enable = true, },
      })

      require('nvim-treesitter.install').prefer_git = true
      --[[install.command_extra_args = {
        curl = { "--proxy", "127.0.0.1:7890" },
      }]]
    end
  },
}
