return {
    {'tpope/vim-surround'},
    {'Pocco81/true-zen.nvim'},
    {'ferdinandyb/bibtexcite.vim'},
    {'Lukesmithxyz/vimling'},
    {'lervag/vimtex'},
    {'xuhdev/vim-latex-live-preview'},
    -- notetaking
    {'zk-org/zk-nvim', config = function()
        require("zk").setup({
            picker = "select",
            lsp = {
                config = {
                    cmd = { "zk", "lsp" },
                    name = "zk",
                },
                auto_attach = {
                    enabled = true,
                    filetypes = { "markdown" },
                },
            },
        })
    end
},
}
