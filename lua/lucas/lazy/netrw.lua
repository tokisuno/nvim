return {
  {'prichrd/netrw.nvim',
    config = function()
      require('netrw').setup({
        mappings = {
          ['p'] = function(payload)
            print(vim.inspect(payload))
          end,
          ['<Leader><Tab>'] = ":echo 'string command'<CR>",
        }
      })
    end
  },
}
