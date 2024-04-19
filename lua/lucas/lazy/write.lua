return {
    {"folke/zen-mode.nvim",
      opts = {
        window = {
          backdrop = 0.95,
          width = 0.80,
          height = 0.90,
          options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
            cursorline = false,
            cursorcolumn = false,
            foldcolumn = "0",
            list = false,
          },
        },
        plugins = {
          options = {
            enabled = true,
            ruler = true,
            showcmd = false,
            laststatus = 0,
          },
          gitsigns = { enabled = false },
          tmux = { enabled = false },
          alacritty = {
            enabled = false,
            font = "14",
          },
        },
      },
    },
    {'Lukesmithxyz/vimling', ft = {"tex", "md"}},
    {'jghauser/follow-md-links.nvim', ft = {'md'}},
    {'xuhdev/vim-latex-live-preview', ft = {"tex"}},
    {'lervag/vimtex',
      ft = {"tex"},
      config = function()
        vim.g['tex_flavor'] = 'latex'
        vim.g['vimtex_compiler_latexmk_engines'] = {['_'] = '-xelatex'}
        vim.g['vimtex_view_method'] = 'zathura'
        vim.g['vimtex_view_general_viewer'] = 'zathura'
        vim.g['vimtex_view_general_options'] = '--unique file:@pdf#src@line@tex'
        vim.g['vimtex_compiler_method'] = 'latexmk'
        vim.g['vimtex_view_automatic'] = 1
      end
    },
}
