" Basic settings
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8 " File encoding
set showmode

" Use English as default
language en_US.utf-8
set spelllang=en
" set spell " Enable spell checking

inoremap <F6> <C-O>:set spell!<CR>
nnoremap <F6> :set spell!<CR>

" Highlight only misspelled words
highlight SpellBad cterm=underline
highlight SpellCap cterm=underline
highlight SpellRare cterm=underline
highlight SpellLocal cterm=underline

" Syntax and numbering
syntax on " Syntax highlight
set number " Line numbers
set number relativenumber " Set relative line numbers

" Color scheme - Adjusted to a built-in scheme that might feel closer to GitHub/Sublime
colorscheme gnl

" Fonts gor the GUI
set guifont=Monospace\ 10


" Cursor highlights
set cursorline " Highlight cursor line
"set cursorcolumn " Highlight cursor column
hi clear CursorLine " Unset cursorline formatting
hi link CursorLine CursorColumn " Set formatting same as cursorcolumn

" STATUS LINE ------------------------------------------------------------ {{{
" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side:
"    %F: current file full path
"    %M: + if file is modified and unchanged
"    %Y: type of the file
"    %R: displays flag if read-only
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side. Self explanatory code.
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}


" PLUGINS ---------------------------------------------------------------- {{{
" Plugin code goes here.


" }}}


" Tab behaviour
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " expand tab to spaces so that tabs are spaces

" History
set history=200

" Increment search
set incsearch
set wildmenu

" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>,「:」

" Ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase

" Use mouse to select and resize windows, etc.
if has('mouse')
    set mouse=nic  " Enable mouse in several mode
    set mousemodel=popup  " Set the behaviour of mouse
endif

" Fileformats to use for new files
set fileformats=unix,dos


" Minimum lines to keep above and below cursor when scrolling
set scrolloff=3


