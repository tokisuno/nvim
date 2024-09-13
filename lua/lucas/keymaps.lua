local map    = vim.keymap.set
local wk   = require("which-key")
local opts = { noremap=true, silent=false }

local builtin = require('telescope.builtin')
local harpoon = require('harpoon')

vim.g.mapleader      = " "
vim.g.maplocalleader = ","

-- Removing arrow key navigation (to turn into something later)
map('', '<up>',    '<nop>')
map('', '<down>',  '<nop>')
map('', '<left>',  '<nop>')
map('', '<right>', '<nop>')

-- Buffer movement
map('n', '<C-p>', ':bprev<cr>')
map('n', '<C-n>', ':bnext<cr>')

-- Resize windows
map('n', '<M-9>', '5<C-w>>')
map('n', '<M-0>', '5<C-w><')

-- Quality of life
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<A-o>", "o<esc>")
map("n", "<A-O>", "O<esc>")
map("n", "<leader>dd", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
map("n", "<leader>dt", ":pu=strftime('%c')<cr>")

-- Sets launch perms for file being written to
map("n", "<leader>xx", "<cmd>!chmod +x %<CR>", { silent = true })

-- ctrl-backspace when in insert mode
map("i", "<C-h>", "<C-w>", { silent = true })

-- harpoon2: electric boogaloo
map("n", "<leader>a", function() harpoon:list():add() end)
map("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
map("n", "<leader>h", function() harpoon:list():select(1) end)
map("n", "<leader>j", function() harpoon:list():select(2) end)
map("n", "<leader>k", function() harpoon:list():select(3) end)
map("n", "<leader>l", function() harpoon:list():select(4) end)

harpoon:extend({
  UI_CREATE = function(cx)
    vim.keymap.set("n", "<C-v>", function()
      harpoon.ui:select_menu_item({ vsplit = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "<C-x>", function()
      harpoon.ui:select_menu_item({ split = true })
    end, { buffer = cx.bufnr })
  end,
})


-- # which-key.nvim # --
wk.add({
  {"<leader>c", group="compile"},
  {"<leader>cn", ":!node %<cr>", desc="Node.js"},
  {"<leader>cc", ":!gcc % -o asdf && ./asdf<cr>", desc="Compile C"},
  {"<leader>ck", ":!gcc -O -Wall -W -pedantic -ansi -std=c99 -o asdf %<cr>", desc="Modern Approach C Flags"},

  {"<leader>f", group="Files"},
  {"<leader>fb", builtin.buffers, desc="Open buffers"},
  {"<leader>ff", builtin.find_files, desc="Find files"},
  {"<leader>fg", builtin.live_grep, desc="Live grep"},
  {"<leader>fh", builtin.help_tags, desc="Help tags"},
  {"<leader>fm", builtin.man_pages, desc="Open man pages"},
  {"<leader>fo", builtin.oldfiles, desc="Find files"},

  {"<leader>pv", ":e .<cr>", desc="Explorador de archivos"},

  {"<leader>o", ":Lazy<cr>", desc="Open Lazy"},

  {"<leader>q", group="Quit"},
  {"<leader>Q", ":q!<Cr>", desc=":q!"},
  {"<leader>qe", ":q<cr>", desc="Quits out of window"},
  {"<leader>qq", vim.cmd.bd, desc="Unload buffer"},

  {"<leader>w", group="Write"},
  {"<leader>wf", ":w<cr>", desc="Save"},
  {"<leader>wq", ":wq<cr>", desc="Save and quit"},

  {"<leader>t", group="Toggles"},
  {"<leader>ts", ":LiveServerToggle<cr>", desc="LiveServerToggle"},
  {"<leader>tw", ":setlocal wrap!<cr>", desc="Word wrapping"},
  {"<leader>tn", ":NoNeckPain<cr>", desc="Centre workspace"},

  {"<leader>n", group="Neorg"},
})
