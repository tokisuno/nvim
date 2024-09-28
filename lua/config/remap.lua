local map = vim.keymap.set
local opts = { noremap=true, silent=false }

local builtin = require('telescope.builtin')
local harpoon = require('harpoon')
local vling = require('vling')

local functions = require("config.funcs")

vim.g.mapleader      = " "
vim.g.maplocalleader = ","

-- vling
map("n", "<leader>td", function () vling.deadkeys.toggle() end)
map("n", "<leader>ti", function () vling.ipa.toggle() end)

-- Neorg
map("n", "<leader>nj", ":Neorg journal today<cr>", { desc = "Open journal buffer" })
map("n", "<leader>nt", ":Neorg toc<cr>", { desc = "Generate TOC in buffer" })
map("n", "<leader>nwl", ":Neorg workspace life<cr>", { desc = "Go to workspace:life" })
map("n", "<leader>nwn", ":Neorg workspace notes<cr>", { desc = "Go to workspace:notes" })
map("n", "<leader>nwy", ":Neorg workspace yt<cr>", { desc = "Go to workspace:yt" })

-- Removing arrow key navigation (to turn into something later)
map('', '<up>',    '<nop>')
map('', '<down>',  '<nop>')
map('', '<left>',  '<nop>')
map('', '<right>', '<nop>')

-- Buffer movement
map('n', '<C-p>', ':bprev<cr>')
map('n', '<C-n>', ':bnext<cr>')

-- Quality of life
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<A-o>", "o<esc>")
map("n", "<A-O>", "O<esc>")
map("n", "<leader>dd", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
map("n", "<leader>dt", ":pu=strftime('%c')<cr>")

-- Sets launch perms for file being written to
map("n", "<leader>se", "<cmd>!chmod +x %<CR>", { silent = true })

-- ctrl-backspace when in insert mode
map("i", "<C-h>", "<C-w>", { silent = true })

map("n", "<C-s>", functions.toggle_signs)

-- trouble.nvim
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>")
map("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>")
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>")
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>")

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

map("n", "<leader>pv", ":e .<cr>", { desc = "File explorer" })
map("n", "<leader>o", ":Lazy<cr>", { desc = "Open lazy.nvim" })

map("n", "<leader>ts", ":LiveServerToggle<cr>")
map("n", "<leader>tw", ":setlocal wrap!<cr>")
map("n", "<leader>tz", ":ZenMode<cr>")

map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
map("n", "<leader>ff", builtin.find_files, { desc = "Files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
map("n", "<leader>fm", builtin.man_pages, { desc = "Man pages" })
map("n", "<leader>fo", builtin.oldfiles, {desc = "Old files" })

map("n", "<leader>Q", ":q!<Cr>")
map("n", "<leader>qe", ":q<cr>")
map("n", "<leader>qq", vim.cmd.bd)
