vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("globals")

require("config.opts")
require("config.lazy")
require("config.remap")
vim.o.background = "dark"
vim.cmd("colorscheme gruvbox")

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snipppets"})

require('mini.ai').setup()
require('mini.clue').setup()
require('mini.comment').setup()
require('mini.cursorword').setup()
require('mini.hipatterns').setup()
require('mini.indentscope').setup()
require('mini.move').setup()
require('mini.surround').setup()
require('mini.trailspace').setup()
