return {
  {
    "lukas-reineke/indent-blankline.nvim",
    -- enabled = false,
    event = 'BufEnter',
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
