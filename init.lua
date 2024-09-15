vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("config.opts")
require("config.lazy")
require("config.remap")

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snipppets"})

require('mini.clue').setup()
require('mini.comment').setup()
require('mini.cursorword').setup()
require('mini.hipatterns').setup()
require('mini.indentscope').setup()
require('mini.move').setup()
require('mini.statusline').setup()
require('mini.surround').setup()
require('mini.trailspace').setup()
require('mini.tabline').setup()

P = function (v)
  print(vim.inspect(v))
  return v
end

