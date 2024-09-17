return {
  {'nvim-treesitter/nvim-treesitter'},
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {"L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      'rafamadriz/friendly-snippets',
      'saadparwaiz1/cmp_luasnip'
    },
  },
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'echasnovski/mini.nvim', version = false},
  {'nvim-lua/plenary.nvim'},
  {'lewis6991/gitsigns.nvim'},
  {'pocco81/auto-save.nvim'},
  {"ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
		config = function ()
			local harpoon = require('harpoon')
      harpoon:setup()
		end
  },
  {'mvllow/modes.nvim', config = function() require('modes').setup() end},
  {"HiPhish/rainbow-delimiters.nvim"},
  {'nvimdev/hlsearch.nvim',
    event = 'BufRead',
    config = function()
      require('hlsearch').setup()
    end,
  },
  {"ibhagwan/fzf-lua", config = function() require("fzf-lua").setup({}) end},
  {"norcalli/nvim-colorizer.lua", config = function() require('colorizer').setup() end},
  {"nvim-telescope/telescope.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'sharkdp/fd'
    },
    version = '0.1.5',
    config = function ()
      require("telescope").setup({
      })
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
}
