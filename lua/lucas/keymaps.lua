local map    = vim.keymap.set
local opts = { noremap=true, silent=false }

local builtin = require('telescope.builtin')
local harpoon = require('harpoon')

vim.g.mapleader      = " "
vim.g.maplocalleader = ","

-- Neorg keybinds
map("n", "<leader>nj", ":Neorg journal today")
map("n", "<leader>nt", ":Neorg toc<cr>")

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

map("n", "<leader>cn", ":!node %<cr>")
map("n", "<leader>cc", ":!gcc % -o asdf && ./asdf<cr>")
map("n", "<leader>ck", ":!gcc -O -Wall -W -pedantic -ansi -std=c99 -o asdf %<cr>")

map("n", "<leader>pv", ":e .<cr>")
map("n", "<leader>o", ":Lazy<cr>")

map("n", "<leader>ts", ":LiveServerToggle<cr>")
map("n", "<leader>tw", ":setlocal wrap!<cr>")
map("n", "<leader>tz", ":ZenMode<cr>")

map("n", "<leader>fb", builtin.buffers)
map("n", "<leader>ff", builtin.find_files)
map("n", "<leader>fg", builtin.live_grep)
map("n", "<leader>fh", builtin.help_tags)
map("n", "<leader>fm", builtin.man_pages)
map("n", "<leader>fo", builtin.oldfiles)

map("n", "<leader>Q", ":q!<Cr>")
map("n", "<leader>qe", ":q<cr>")
map("n", "<leader>qq", vim.cmd.bd)

map("n", "<leader>wf", ":w<cr>")
map("n", "<leader>wq", ":wq<cr>")
