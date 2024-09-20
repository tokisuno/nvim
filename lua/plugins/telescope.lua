return {
  {"nvim-telescope/telescope.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'sharkdp/fd'
    },
    version = '0.1.5',
  },
  {"nvim-telescope/telescope-bibtex.nvim"},
  {"nvim-telescope/telescope-ui-select.nvim"},
  {"nvim-telescope/telescope-frecency.nvim"},
  {"nvim-telescope/telescope-cheat.nvim",
    dependencies = {
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope.nvim"
    }
  }
}
