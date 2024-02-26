
" Vim color scheme
" Name: gnl_capuchino.vim
" Inspired by the soft, warm tones of a capuchino

set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "gnl_capuchino"

" General colors - Muted and Warm
highlight Normal ctermfg=252 ctermbg=235 guifg=#D3C6AA guibg=#2B2B2B
highlight Comment ctermfg=242 ctermbg=NONE guifg=#857B6F guibg=NONE
highlight Constant ctermfg=81 ctermbg=NONE guifg=#D3C6AA guibg=NONE
highlight Identifier ctermfg=214 ctermbg=NONE guifg=#D3C6AA guibg=NONE
highlight Statement ctermfg=76 ctermbg=NONE guifg=#DDBC7F guibg=NONE
highlight PreProc ctermfg=208 ctermbg=NONE guifg=#D3C6AA guibg=NONE
highlight Type ctermfg=140 ctermbg=NONE guifg=#D3C6AA guibg=NONE
highlight Special ctermfg=140 ctermbg=NONE guifg=#D3C6AA guibg=NONE

" Line numbers, CursorLine, and CursorLineNr (consistency in color)
highlight LineNr ctermfg=222 ctermbg=NONE guifg=#FFD787 guibg=NONE
highlight CursorLine cterm=NONE ctermbg=237 guibg=#3A3A3A
highlight CursorLineNr ctermfg=222 ctermbg=237 guifg=#FFD787 guibg=#3A3A3A

" StatusLine - Swapped colors for a capuchino inspired look
highlight StatusLine ctermfg=235 ctermbg=252 guifg=#2B2B2B guibg=#D3C6AA
highlight StatusLineNC ctermfg=235 ctermbg=252 guifg=#2B2B2B guibg=#D3C6AA
highlight VertSplit ctermfg=240 ctermbg=NONE guifg=#444444 guibg=NONE

" Set the ~ symbols in the sidebar to a darker version of the line numbering color
highlight EndOfBuffer ctermfg=58 ctermbg=NONE guifg=#997700 guibg=NONE

" More specific syntax highlighting can be added here...
