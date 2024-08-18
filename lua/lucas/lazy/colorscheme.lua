return {
  {'zaldih/themery.nvim',
    config = function ()
      require('themery').setup({
      themes = { "tokyonight-storm", "lackluster-mint" },
      livePreview = true,
      })
    end
  },
  {'slugbyte/lackluster.nvim',
    lazy = false,
    priority = 1000,
    -- init = function ()
    --   vim.cmd.colorscheme("lackluster-mint")
    -- end,
  },
  {"folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function ()
      vim.cmd("colorscheme tokyonight-storm")
    end
  },
  -- {"xiyaowong/transparent.nvim",
  --   groups = {
  --     'Normal',     'NormalNC',     'Comment',    'Constant',
  -- 	'Special',    'Identifier',   'Statement',  'PreProc',
  -- 	'Type',       'Underlined',   'Todo',       'String',
  -- 	'Function',   'Conditional',  'Repeat',     'Operator',
  -- 	'Structure',  'LineNr',       'NonText',    'SignColumn',
  -- 	'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
  --     'EndOfBuffer',
  --   },
  --   extra_groups = {},
  --   exclude_groups = {
  --     'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC', 'SignColumn'
  --   },
  -- },
}
