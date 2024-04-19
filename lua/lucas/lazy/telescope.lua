return {
  {"nvim-telescope/telescope.nvim",
    dependencies = "nvim-telescope/telescope-bibtex.nvim",
    version = '0.1.5',
    keys = {{
      "<leader>fz",
      ":Telescope bibtex<CR>",
      desc = "Fuzzy [f]ind bibtex ([z]otero) references",
    }},
    opts = {
      extensions = {
        bibtex = {
          depth = 1,
          custom_formats = {
            {
              id = "zettel", cite_marker = "#%s"
            }
          },
          format = 'zettel',
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

