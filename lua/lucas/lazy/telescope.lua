return {
  {"nvim-telescope/telescope.nvim",
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  version = '0.1.5',
  config = function (_, opts)
    require("telescope").setup(opts)
  end
  },
}

