return {
  {'renerocksai/telekasten.nvim',
  dependencies = {'nvim-telescope/telescope.nvim', 'renerocksai/calendar-vim'},
  init = function()
    require('telekasten').setup({
      home = vim.fn.expand("~/Sync/zet"), -- Put the name of your notes directory here
    })
  end
  },
}
