local k    = vim.keymap.set
local wk   = require("which-key")
local ls   = require("luasnip")
local opts = { noremap = true, silent = true }

local builtin = require('telescope.builtin')
local themes  = require('telescope.themes')
local harpoon = require('harpoon')

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


-- harpoon2: electric boogaloo
k("n", "<leader>a", function() harpoon:list():add() end)
k("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
k("n", "<leader>h", function() harpoon:list():select(1) end)
k("n", "<leader>j", function() harpoon:list():select(2) end)
k("n", "<leader>k", function() harpoon:list():select(3) end)
k("n", "<leader>l", function() harpoon:list():select(4) end)

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

  -- Finding/managing files
  {"<leader>f", group="Files"},
  {"<leader>fg", function() builtin.live_grep(themes.get_dropdown({})) end, desc="Live grep"},
  {"<leader>fh", function() builtin.help_tags(themes.get_dropdown({})) end, desc="Help tags"},
  {"<leader>ff", function() builtin.find_files(themes.get_dropdown({})) end, desc="Find files"},
  {"<leader>fb", function() builtin.buffers(themes.get_dropdown({})) end, desc="Open buffers"},

  -- Legacy keymap (opens oil)
  {"<leader><leader>", ":e .<cr>", desc="Explorador de archivos"},

  -- Opening lazy.nvim menu
  {"<leader>o", ":Lazy<cr>", desc="Open Lazy"},

  -- Quit
  {"<leader>q", group="Quit"},
  {"<leader>Q", ":q!<Cr>", desc=":q!"},
  {"<leader>qe", ":q<cr>", desc="Quits out of window"},
  {"<leader>qq", vim.cmd.bd, desc="Unload buffer"},

  -- Write
  {"<leader>w", group="Write"},
  {"<leader>wf", ":w<cr>", desc="Save"},
  {"<leader>wq", ":wq<cr>", desc="Save and quit"},

  -- Toggles
  {"<leader>t", group="Toggles"},
  {"<leader>ts", ":LiveServerToggle<cr>", desc="LiveServerToggle"},
  {"<leader>tw", ":setlocal wrap!<cr>", desc="Word wrapping"},
})
