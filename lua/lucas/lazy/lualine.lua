return {
  {'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'onedark',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
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
          lualine_b = {{'buffers',
            max_length = vim.o.columns * 2 / 3,
            filetype_names = {
              TelescopePrompt = 'Telescope',
              fzf = 'FZF'
            },
            use_mode_colors = false,},
          },
          lualine_c = {
              {"harpoon2",
              icon = '(´∇｀)',
              indicators = { "1", "2", "3", "4" },
              active_indicators = { "[1]", "[2]", "[3]", "[4]" },
              _separator = " ",
              no_harpoon = "Harpoon not loaded",
            },
          },
          lualine_x = {'diff', 'diagnostics', 'branch', 'encoding', },
          lualine_y = {'filetype', 'progress', {
            function()
                local words = vim.fn.wordcount()['words']
                return 'Words: ' .. words
            end,
            cond = function()
                local ft = vim.opt_local.filetype:get()
                local count = {
                    latex = true,
                    tex = true,
                    text = true,
                    markdown = true,
                    vimwiki = true,
                }
                return count[ft] ~= nil
            end,
          },
        },
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
      }
    end
  }
}
