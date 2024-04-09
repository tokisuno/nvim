return {
  -- Lazy
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme onedark")
    end
  },
  {'norcalli/nvim-colorizer.lua'}
}
