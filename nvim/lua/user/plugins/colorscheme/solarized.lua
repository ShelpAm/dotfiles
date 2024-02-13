return {
  {
    'shaunsingh/solarized.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('solarized').set()
    end
  }
}
