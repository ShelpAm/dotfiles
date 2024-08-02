return {
  {
    'lewis6991/gitsigns.nvim',
    -- enabled = false,
    event = 'BufEnter',
    config = function()
      require('gitsigns').setup()
    end
  }
}
