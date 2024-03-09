let g:vimwiki_ext2syntax = {}
let g:vimwiki_global_ext = 0
let g:vimwiki_folding='expr'
let g:vimwiki_use_mouse = 1
let g:vimwiki_list = [{'path': '~/Sync/zet'}, {'path': '~/Sync/todo/', 'bullet_types': ['-', '•', '→']}]

let g:vimwiki_listsyms = '✗○◐●✓'
" stolen from
" https://github.com/ChristianChiarulli/nvcode-color-schemes.vim/pull/44/commits/f5206e1041f496de800f87e467a5ffd113b0d0d1
hi VimwikiHeader1 guifg=#ffb86c ctermfg=215 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi VimwikiHeader2 guifg=#50fa7b ctermfg=84 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi VimwikiHeader3 guifg=#ff79c6 ctermfg=212 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi VimwikiHeader4 guifg=#8be9fd ctermfg=117 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi VimwikiHeader5 guifg=#f1fa8c ctermfg=228 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi VimwikiHeader6 guifg=#bd93f9 ctermfg=141 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi VimwikiLink guifg=#8be9fd ctermfg=117 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VimwikiHeaderChar guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VimwikiHR guifg=#f1fa8c ctermfg=228 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VimwikiList guifg=#ffb86c ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VimwikiTag guifg=#ffb86c ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VimwikiMarkers guifg=#6272a4 ctermfg=61 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
