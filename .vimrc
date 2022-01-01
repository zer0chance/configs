set nocompatible
syntax enable
syntax on
filetype plugin on

" au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } 
"Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
"Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-commentary'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'

"colorscheems
Plug 'morhetz/gruvbox'

call plug#end()

colorscheme gruvbox
set background=dark

"let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set updatetime=100

"set autochdir
set tags=./tags,tags;
let g:tagbar_ctags_bin='/home/eignatenko/bin/ctags'

function! CreateTags()
    let curNodePath = g:NERDTreeFileNode.GetSelected().path.str()
    exec ':!ctags -R -f ' . curNodePath . '/tags ' . curNodePath
endfunction
nmap <silent> <F4> :call CreateTags()<CR>

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set number
set backspace=indent,eol,start

set hlsearch
set incsearch

"mappings
nnoremap <F5> :set hlsearch!<CR>
nmap <F6> :NERDTreeToggle<CR>
nmap <F7> :TagbarToggle<CR>

map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

