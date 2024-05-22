return {
  {"nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-bibtex.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      'nvim-lua/plenary.nvim',
    },
    version = '0.1.5',
    opts = {
      extensions = {
        symbols = {
          sources = {
            'emoji',
            'kaomoji',
          },
        },
        bibtex = {
          depth = 1,
          custom_formats = {
            {
              id = "zettel", cite_marker = "#%s"
            }
          },
          format = 'auto',
          global_files = {
            "~/Dropbox/latex/bibs/clitics.bib",
            "~/Dropbox/latex/bibs/syntax.bib",
            "~/Dropbox/latex/bibs/philosophy.bib",
            "~/Dropbox/latex/bibs/programming.bib",
          },
          citation_max_auth = 2,
          context = false,
          context_fallback = true,
          wrap = false,
        },
      }
    },
    config = function (_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("bibtex")
    end
  },
}

