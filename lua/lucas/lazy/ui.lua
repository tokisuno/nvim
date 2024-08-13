return {
  {'nvim-treesitter/nvim-treesitter'},
  {'lewis6991/gitsigns.nvim'},
  {'nvim-lua/plenary.nvim'},
	{"numToStr/Comment.nvim"},
  {'mvllow/modes.nvim',
    config = function ()
      require('modes').setup()
    end
  },
  {'numToStr/FTerm.nvim',
    config = function ()
      require('FTerm').setup({
        border = 'double',
        dimensions = {
          height = 0.9,
          width = 0.9,
        },
      })
    end
  },

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
