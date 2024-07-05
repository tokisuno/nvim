return {
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/nvim-cmp'},
  {"L3MON4D3/LuaSnip",
  event = "InsertEnter",
  dependencies = {
    -- 'rafamadriz/friendly-snippets',
    'saadparwaiz1/cmp_luasnip'
  },
  config = function()
    -- local luasnip = require('luasnip')
    require("luasnip.loaders.from_vscode").lazy_load()
    local luasnip = require("luasnip")
    local cmp = require("cmp")

    cmp.setup({
      mapping = {
        ['<CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            if luasnip.expandable() then
              luasnip.expand()
            else
              cmp.confirm({
                select = true,
              })
            end
          else
            fallback()
          end
        end),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
    })
    end
  }
}
