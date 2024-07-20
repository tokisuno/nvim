-- tokisuno keybindiq
-- 2024-03-01
-- description: adding which-key support
local k    = vim.keymap.set
local wk   = require("which-key")
local ls   = require("luasnip")
local opts = { noremap = true, silent = true }

local builtin = require('telescope.builtin')
local themes  = require('telescope.themes')

vim.g.mapleader      = " "
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
k('n', '<M-9>', '5<C-w>>')
k('n', '<M-0>', '5<C-w><')

-- Quality of life
k("n", "<C-d>", "<C-d>zz")
k("n", "<C-u>", "<C-u>zz")
k("n", "n", "nzzzv")
k("n", "N", "Nzzzv")
k("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
k("n", "<C-s>", "S")
k({"n", "v", "s"}, "<C-q>", "=")
k({"n", "v", "s"}, "<M-m>", "%")
k("n", "o", "o<esc>")
k("n", "O", "O<esc>")

k("n", "<leader>dd", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
k("n", "<leader>dt", ":pu=strftime('%c')<cr>")

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
wk.add({
  {"<leader>c", group="compile"},
  {"<leader>cn", ":!node %<cr>", desc="Node.js"},

  -- Finding/managing files
  {"<leader>p", group="Files"},
  {"<leader>pg", function() builtin.live_grep(themes.get_dropdown({})) end, desc="Live grep"},
  {"<leader>ph", function() builtin.help_tags(themes.get_dropdown({})) end, desc="Help tags"},
  {"<leader>ps", function() builtin.find_files(themes.get_dropdown({})) end, desc="Find files"},
  {"<leader>pv", ":e .<cr>", desc="le picker"},

  -- Opening lazy.nvim menu
  {"<leader>ll", ":Lazy<cr>", desc="Open Lazy"},

  -- Quit
  {"<leader>q", group="Quit"},
  {"<leader>Q", ":q!<Cr>", desc=":q!"},
  {"<leader>qe", ":q<cr>", desc="Quits out of window"},
  {"<leader>qq", vim.cmd.bd, desc="Unload buffer"},
  -- Write
  {"<leader>w", group="Write"},
  {"<leader>w", group=":w"},
  {"<leader>wf", ":w<cr>", desc="Save"},
  {"<leader>wq", ":wq<cr>", desc="Save and quit"},

  -- Toggles
  {"<leader>t", group="Toggles"},
  {"<leader>tf", ":TZAtaraxis<cr>", desc="Focus"},
  {"<leader>ts", ":LiveServerToggle<cr>", desc="LiveServerToggle"},
  {"<leader>tw", ":setlocal wrap!<cr>", desc="Word wrapping"},
})
