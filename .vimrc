call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } 
Plug 'ycm-core/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'itchyny/lightline.vim'

"colorscheems
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'

call plug#end()

"colorscheme gruvbox
colorscheme iceberg 
set background=dark
syntax on

let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set number
set hlsearch
set incsearch


"mappings
map <C-b> :NERDTreeToggle<CR>

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
