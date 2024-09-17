require("neorg").setup({
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {
      config = {
        icon_preset = 'diamond'
      }
    },

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
    ["core.export"] = {},
  },
})

