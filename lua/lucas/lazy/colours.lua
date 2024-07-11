return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function ()
      vim.cmd("colorscheme tokyonight-storm")
    end
  },
  {'norcalli/nvim-colorizer.lua',
    config = function ()
      require('colorizer').setup()
    end
  },
  {"xiyaowong/transparent.nvim",
    groups = {
      'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
      'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
      'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
      'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
      'EndOfBuffer',
    },
    extra_groups = {},
    exclude_groups = {
      'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC', 'SignColumn'
    },
  },
}
