return {
  {"folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function ()
      vim.cmd("colorscheme tokyonight-moon")
    end
  },
  {'norcalli/nvim-colorizer.lua',
    config = function ()
      require('colorizer').setup()
    end
  },
}
