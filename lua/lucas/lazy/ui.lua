return {
  {'nvim-lua/plenary.nvim'},
  {'nvim-treesitter/nvim-treesitter'},
  {'lewis6991/gitsigns.nvim'},
  {"karb94/neoscroll.nvim",
		config = function ()
			require('neoscroll').setup({})
		end
  },
  {'mvllow/modes.nvim',
    config = function ()
      require('modes').setup()
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
}
