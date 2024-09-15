return {
    {'Lukesmithxyz/vimling', ft = {"tex", "md"}},
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
