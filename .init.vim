lua vim.opt.termguicolors = true
lua vim.g.mapleader = " "
lua vim.g.maplocalleader = ","
lua require('notational-fzf-vim')
lua require('lazy-config')
lua require('keymaps')
lua require('luasnip.loaders.from_lua').lazy_load({paths = '~/.config/nvim/LuaSnip/'})
source ~/.config/nvim/vimscript/wiki.vim
source ~/.config/nvim/vimscript/bib.vim

colorscheme dracula 

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set nocompatible
filetype on
filetype plugin on 
syntax on
syntax enable

set guicursor=""
set nu 
set relativenumber 
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab 
set updatetime=50
lua vim.opt.scrolloff=6
lua vim.opt.signcolumn="no"
set wrap linebreak nolist

set noswapfile nobackup
lua vim.opt.undodir=os.getenv("HOME") .. "/.vim/undodir"
lua vim.opt.isfname:append("@-@")
set undofile 

set nohlsearch incsearch
set smartcase smarttab smartindent breakindent
set showcmd showmode showmatch

" this sets a default bib file
" i just list them here incase
"let g:bibtexcite_bibfile = "~/Sync/latex/bibs/clitics.bib"
let g:bibtexcite_bibfile = "~/Sync/latex/bibs/philosophy.bib"
" let g:bibtexcite_bibfile =  "~/Sync/latex/bibs/gender.bib"

set history=100
set mouse=a
set t_Co=256
let g:nv_search_paths = ['~/Sync/zet']

" create vimtex.lua
lua vim.g['tex_flavor'] = 'latex'
lua vim.g['vimtex_compiler_latexmk_engines'] = {['_'] = '-xelatex'}
lua vim.g['vimtex_view_method'] = 'zathura'
lua vim.g['vimtex_view_general_viewer'] = 'zathura'
lua vim.g['vimtex_view_genral_options'] = '--unique file:@pdf#src@line@tex'
lua vim.g['vimtex_compiler_method'] = 'latexmk'
lua vim.g['vimtex_view_automatic'] = 1
