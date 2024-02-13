return {
  'nvim-telescope/telescope.nvim',
  event = { 'BufEnter', },
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cmd = {
    'Telescope',
  },
  config = function()
    local map = require('user.core.keymaps').map
    local builtin = require('telescope.builtin')
    map('n', '<leader>f', builtin.find_files, { desc = 'Find files' })
    map('n', '<leader>g', builtin.live_grep, { desc = 'Live grep' })

    -- local actions = require('telescope.actions')
    require('telescope').setup({
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = { prompt_position = 'top' },
        },
        mappings = {
          i = {
          }
        },
        path_display = { shorten = 5, truncate = 5 },
        sorting_strategy = 'ascending',
      },
      pickers = {
        -- find_files = { theme = 'dropdown' },
        -- live_grep = { theme = 'dropdown' },
      },
    })
  end,
}
