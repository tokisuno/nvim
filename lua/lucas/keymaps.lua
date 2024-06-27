-- tokisuno keybindings
-- 2024-03-01
-- description: adding which-key support

local wk = require("which-key")
local k = vim.keymap.set
local opts = { noremap = true, silent = true }
local builtin = require('telescope.builtin')
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Byebye arrow keys
k('', '<up>', '<nop>')
k('', '<down>', '<nop>')
k('', '<left>', '<nop>')
k('', '<right>', '<nop>')

-- Buffer movement
k('n', '<C-p>', ':bprev<cr>')
k('n', '<C-n>', ':bnext<cr>')

-- Resize windows
k('n', '<M-l>', '5<C-w>>')
k('n', '<M-h>', '5<C-w><')

-- Movement binds
k("v", "J", ":m '>+1<CR>gv=gv")
k("v", "K", ":m '<-2<CR>gv=gv")
k("n", "o", "o<esc>")
k("n", "O", "O<esc>")
k("n", "J", "mzJ`z")

-- Quality of life
k("n", "<C-d>", "<C-d>zz")
k("n", "<C-u>", "<C-u>zz")
k("n", "n", "nzzzv")
k("n", "N", "Nzzzv")
k("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)

-- k("n", "<A-i>", '<cmd>lua require("FTerm").toggle()<cr>')
-- k("t", "<A-i>", '<c-\\><c-n><cmd>lua require("FTerm").toggle()<cr>')

-- Sets launch perms for file being written to
k("n", "<leader>xx", "<cmd>!chmod +x %<CR>", { silent = true })



k("i", "<C-h>", "<C-w>", { silent = true })

-- # which-key.nvim # --
wk.register({
  c = {
    name = "Compile",
    a = {":ColorizerAttachToBuffer<cr>", "Attach Colorizer to buffer", silent = false},
  },
  d = {[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Find and replace", silent = false},
  f = {
    z = {":Telescope bibtex<CR>", "Find Zotero Citation", opts},
  },
  i = {
    name = "Emoticons",
    e = {"<space>:Telescope symbols", "Emoji picker"},
  },
  p = {
    name = "Files",
    b = {builtin.buffers, "View buffers"},
    g = {builtin.live_grep, "Live grep"},
    h = {builtin.help_tags, "Help tags"},
    s = {builtin.find_files, "Find files"},
    v = {"<cmd>e .<cr>", "Open Netrw"},
  },
  l = {
    name = "LaTeX",
    c = {"<cmd>VimtexCountWords<cr>", "Count words (.tex)"},
  },
  q = {
    name = "Buffers",
    q = {vim.cmd.bd, "Unload Buffer"},
  },
  t = {
    name = "Toggle",
    d = {":call ToggleDeadKeys()<CR>", "Toggle Deadkeys"},
    f = {":TZAtaraxis<CR>", "Toggle focus"},
    i = {":call ToggleIPA()<CR>", "Toggle IPA"},
    t = {":Twilight<cr>", "Toggle twilight"},
    p = {":call ToggleProse()<CR>", "Toggle Prose"},
    w = {":setlocal wrap!<CR>", "Toggle word-wrapping"},
  },
  s = {
    name = "Set...",
    f = {
      name = "filetype",
      b = {":set ft=bash<cr>", "Bash"},
      l = {":set ft=lua<cr>", "Lua"},
      p = {":set ft=python<cr>", "Python"},
      r = {":set ft=rust<cr>", "Rust"},
    },
    h = {":noh<cr>", "noh"},
    o = {":so ~/.config/nvim/init.lua<cr>", "config"},
  },
  u = {
    name = "UI/UX",
    r = {":nnoremap j j| nnoremap k k| echo 'real line jumping'<cr>", "Real line jumping"},
    v = {":nnoremap j gj| nnoremap k gk| echo 'visual line jumping'<cr>", "Visual line jumping"},
  },
  w = {
    name = "Save..",
    f = {":w<cr>", "file"},
    l = {":wq<cr>", "and leave"},
  },
  z = {
    name = "Zettelkasten",
    a = {":'<,'>lua vim.lsp.buf.range_code_action()<CR>", "Open the code actions for a visual selection", opts},
    b = {"<Cmd>ZkBacklinks<CR>","Open notes linking to the current buffer", opts},
    i = {"<Cmd>ZkInsertLink<CR>","Create a new link", opts},
    l = {"<Cmd>ZkBacklinks<CR>", "Open notes linking to the current buffer", opts},
    s = {"<Cmd>ZkNotes {sort = {'modified'}, match = {vim.fn.input('Search: ')}}<CR>", "Search Zettels", opts},
    t = {"<Cmd>ZkTags<CR>", "Open notes linked by the current buffer", opts},
  },
}, {prefix = "<leader>"})

wk.register({
  z = {
    name = "Zettelkasten",
    c = {":'<,'>ZkNewFromContentSelection { dir = vim.fn.expand('%:p:h'), title = vim.fn.input('Title: ') }<CR>", "Create new Zettel from content selection", opts},
    f = {":'<,'>ZkMatch<CR>", "Search for notes matching selection"},
    t = {":'<,'>ZkNewFromTitleSelection { dir = vim.fn.expand('%:p:h') }<CR>", "Create new Zettel from title selection", opts},
  },
}, {prefix = "<leader>", mode = "v"})

vim.cmd("imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' ")
vim.cmd("imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>'")
vim.cmd("imap <silent><expr> <C-r> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<M-r>'")
vim.cmd("smap <silent><expr> <C-r> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<M-r>'")
vim.cmd("imap <silent><expr> <C-e> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<M-e>'")
vim.cmd("smap <silent><expr> <C-e> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<M-e>'")

