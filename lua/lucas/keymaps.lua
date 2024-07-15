-- tokisuno keybindings
-- 2024-03-01
-- description: adding which-key support

local wk = require("which-key")
local k = vim.keymap.set
local ls = require("luasnip")
local opts = { noremap = true, silent = true }
local builtin = require('telescope.builtin')
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Byebye arrow keys
k('', '<up>',    '<nop>')
k('', '<down>',  '<nop>')
k('', '<left>',  '<nop>')
k('', '<right>', '<nop>')

-- Buffer movement
k('n', '<C-p>', ':bprev<cr>')
k('n', '<C-n>', ':bnext<cr>')

-- Resize windows
k('n', '<M-z>', '5<C-w>>')
k('n', '<M-x>', '5<C-w><')

-- Quality of life
k("n", "<C-d>", "<C-d>zz")
k("n", "<C-u>", "<C-u>zz")
k("n", "n", "nzzzv")
k("n", "N", "Nzzzv")
k("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
k("n", "<leader><CR>", ":noh<CR>")
k("n", "<leader>Q", ":q!<Cr>")
k("n", "<C-s>", "S")
k({"n", "v", "s"}, "<C-q>", "=")
k({"n", "v", "s"}, "<M-m>", "%")
k("n", "<leader>d", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
k("n", "o", "o<esc>")
k("n", "O", "O<esc>")

-- Sets launch perms for file being written to
k("n", "<leader>xx", "<cmd>!chmod +x %<CR>", { silent = true })

-- ctrl-backspace when in insert mode
k("i", "<C-h>", "<C-w>", { silent = true })

-- luasnip keymaps
k({"i"     }, "<C-k>", function() ls.expand() end, {silent = true})
k({"i", "s"}, "<C-r>", function() ls.jump( 1) end, {silent = true})
k({"i", "s"}, "<C-e>", function() ls.jump(-1) end, {silent = true})
k({"i", "s"}, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, {silent = true})


-- # which-key.nvim # --
wk.register({
  c = {
    name = "Run with...",
    n = {":!node %<CR>",                 "[n]ode on current buffer"},
  },
  f = {
    z = {":Telescope bibtex<CR>",        "Find Zotero Citation", opts},
  },
  i = {
    name = "Emoticons",
    e = {"<space>:Telescope symbols",    "Emoji picker"},
  },
  p = {
    name = "Files",
    b = {builtin.buffers,                "View buffers"},
    g = {builtin.live_grep,              "Live grep"},
    h = {builtin.help_tags,              "Help tags"},
    s = {builtin.find_files,             "Find files"},
    v = {"<cmd>e .<cr>",                 "Open Netrw"},
  },
  l = {
    name = "LaTeX",
    c = {"<cmd>VimtexCountWords<cr>",    "Count words (.tex)"},
    l = {":Lazy<cr>",                    "Open Lazy"},
  },
  q = {
    name = "Buffers",
    e = {":q<cr>",                       "Quits out of window"},
    q = {vim.cmd.bd,                     "Unload Buffer"},
  },
  w = {
    name = ":w with whatever",
    f = {":w<cr>",                       "[s]ave [f]ile",        silent = false},
    q = {":wq<cr>",                      "[s]ave and [l]eave",   silent = false},
  },
  t = {
    name = "Toggle",
    d = {":call ToggleDeadKeys()<CR>",   "Toggle Deadkeys"},
    f = {":TZAtaraxis<CR>",              "Toggle focus"},
    i = {":call ToggleIPA()<CR>",        "Toggle IPA"},
    t = {":Twilight<cr>",                "Toggle twilight"},
    p = {":call ToggleProse()<CR>",      "Toggle Prose"},
    s = {":LiveServerToggle<CR>",        "Toggle live-server"},
    w = {":setlocal wrap!<CR>",          "Toggle word-wrapping"},
  },
  s = {
    name = "Set/Save",
    c = {":ColorizerAttachToBuffer<cr>", "[s]et [c]olorizer",    silent = false},
    t = {
      name = "filetype",
      b = {":set ft=bash<cr>",           "Bash"},
      l = {":set ft=lua<cr>",            "Lua"},
      p = {":set ft=python<cr>",         "Python"},
      r = {":set ft=rust<cr>",           "Rust"},
    },
  },
},                                       {prefix = "<leader>"})
