M = {}

M.gh = function(repo)
  return "https://github.com/" .. repo
end

-- Reads and loads all plugins under current directory.
M.load_current_dir = function()
  local source = debug.getinfo(2, "S").source:sub(2)
  local dir = vim.fs.dirname(source)
  local files = {}

  for name, kind in vim.fs.dir(dir) do
    if kind == "file" and name:sub(-4) == ".lua" and name ~= "init.lua" then
      table.insert(files, name)
    end
  end

  table.sort(files)

  local config_root = vim.fn.stdpath("config") .. "/lua/"
  local prefix = dir:sub(#config_root + 1):gsub("/", ".")

  for _, name in ipairs(files) do
    require(prefix .. "." .. name:gsub("%.lua$", ""))
  end
end

return M
