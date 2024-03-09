return {
  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  {'numToStr/Comment.nvim',
      opts = {
        padding = true,
        sticky = true,
        toggler = {
          line = 'gcc',
          block = 'gbc',
        },
        mappings = {
          basic = true
        }
      },
      lazy = false,
  }
}
