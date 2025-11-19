local M = {}

-- defines mapleader
vim.g.mapleader = ' '
vim.g.localmapleader = ' '

local keymap = vim.keymap

local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = true
    return keymap.set(mode, lhs, rhs, opts)
end

function M.map(mode, lhs, rhs, opts)
    return map(mode, lhs, rhs, opts)
end

-- Use `jk` and `kj` to escape
map('i', 'jk', '<esc>', { desc = 'Escape' })
map('i', 'kj', '<esc>', { desc = 'Escape' })

-- Native command mappings
map('n', '<Leader>w', '<Cmd>w<CR>', { desc = '[W]rite Buffer' })
map({ 'i', 'v', 'n', 's' }, '<C-S>', '<Cmd>w<CR><Esc>', { desc = 'Save file' })
-- map('n', '<Leader>q', '<Cmd>q<CR>', { desc = '[Q]uit' })

-- Overriden by TmuxNavigation plugin
-- -- Move to window using the <Ctrl> hjkl keys
-- map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
-- map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
-- map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
-- map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- Resize with arrows
map('n', '<C-Up>', '<Cmd>resize +1<CR>', { desc = '' })
map('n', '<C-Down>', '<Cmd>resize -1<CR>', { desc = '' })
map('n', '<C-Left>', '<Cmd>vertical resize -1<CR>', { desc = '' })
map('n', '<C-Right>', '<Cmd>vertical resize +1<CR>', { desc = '' })

-- Better buffer navigation
map('n', '<S-h>', '<Cmd>bp<CR>', { desc = 'Prev buffer' })
map('n', '<S-l>', '<Cmd>bn<CR>', { desc = 'Next buffer' })
map('n', '[b', '<Cmd>bp<CR>', { desc = 'Prev buffer' })
map('n', ']b', '<Cmd>bn<CR>', { desc = 'Next buffer' })

-- Buffer
map('n', '<Leader>bd', '<Cmd>bd<CR>')

-- Move Lines
map('n', '<A-j>', '<Cmd>m .+1<CR>==', { desc = 'Move down' })
map('n', '<A-k>', '<Cmd>m .-2<CR>==', { desc = 'Move up' })
map('i', '<A-j>', '<Esc><Cmd>m .+1<CR>==gi', { desc = 'Move down' })
map('i', '<A-k>', '<Esc><Cmd>m .-2<CR>==gi', { desc = 'Move up' })
-- this causes error: Invalid range
-- map('v', '<A-j>', ':m ">+1<CR>gv=gv', { desc = 'Move down' })
-- map('v', '<A-k>', ':m "<-2<CR>gv=gv', { desc = 'Move up' })

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
map('n', '<Leader>d', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<Leader>q', vim.diagnostic.setloclist)

map('n', '<Leader>ts', '<Cmd>set spell!<CR>', { desc = '[T]oggle [S]pelling check' })
map('n', '<Leader>th', '<Cmd>set hlsearch!<CR>', { desc = '[T]oggle [H]lsearch' })

map('n', '<Leader>l', '<Cmd>Lazy<CR>', { desc = '[L]azy' })

-- Source current file
map('n', '<Leader>s', function()
    if vim.bo.filetype == 'lua' then
        vim.cmd([[silent w | silent source %]])
    elseif vim.bo.filetype == 'zsh' then
        vim.cmd([[silent w | silent !exec zsh]])
    else
        error("Unrecognized filetype.")
    end
end, { desc = '[S]ource current file' })

-- map('n', '<F2>', '<Cmd>ClangdSwitchSourceHeader<CR>', { desc = 'Switch Source Header' })

-- Function keys
map('n', '<F5>', function() vim.cmd([[CompetiTest run]]) end, { desc = 'Run current file' })
map('n', '<F6>', function()
    vim.cmd([[%yank]])
end, { desc = 'Copy current buffer' })

map({ 'n' }, "<Leader>rp", "<Cmd>CompetiTest receive persistently<Cr>", { desc = '[R]eceive [P]ersistently' })

return M
