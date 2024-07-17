return {
  {'nvim-treesitter/nvim-treesitter'},
  {'lewis6991/gitsigns.nvim'},
  {'nvim-lua/plenary.nvim'},
	{"numToStr/Comment.nvim"},
	{"kylechui/nvim-surround"},
	{"nvimdev/indentmini.nvim"},
  {"ggandor/leap.nvim",
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
      vim.keymap.set("n", "s", function()
        require("leap").leap({ target_windows = { vim.api.nvim_get_current_win() } })
      end)
    end,
  },
  {'nvimdev/hlsearch.nvim',
    event = 'BufRead',
    config = function()
      require('hlsearch').setup()
    end,
  },
  {"shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true
        },
        line_num = {
          enable = true
        },
      })
    end
  },
  {"ibhagwan/fzf-lua", config = function()
			require("fzf-lua").setup({})
		end
	},
  {"folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function ()
      vim.cmd("colorscheme tokyonight-storm")
    end
  },
  {"norcalli/nvim-colorizer.lua", config = function()
			require('colorizer').setup()
		end
	},
  {"xiyaowong/transparent.nvim",
    groups = {
      'Normal',     'NormalNC',     'Comment',    'Constant',
			'Special',    'Identifier',   'Statement',  'PreProc',
			'Type',       'Underlined',   'Todo',       'String',
			'Function',   'Conditional',  'Repeat',     'Operator',
			'Structure',  'LineNr',       'NonText',    'SignColumn',
			'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
      'EndOfBuffer',
    },
    extra_groups = {},
    exclude_groups = {
      'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC', 'SignColumn'
    },
  },
}
