local set = vim.opt
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

--# opts #--
set.termguicolors = true
set.guicursor = ""
set.cursorline = true

-- wildmenu --
set.wildmenu = true
set.wildmode = "list:longest"
set.wildignore = {'*.docx','*.jpg','*.png','*.gif','*.pdf','*.pyc','*.exe','*.flv','*.img','*.xlsx'}

-- number column --
set.nu = true
set.relativenumber = true
set.signcolumn = "no"

-- syntax --
vim.cmd('syntax on')
vim.cmd('syntax enable')
vim.cmd('filetype plugin on')
vim.cmd('filetype indent off')

-- backups --
set.swapfile = false
vim.o.backup = true
vim.o.backupdir = os.getenv('HOME') .. '/.vim/backup'
set.undofile = true
set.undodir=os.getenv("HOME") .. "/.vim/undodir"
set.isfname:append("@-@")
set.undofile = true

-- formatting --
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.updatetime = 50
set.scrolloff = 6
set.expandtab = true
set.wrap = true
set.linebreak = true
set.clipboard = "unnamedplus"
set.colorcolumn="80"
set.ttimeoutlen=50

-- settings for markdown/latex writing
augroup('writing_settings', { clear = true })
autocmd("Filetype", {
  group = 'writing_settings',
  pattern = {"markdown", "latex"},
  command = "setlocal cc=0 conceallevel=2"
})

augroup('colonindent', { clear = true })
autocmd("Filetype", {
  group = 'colonindent',
  pattern = {"cpp", "cc", "rust"},
  command = "setlocal indentkeys-=<:>"
})

autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

augroup('set_wrap', { clear = true })
autocmd('FileType', {
  group = 'set_wrap',
  pattern = {
    'gitcommit',
    'markdown',
    'text',
  },
  callback = function()
    local opts = { noremap = true, silent = true }
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
    vim.api.nvim_buf_set_keymap(0, 'n', 'j', 'gj', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'k', 'gk', opts)
  end,
})

-- search --
vim.cmd('set nohlsearch')
vim.cmd('set incsearch')

-- smart --
set.smartcase = true
set.smarttab = true
set.smartindent = true
set.breakindent = true

-- show --
set.showcmd = true
set.showmode = true
set.showmatch = true

-- misc --
set.history = 100
vim.cmd("set mouse=a")
vim.cmd("set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20")

-- netrw --
-- @default = 20
vim.g.netrw_winsize = 50
vim.g.netrw_banner = 1
vim.g.netrw_keepdir = 1
vim.g.netrw_sort_sequence = [[[\/]$,*]]
vim.g.netrw_sizestyle = "H"
vim.g.netrw_liststyle = 3 -- or 1
vim.g.netrw_list_hide = vim.fn["netrw_gitignore#Hide"]()
vim.g.netrw_preview = 1
vim.g.netrw_browse_split = 0

