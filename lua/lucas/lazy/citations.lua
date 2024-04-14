-- plugins/telescope.lua:
return {
  "nvim-telescope/telescope-bibtex.nvim",
    requires = {
      {'nvim-telescope/telescope.nvim'},
    },
    config = function ()
      local bibtex_actions = require('telescope-bibtex.actions')
      require("telescope").setup {
        extensions = {
          bibtex = {
            depth = 1,
            custom_formats = {
                {id = "zk", cite_marker = "#%s"}
            },
            format = '',
            -- global_files = {"~/Dropbox/latex/bibs/gender.bib"},
            search_keys = { 'author', 'year', 'title' },
            citation_format = '{{author}} ({{year}}), {{title}}.',
            citation_trim_firstname = true,
            citation_max_auth = 2,
            context = true,
            context_fallback = true,
            wrap = false,
            mappings = {
                i = {
                  ["<CR>"] = bibtex_actions.key_append('%s'),
                  ["<C-e>"] = bibtex_actions.entry_append,
                  ["<C-c>"] = bibtex_actions.citation_append('{{author}} ({{year}}), {{title}}.'),
                }
            },
          },
        }
      }
      require"telescope".load_extension("bibtex")
    end,
}
