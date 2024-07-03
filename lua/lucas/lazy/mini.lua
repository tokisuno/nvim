return {
  {
    'echasnovski/mini.nvim',

    version = false,
    config = function ()
      -- This entire statusline was stolen from u/walker_jayce 
      -- https://github.com/DanWlker/kickstart.nvim/blob/438950c351025e30586c8d86b7d03d7b3f974096/init.lua
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      local CTRL_S = vim.api.nvim_replace_termcodes('<C-S>', true, true, true)
      local CTRL_V = vim.api.nvim_replace_termcodes('<C-V>', true, true, true)
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_mode = function(args)
        local modes = setmetatable({
          ['n'] = { long = '(˵•̀ ᴗ -)', short = 'N', hl = 'MiniStatuslineModeNormal' },
          ['v'] = { long = '( -_・)σ', short = 'V', hl = 'MiniStatuslineModeVisual' },
          ['V'] = { long = '( -_・)σ', short = 'V-L', hl = 'MiniStatuslineModeVisual' },
          [CTRL_V] = { long = '( -_・)σ', short = 'V-B', hl = 'MiniStatuslineModeVisual' },
          ['s'] = { long = '(´ ▽｀) ', short = 'S', hl = 'MiniStatuslineModeVisual' },
          ['S'] = { long = '(´ ▽｀) ', short = 'S-L', hl = 'MiniStatuslineModeVisual' },
          [CTRL_S] = { long = '(´ ▽｀) ', short = 'S-B', hl = 'MiniStatuslineModeVisual' },
          ['i'] = { long = '(•̀ - •́ )', short = 'I', hl = 'MiniStatuslineModeInsert' },
          ['R'] = { long = '( •̯́ ₃ •̯̀)', short = 'R', hl = 'MiniStatuslineModeReplace' },
          ['c'] = { long = 'Σ(°△°ꪱꪱ)', short = 'C', hl = 'MiniStatuslineModeCommand' },
          ['r'] = { long = 'Σ(°△°ꪱꪱ)', short = 'P', hl = 'MiniStatuslineModeOther' },
          ['!'] = { long = 'Σ(°△°ꪱꪱ)', short = 'Sh', hl = 'MiniStatuslineModeOther' },
          ['t'] = { long = ' (⌐■_■) ', short = 'T', hl = 'MiniStatuslineModeOther' },
        }, {
          __index = function()
            return { long = 'Unknown', short = 'U', hl = '%#MiniStatuslineModeOther#' }
          end,
        })
        local mode_info = modes[vim.fn.mode()]
        local mode = MiniStatusline.is_truncated(args.trunc_width) and mode_info.short or mode_info.long
        return mode, mode_info.hl
      end
    end,
  },
}
