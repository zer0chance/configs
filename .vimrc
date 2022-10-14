set nocompatible
set noswapfile
set nofixendofline

syntax enable
syntax on
filetype plugin on

" au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

call plug#begin('~/.vim/plugged')

" IDE-like stuff
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } 
Plug 'majutsushi/tagbar'
" Plug 'ycm-core/YouCompleteMe'

" Version Control
Plug 'airblade/vim-gitgutter'
Plug 'zivyangll/git-blame.vim'
Plug 'bfabry/gblame' " No idea how to use it
" Plug 'tpope/vim-fugitive' " Very nice git pluggin but extra slow

" File Navigation
Plug 'kien/ctrlp.vim'
Plug 'derekwyatt/vim-fswitch'

" Navigation
Plug 'easymotion/vim-easymotion'
Plug 'chaoren/vim-wordmotion'

" Editting
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Appearence
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-smooth-scroll'
Plug 'shirk/vim-gas'
Plug 'b1narykid/llvm.vim'
Plug 'machakann/vim-highlightedyank'

" Nice plugins but very slow
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-easytags'

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

" Change cursor shape between insert and normal mode in iTerm2.app
" if $TERM_PROGRAM =~ "iTerm"
"   " let g:airline_powerline_fonts=1
"   if exists('$TMUX')
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"     let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
"     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
"   else
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
"     let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
"   endif
" endif

" CtrlP
let g:ctrlp_map = '<Leader><c-p>'
let g:ctrlp_cmd = 'CtrlP /home/eignatenko/zing/openjdk/dev/hostpot/src/'

let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set number
set relativenumber
set backspace=indent,eol,start

set hlsearch
set incsearch

"mappings
nnoremap <F5> :set hlsearch!<CR>
nmap <F6> :NERDTreeToggle<CR>
nmap <F7> :TagbarToggle<CR>
nmap <F8> :set invrelativenumber<CR>

nnoremap <Leader>g :<C-u>call gitblame#echo()<CR>

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

" Python tab autoconfiguration according to PEP 8
let python_highlight_all = 1
function! s:set_python_settings()
  set tabstop=8
  set softtabstop=4
  set shiftwidth=4
endfunction
function! s:unset_python_settings()
  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
endfunction
autocmd BufNewFile,BufEnter *.{py} call s:set_python_settings()
autocmd BufLeave *.{py} call s:unset_python_settings()

" Smoothscroll plugin configuration
" You can change numbers to make scroll more or less smoother
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

" FSwitch
let g:fsnonewfiles = ''
nnoremap <silent> <leader>of :FSHere<CR>
nnoremap <silent> <leader>ot :FSTab<CR>
nnoremap <silent> <leader>ol :FSRight<CR>
nnoremap <silent> <leader>oL :FSSplitRight<CR>
nnoremap <silent> <leader>oh :FSLeft<CR>
nnoremap <silent> <leader>oH :FSSplitLeft<CR>
nnoremap <silent> <leader>ok :FSAbove<CR>
nnoremap <silent> <leader>oK :FSSplitAbove<CR>
nnoremap <silent> <leader>oj :FSBelow<CR>
nnoremap <silent> <leader>oJ :FSSplitBelow<CR>

" Commentary
autocmd FileType ll,llvm setlocal commentstring=;\ %s
autocmd FileType c,h,cpp,hpp,cs,java setlocal commentstring=//\ %s

" YouCompleteMe
" " let g:loaded_youcompleteme = 1
" let g:ycm_global_ycm_extra_conf = '~/.ycm_global_conf.py'
" " let g:ycm_extra_conf_globlist = [
" "   \'~/contest/codeball/.ycm_extra_conf.py',
" "   \'~/ya/[bc]r/[01234]/.ycm_extra_conf.py',
" "   \'~/dotfiles/vim/vim.symlink/bundle/chromium-tools-vim/chromium.ycm_extra_conf.py']
" let g:ycm_error_symbol = '»'
" let g:ycm_warning_symbol = '»'
" autocmd FileType c,cpp,objc,objcpp nnoremap gd :YcmCompleter GoTo<CR>
" nnoremap <leader>yd :YcmCompleter GoTo<CR>
" nnoremap <leader>yD :YcmCompleter GoToDeclaration<CR>
" nnoremap <leader>ye :YcmCompleter GoToImprecise<CR>
" nnoremap <leader>yf :YcmCompleter FixIt<CR>
" nnoremap <leader>yh :YcmCompleter GetDoc<CR>
" nnoremap <leader>yp :YcmCompleter GetParent<CR>
" nnoremap <leader>yt :YcmCompleter GetType<CR>
" nnoremap <leader>yu :YcmCompleter GoToReferences<CR>
" nnoremap <leader>yy :YcmShowDetailedDiagnostic<CR>
" nnoremap <leader>yz :YcmDiags<CR>

