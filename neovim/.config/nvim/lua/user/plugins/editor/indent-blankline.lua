return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = 'BufEnter',
    -- enabled = false,
    config = function()
      require("ibl").setup({
        debounce = 100,
        indent = { char = "▎" },
        scope = {
          show_start = false,
          show_end = false,
        },
      })
    end
  },
}
