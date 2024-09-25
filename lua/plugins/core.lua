return {
  {'nvim-treesitter/nvim-treesitter'},
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
  {'neovim/nvim-lspconfig'},
  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {"L3MON4D3/LuaSnip",
    event = "InsertEnter",
    dependencies = {
      'rafamadriz/friendly-snippets',
      'saadparwaiz1/cmp_luasnip'
    },
  },

  {'echasnovski/mini.nvim', version = false},

  {'dgagn/diagflow.nvim'},
  {'nvim-lua/plenary.nvim'},
  {'lewis6991/gitsigns.nvim'},
  {'HiPhish/rainbow-delimiters.nvim'},
  {'folke/zen-mode.nvim'},
  {'folke/trouble.nvim', opts = {}, cmd = "Trouble"},
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  {'nvim-lualine/lualine.nvim'},
  {"ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      local harpoon = require('harpoon')
      harpoon:setup()
    end
  },
  {"letieu/harpoon-lualine",
    dependencies = {
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      }
    },
  },

  {'nvimdev/hlsearch.nvim',
    event = 'BufRead',
    config = function()
      require('hlsearch').setup()
    end,
  },
  {"norcalli/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup()
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
