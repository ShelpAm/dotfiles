-- TO BE IMPLEMENTED
local M = {}

local lfs = require('lfs')

local function root_dir()
  -- TODO: implement the function
  return vim.fn.getcwd()
end

-- working only for project-v
local function generate(filename)
  local src = root_dir() .. '/src/' .. filename .. '.cc'
  local include = root_dir() .. '/include/project-v/' .. filename .. '.h'
end

return M
