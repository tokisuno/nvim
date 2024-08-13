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
}
