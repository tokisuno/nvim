return {
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function ()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                life = "~/Dropbox/neorg/life",
                notes = "~/Dropbox/neorg/notes",
                yt = "~/Dropbox/neorg/yt",
              },
              default_workspace = "life",
            },
          },
        },
      })
      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 3
    end
  }
}
