local M = {}

-- define mapleader
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

-- Use `jk` to escape
map('i', 'jk', '<esc>', { desc = 'Escape' })
map('i', 'kj', '<esc>', { desc = 'Escape' })

-- Native command mappings
map('n', '<leader>w', '<Cmd>w<CR>', { desc = '[W]rite Buffer' })
map({ 'i', 'v', 'n', 's' }, '<C-S>', '<Cmd>w<Cr><Esc>', { desc = 'Save file' })
map('n', '<leader>q', '<Cmd>q<CR>', { desc = '[Q]uit' })

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', { desc = '[G]o to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- Resize with arrows
map("n", "<C-Up>", "<Cmd>resize -1<Cr>", { desc = "" })
map("n", "<C-Down>", "<Cmd>resize +1<Cr>", { desc = "" })
map("n", "<C-Left>", "<Cmd>vertical resize -1<Cr>", { desc = "" })
map("n", "<C-Right>", "<Cmd>vertical resize +1<Cr>", { desc = "" })

-- Better buffer navigation
map('n', '<S-h>', '<cmd>bp<cr>', { desc = 'Prev buffer' })
map('n', '<S-l>', '<cmd>bn<cr>', { desc = 'Next buffer' })
map('n', '[b', '<cmd>bp<cr>', { desc = 'Prev buffer' })
map('n', ']b', '<cmd>bn<cr>', { desc = 'Next buffer' })

-- Buffer
map('n', '<leader>bd', '<cmd>bd<cr>')

-- Move Lines
map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
map('v', '<A-j>', ':m ">+1<cr>gv=gv', { desc = 'Move down' })
map('v', '<A-k>', ':m "<-2<cr>gv=gv', { desc = 'Move up' })

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
--map('n', '<leader>d', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
--map('n', '<leader>q', vim.diagnostic.setloclist)

map('n', '<leader>ts', '<cmd>set spell!<cr>', { desc = '[T]oggle [S]pelling check' })
map('n', '<leader>th', '<cmd>set hlsearch!<cr>', { desc = '[T]oggle [H]lsearch' })

map('n', '<leader>l', '<Cmd>Lazy<Cr>', { desc = '[L]azy' })

-- Source current file
map('n', '<leader>s', function()
  if vim.bo.filetype == 'lua' then
    vim.cmd([[silent w | silent source %]])
  elseif vim.bo.filetype == 'zsh' then
    vim.cmd([[silent !exec zsh]])
  end
end, { desc = '[S]ource current file' })

map('n', '<F5>', function()
  vim.cmd([[normal ]])
end, { desc = 'Run current file' })

return M
