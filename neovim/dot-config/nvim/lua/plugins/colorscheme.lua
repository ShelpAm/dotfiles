local gh = require('platforms').gh

vim.pack.add({ gh("rktjmp/lush.nvim") })

vim.pack.add({ gh("uloco/bluloco.nvim") })

require("bluloco").setup({
    style = "auto", -- "auto" | "dark" | "light"
    transparent = false,
    italics = true,
    terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
    guicursor = true,
    rainbow_headings = false,                  -- if you want different colored headings for each heading level
    float_window = "default"                   -- "default" | "transparent"
})

vim.cmd("colorscheme bluloco")
