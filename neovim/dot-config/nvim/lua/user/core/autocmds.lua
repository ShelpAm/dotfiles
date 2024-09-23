local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

local function autocmd(events, opts)
  return vim.api.nvim_create_autocmd(events, opts)
end

local function excluded_formatting(filetype)
  local excluded_filetype = { 'xmake' }
  return vim.tbl_contains(excluded_filetype, filetype)
end

autocmd('BufWritePre', {
  group = augroup('format_on_save'),
  callback = function()
    if not excluded_formatting(vim.bo.filetype) then
      vim.lsp.buf.format()
    end
  end,
})

local uv = vim.loop
autocmd({ 'VimEnter', 'VimLeave' }, {
  callback = function()
    if vim.env.TMUX_PLUGIN_MANAGER_PATH then
      uv.spawn(vim.env.TMUX_PLUGIN_MANAGER_PATH .. '/tmux-window-name/scripts/rename_session_windows.py', {})
    end
  end,
})

-- Turn off statuscolumn for alpha and lazy
local function contains(container, element)
  for _, e in ipairs(container) do
    if e == element then
      return true
    end
  end
end
local off_statuscolumn = { 'alpha', 'lazy' }
vim.api.nvim_create_autocmd("FileType", {
  pattern = off_statuscolumn,
  callback = function()
    vim.o.statuscolumn = ''
  end
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = '*',
  callback = function()
    if not contains(off_statuscolumn, vim.bo.filetype) then
      vim.o.statuscolumn = '%C%s%=%{v:relnum?v:relnum:v:lnum}  '
    end
  end
})
