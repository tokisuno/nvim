return {
  {'nvim-lua/plenary.nvim'},
  {"nvim-telescope/telescope.nvim", version = '0.1.5'},
  {'nvim-tree/nvim-web-devicons'},
  {'lewis6991/gitsigns.nvim'},
  {'nvim-lualine/lualine.nvim'},
  {'nvim-treesitter/nvim-treesitter'},
  {'mawkler/modicator.nvim',
    init = function()
      vim.o.cursorline = true
      vim.o.number = true
      vim.o.termguicolors = true
    end,
    opts = {}
  },
  { "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      scope = { enabled = false }
    }
  },
}
