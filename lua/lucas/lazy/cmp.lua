return {
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {"L3MON4D3/LuaSnip",
  event = "InsertEnter",
  dependencies = {
    -- 'rafamadriz/friendly-snippets',
    'saadparwaiz1/cmp_luasnip'
  },
  config = function()
    local luasnip = require("luasnip")
    local cmp = require("cmp")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip"  },
      }, {
        { name = "buffer" },
      })
    })
  end
  },
}
