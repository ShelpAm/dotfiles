-- Options

-- This file contains **almost** all neovim options. And some of minor options
-- reside in `./autocmds.lua`.

local opt = vim.opt

opt.autoread = true
opt.autowrite = false    -- Enable auto write
opt.autowriteall = false -- Enable auto write all the files
opt.background = 'light'
opt.binary = true
opt.clipboard = 'unnamedplus' -- Synchronize with system clipboard
-- opt.colorcolumn = { '+0' }
opt.cmdheight = 1
opt.completeopt = 'menu,menuone,noselect'
opt.conceallevel = 3           -- Hide * markup for bold and italic
opt.confirm = false            -- Confirm to save changes before exiting modified buffer
opt.cursorcolumn = false       -- Disable highlighting of the current column
opt.cursorline = true          -- Enable highlighting of the current line
opt.encoding = 'utf-8'
opt.expandtab = true           -- Use spaces instead of tabs
opt.formatoptions = 'jcroqlnt' -- tcqj
opt.grepformat = '%f:%l:%c:%m'
opt.grepprg = 'rg --vimgrep'
opt.hlsearch = true        -- Whether to highlight matches
opt.ignorecase = true      -- Ignore case when searching for strings
opt.inccommand = 'nosplit' -- Preview incremental substitute
opt.incsearch = true       -- Search as characters are entered
opt.laststatus = 2
opt.list = true            -- Show some invisible characters (tabs...
opt.listchars = { tab = '> ', trail = '.', nbsp = '+' }
opt.mouse = 'a'            -- Enable mouse mode
opt.number = true          -- Print line number
opt.pumblend = 10          -- Popup blend
opt.pumheight = 10         -- Maximum number of entries in a popup
opt.relativenumber = true  -- Relative line numbers
opt.scrolloff = 4          -- Lines of context
opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize' }
opt.shiftround = true      -- Round indent
opt.shiftwidth = 4         -- Size of an indent
opt.shortmess:append { W = true, I = true, c = true }
opt.showmode = false       -- Dont show mode since we have a statusline
opt.showtabline = 2
opt.sidescrolloff = 8      -- Columns of context
opt.signcolumn = 'yes:2'   -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true       -- Don't ignore case with capitals
opt.smartindent = true     -- Insert indents automatically
opt.softtabstop = 4        -- Number of spaces in tab when editing
opt.spell = false
opt.spelllang = { 'en_us' }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
-- opt.statuscolumn         -- See file `user.core.autocmds.d.statuscolumn`
opt.swapfile = false
opt.tabstop = 4          -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.textwidth = 80
opt.timeout = true
opt.timeoutlen = 100
--opt.undodir = "$XDG_STATE_HOME/nvim/undo/"
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200               -- Save swap file and trigger CursorHold
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.winminwidth = 5                -- Minimum window width
opt.wrap = true                    -- Line wrap


vim.bo.autoread = true

-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define({
    {
        name = "DiagnosticSignError",
        text = "",
        -- text = "", -- Use empty text to hide the signs in sign column
        texthl = "DiagnosticSignError",
        linehl = 'ErrorLine',
    },
    {
        name = "DiagnosticSignWarn",
        -- text = "",
        text = "", -- Same as above
        texthl = "DiagnosticSignWarn",
        linehl = 'WarningLine',
    },
    {
        name = "DiagnosticSignInfo",
        -- text = "",
        text = "", -- Same as above
        texthl = "DiagnosticSignInfo",
        linehl = 'InfoLine',
    },
    {
        name = "DiagnosticSignHint",
        -- text = "",
        text = "", -- Same as above
        texthl = "DiagnosticSignHint",
        linehl = 'HintLine',
    },
})

-- make zsh files recognized as sh for bash-ls & treesitter
vim.filetype.add {
    extension = {
        hpp = "cpp",
        ixx = "cpp",
        zsh = "sh",
        sh = "sh", -- force sh-files with zsh-shebang to still get sh as filetype
    },
    filename = {
        ["dot-zshrc"] = "sh",
        ["dot-zshenv"] = "sh",
        ["dot-zprofile"] = "sh",
        ["version.h.in"] = "cmake",
        ["xmake.lua"] = "xmake",
        [".zshrc"] = "sh",
        [".zshenv"] = "sh",
        [".zprofile"] = "sh",
    },
}

if vim.fn.has('nvim-0.9.0') == 1 then
    opt.splitkeep = 'screen'
    opt.shortmess:append { C = true }
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.diagnostic.config({ virtual_text = true })
