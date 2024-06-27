local set = vim.opt
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

--# opts #--
set.termguicolors = true
set.guicursor = ""
set.cursorline = true

-- wildmenu --
set.wildmode = "list:longest"
set.wildignore = {'*.docx','*.jpg','*.png','*.gif','*.pdf','*.pyc','*.exe','*.flv','*.img','*.xlsx'}

-- number column --
set.nu = true
set.relativenumber = true
set.signcolumn = "no"

-- backups --
set.swapfile = false
vim.o.backup = false
set.undofile = true
set.undodir=os.getenv("HOME") .. "/.vim/undodir"
set.isfname:append("@-@")
set.undofile = true

-- formatting --
set.tabstop = 4
set.softtabstop = 0
set.shiftwidth = 4
set.expandtab = true
set.updatetime = 50
set.scrolloff = 10
set.expandtab = true
set.wrap = true
set.linebreak = true
set.colorcolumn="0"
set.smartcase = false
set.smartindent = false
set.breakindent = true
set.ttimeoutlen=50

augroup('tabsize2', { clear = true })
autocmd('FileType', {
    group = 'tabsize2',
    pattern = {
        'html',
        'css',
	'lua',
	'luajit',
	'rs',
    },
    callback = function()
        vim.cmd('setlocal tabstop=2 shiftwidth=2 softtabstop=0')
    end,
})

augroup('set_wrap', { clear = true })
autocmd('FileType', {
  group = 'set_wrap',
  pattern = {
    'markdown',
    'tex',
  },
  callback = function()
    local opts = { noremap = true, silent = true }
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
    vim.api.nvim_buf_set_keymap(0, 'n', 'j', 'gj', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'k', 'gk', opts)
  end,
})

-- show --
set.showmode = true
set.showmatch = true

-- misc --
vim.cmd("set mouse=a")
vim.cmd("set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20")
