return {
    {'nvim-lua/plenary.nvim'},
    {'lewis6991/gitsigns.nvim'},
    {'nvim-treesitter/nvim-treesitter'},
    {'nvimdev/hlsearch.nvim',
        event = 'BufRead',
        config = function()
            require('hlsearch').setup()
        end,
    },
    {"folke/twilight.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    }

}
