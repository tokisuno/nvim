local opts = { noremap = true, silent = true }
vim.opt_local.spell = true
vim.opt_local.spelllang = { "en_us" }
vim.opt_local.wrap = true
vim.api.nvim_buf_set_keymap(0, 'n', 'j', 'gj', opts)
vim.api.nvim_buf_set_keymap(0, 'n', 'k', 'gk', opts)
vim.opt_local.conceallevel = 3
