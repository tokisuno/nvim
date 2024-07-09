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
k("n", "o", "o<esc>")
k("n", "O", "O<esc>")

-- Quality of life
k("n", "<C-d>", "<C-d>zz")
k("n", "<C-u>", "<C-u>zz")
k("n", "n", "nzzzv")
k("n", "N", "Nzzzv")
k("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
k("n", "<leader><CR>", ":noh<CR>")
k("n", "<leader>Q", ":q!<Cr>")

-- Sets launch perms for file being written to
k("n", "<leader>xx", "<cmd>!chmod +x %<CR>", { silent = true })

-- ctrl-backspace when in insert mode
k("i", "<C-h>", "<C-w>", { silent = true })

-- # which-key.nvim # --
wk.register({
  c = {
    name = "Run with...",
    n = {":!node %<CR>", "[n]ode on current buffer"},
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
    l = {":Lazy<cr>", "Open Lazy"},
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
    s = {":LiveServerToggle<CR>", "Toggle live-server"},
    w = {":setlocal wrap!<CR>", "Toggle word-wrapping"},
  },
  s = {
    name = "Set/Save",
    c = {":ColorizerAttachToBuffer<cr>", "[s]et [c]olorizer", silent = false},
    l = {":wq<cr>", "[s]ave and [l]eave", silent = false},
    f = {":w<cr>", "[s]ave [f]ile", silent = false},
    t = {
      name = "filetype",
      b = {":set ft=bash<cr>", "Bash"},
      l = {":set ft=lua<cr>", "Lua"},
      p = {":set ft=python<cr>", "Python"},
      r = {":set ft=rust<cr>", "Rust"},
    },
  },
}, {prefix = "<leader>"})
