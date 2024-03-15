-- tokisuno keybindings
-- 2024-03-01
-- description: adding which-key support

local wk = require("which-key")
local k = vim.keymap.set
local opts = { noremap = true, silent = true }
local builtin = require('telescope.builtin')
require("true-zen.ataraxis")

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Buffer movement
k('', '<up>', '<nop>')
k('', '<down>', '<nop>')
k('', '<left>', '<nop>')
k('', '<right>', '<nop>')
k('n', '<C-h>', '<C-w>h')
k('n', '<C-j>', '<C-w>j')
k('n', '<C-k>', '<C-w>k')
k('n', '<C-l>', '<C-w>l')
k('n', '<leader>j', ':bprev<cr>')
k('n', '<leader>k', ':bnext<cr>')

-- # which-key.nvim # --
wk.register({
    c = {
        name = "Cite...",
        m = {":BibtexciteInsert p<CR>", "Pandoc Citation"},
        l = {":BibtexciteInsert l<CR>", "Latex Citation"},
        s = {
            name = "Source...",
            g = {":call BibGender()<cr>", "Gender"},
            c = {":call BibClitics()<cr>", "Clitics"},
            p = {":call BibPhilo()<cr>", "Philosophy"},
        },
    },
    p = {
        name = "Files",
        b = {builtin.buffers, "View buffers"},
        s = {builtin.find_files, "Find files"},
        g = {builtin.live_grep, "Live grep"},
        h = {builtin.help_tags, "Help tags"},
        f = {"<cmd>e .<cr>", "Open NvimTree"},
    },
    l = {
        name = "LaTeX",
        c = {"<cmd>VimtexCountWords<cr>", "Count words (.tex)"},
        d = {":call ToggleDeadKeys()<CR>", "Toggle Deadkeys"},
        i = {":call ToggleIPA()<CR>", "Toggle IPA"},
        t = {":call ToggleProse()<CR>", "Toggle Prose"},
    },
    q = {
        name = "Buffers",
        Q = {vim.cmd.bw, "Kill Buffer"},
        q = {vim.cmd.bd, "Unload Buffer"},
    },
    r = {
        name = "Leetcode",
        r = {"<cmd>Leet lang<cr>", "Change language"},
        t = {"<cmd>Leet test<cr>", "Test code"},
        s = {"<cmd>Leet submit<cr>", "Submit answer"},
    },
    g = {
        name = "TODO",
        i = {"<Plug>(simple-todo-new)", "New item"},
        d = {"<Plug>(simple-todo-mark-as-done)", "Mark as done"},
        u = {"<Plug>(simple-todo-mark-as-undone)", "Mark as undone"},
        s = {"<Plug>(simple-todo-mark-switch)", "Switch status"},
    },
    t = {
        name = "Splits",
        k = {"<C-w>t<C-w>K", "V to H"},
        h = {"<C-w>t<C-w>H", "H to V"},
        s = {":split<cr>", "Create split"},
        v = {":vs<cr>", "Create vertical split"}
    },
    s = {
        name = "Set...",
        f = {
            name = "Filetype",
            b = {":set ft=bash<cr>", "Bash"},
            l = {":set ft=lua<cr>", "Lua"},
            p = {":set ft=python<cr>", "Python"},
            r = {":set ft=rust<cr>", "Rust"},
        },
        u = {
            name = "UI/UX",
            a = {"<cmd>set nu relativenumber<cr>", "Relative numbers"},
            f = {"<cmd>set norelativenumber<cr>", "Plain numbers"},
            r = {":nnoremap j j| nnoremap k k| echo 'real line jumping'<cr>", "Real line jumping"},
            v = {":nnoremap j gj| nnoremap k gk| echo 'visual line jumping'<cr>", "Visual line jumping"},
        },
        o = {":so ~/.config/nvim/init.lua<cr>", "Source config"},
    },
    w = {
        name = "Saving",
        f = {"<cmd>:w<cr>", ":w (Write file)"},
        l = {"<cmd>:wq<cr>", ":wq (Write -> Leave)"},
    },
    z = {
        name = "Zettelkasten",
        n = {"<Cmd>ZkNew {title = vim.fn.input('Title: ')}<CR>", "Create Zettel"},
        o = {"<Cmd>ZkNotes {sort = {'modified'}}<CR>", "View Zettles"},
        t = {"<Cmd>ZkTags<CR>", "Zettel Tags"},
        f = {"<Cmd>ZkNotes {sort = {'modified'}, match = {vim.fn.input('Search: ')}}<CR>", "Search Zettels"}
    },
}, {prefix = "<leader>"})

-- Visual mode remaps
wk.register({
    z = {
        f = {":'<,'>ZkMatch<CR>", "Search for notes matching selection"},
    },
}, {prefix = "<leader>", mode = "v"})

-- # Native Neovim Remaps # --
k("n", "<F12>", ":TZAtaraxis<CR>", {})

-- Movement binds
k("v", "J", ":m '>+1<CR>gv=gv")
k("v", "K", ":m '<-2<CR>gv=gv")
k("n", "o", "o<esc>")
k("n", "O", "O<esc>")
k("n", "J", "mzJ`z")

-- Visual/replacement binds
k("n", "<C-d>", "<C-d>zz")
k("n", "<C-u>", "<C-u>zz")
k("n", "n", "nzzzv")
k("n", "N", "Nzzzv")
k("n", "<leader>d", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Sets launch perms for file being written to
k("n", "<leader>xx", "<cmd>!chmod +x %<CR>", { silent = true })

-- Bbitexcite keymaps
vim.cmd("autocmd FileType markdown  nnoremap <buffer> <silent> <leader>nc :BibtexciteInsert<CR>")
vim.cmd("autocmd FileType markdown  inoremap <buffer> <silent> @@ <Esc>:BibtexciteInsert<CR>")

-- LuaSnips keymaps 
k('n', '<Leader>L', '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})<CR>')
vim.cmd("imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' ")
vim.cmd("imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>'")
vim.cmd("imap <silent><expr> <C-r> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-r>'")
vim.cmd("smap <silent><expr> <C-r> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-r>'")
vim.cmd("imap <silent><expr> <C-e> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-e>'")
vim.cmd("smap <silent><expr> <C-e> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-e>'")

