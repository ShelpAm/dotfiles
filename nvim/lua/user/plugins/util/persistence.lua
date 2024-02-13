return {
  {
    "folke/persistence.nvim",
    enabled = true,
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
      require("persistence").setup()
    end,
  }
}
