return {
  {
    "windwp/nvim-autopairs",
    -- enabled = false,
    event = { 'BufEnter' },
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require("nvim-autopairs").setup()

      -- Insert `(` after select function or method item
      local cmp = require('cmp')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  },
}
