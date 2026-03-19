require('user')

local plugins = {
  'colorscheme',

  'coding',
}

require('plugins.colorscheme')

for _, module in ipairs({
  'coding',
}) do
  require('plugins.' .. module)
end
