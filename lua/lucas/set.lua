local set = vim.opt
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

-- backups --
set.swapfile = false
vim.o.backup = true
vim.o.backupdir = os.getenv('HOME') .. '/.vim/backup'
set.undofile = true
set.undodir=os.getenv("HOME") .. "/.vim/undodir"
set.isfname:append("@-@")
set.undofile = true

-- formatting --
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true
set.updatetime = 50
set.scrolloff = 6
set.expandtab = true
set.wrap = true
set.linebreak = true
set.clipboard = "unnamedplus"
set.colorcolumn="80"

-- filetype dependent tabbing
vim.api.nvim_create_autocmd("Filetype", {
  pattern = {"c", "cpp", "py"},
  callback = function ()
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
  end
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
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

-- vim-simple-todo
vim.cmd("let g:simple_todo_map_keys = 0")

-- latex --
vim.g['tex_flavor'] = 'latex'
vim.g['vimtex_compiler_latexmk_engines'] = {['_'] = '-xelatex'}
vim.g['vimtex_view_method'] = 'zathura'
vim.g['vimtex_view_general_viewer'] = 'zathura'
vim.g['vimtex_view_general_options'] = '--unique file:@pdf#src@line@tex'
vim.g['vimtex_compiler_method'] = 'latexmk'
vim.g['vimtex_view_automatic'] = 1

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

