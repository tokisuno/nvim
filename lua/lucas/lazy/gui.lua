return {
    {'nvim-lua/plenary.nvim'},
    {'nvim-tree/nvim-web-devicons'},
    {'lewis6991/gitsigns.nvim'},
    {'nvim-lualine/lualine.nvim'},
    {'nvim-treesitter/nvim-treesitter'},
    {'mawkler/modicator.nvim',
        init = function()
            vim.o.cursorline = true
            vim.o.number = true
            vim.o.termguicolors = true
        end,
        opts = {}
    },
    {'nvimdev/hlsearch.nvim',
        event = 'BufRead',
        config = function()
            require('hlsearch').setup()
        end,
    },
    {'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
        opts = {},
        config = function ()
            require("ibl").setup()
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
