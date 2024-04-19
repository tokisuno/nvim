-- 2024-03-01
-- description: modular config

require('lucas.lazy-config')
require('lucas.set')
require('lucas.keymaps')
require('luasnip.loaders.from_lua').lazy_load({paths = '~/.config/nvim/lua/lucas/LuaSnip/'})
