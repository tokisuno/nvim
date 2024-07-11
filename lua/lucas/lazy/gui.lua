return {
  {'nvim-lua/plenary.nvim'},
  {'lewis6991/gitsigns.nvim'},
  {'nvim-treesitter/nvim-treesitter'},
  {'nvimdev/hlsearch.nvim',
  event = 'BufRead',
  config = function()
    require('hlsearch').setup()
  end,
  },
  {"folke/twilight.nvim"},
  {"j-hui/fidget.nvim"},
}
