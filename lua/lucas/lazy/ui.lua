return {
  {'nvim-treesitter/nvim-treesitter'},
  {'lewis6991/gitsigns.nvim'},
  {'nvim-lua/plenary.nvim'},
	{"numToStr/Comment.nvim"},
	{"kylechui/nvim-surround"},
  {"HiPhish/rainbow-delimiters.nvim"},
  {"ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
		config = function ()
			local harpoon = require('harpoon')
      harpoon:setup()
		end
  },

  {"tamton-aquib/duck.nvim",
    config = function()
      vim.keymap.set('n', '<leader>dh', function() require("duck").hatch() end, {})
      vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
      vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, {})
    end
  },
  {'nvimdev/hlsearch.nvim',
    event = 'BufRead',
    config = function()
      require('hlsearch').setup()
    end,
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
