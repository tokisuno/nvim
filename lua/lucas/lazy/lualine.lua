return {
  {"letieu/harpoon-lualine",
    dependencies = { {"ThePrimeagen/harpoon", branch = "harpoon2",} },
  },
  {'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diagnostics'},
          lualine_c = {'buffers'},
          lualine_x = { 'diff', {
            "harpoon2",
            icon = '♥',
            indicators = { "h", "j", "k", "l" },
            active_indicators = { "H", "J", "K", "L" },
            _separator = " ",
            no_harpoon = "Harpoon not loaded",
          }, 'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      })
    end
  },
  -- {'mawkler/modicator.nvim',
  --   init = function()
  --     vim.o.cursorline = true
  --     vim.o.number = true
  --     vim.o.termguicolors = true
  --   end,
  --   opts = {
  --     show_warnings = true,
  --   }
  -- },
}
