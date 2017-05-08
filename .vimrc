" Shinya-Fukumoto

" encoding
set enc=utf-8           " write UTF-8 to buffer 
set fenc=utf-8          " write UTF-8 to file
set termencoding=utf-8  " write UTF-8 to terminal
scriptencoding utf-8    " use utf-8 encoding in vimrc

" indantation
set autoindent          " keep indentation from previous line
set smartindent         " use intelligent indentation for C-like languages
set expandtab
set shiftwidth=2
set softtabstop=2

" screen
set number
set ruler
set cursorline
set textwidth=80
set t_Co=256            " enable 256 colors in vim on terminal
set laststatus=2

" search
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" backup
set directory=.,~/.cache/vim/
set nobackup
" misc
set shellslash          " use forward slashes when expanding file names in Windows.

function! s:cpp()
  setlocal path+=.,/usr/include,/usr/local/include,/usr/lib/c++/v1
  setlocal matchpairs+=<:>
endfunction

augroup vimrc-cpp
    autocmd!
    autocmd FileType cpp call s:cpp()
augroup END

" plugin
" neobundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    NeoBundleLazy 'vim-jp/cpp-vim', {
            \ 'autoload' : {'filetypes' : 'cpp'}
            \ } 
    NeoBundle 'Shougo/neocomplete.vim'
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/unite-outline'
    NeoBundle 'ujihisa/unite-colorscheme'
  call neobundle#end()
endif

filetype plugin indent on
NeoBundleCheck

" mapping

noremap j gj
noremap k gk

" go to next empty line by <C-j> and <C-k>
nnoremap <silent><C-j> :<C-u>keepjumps normal! }<CR>
nnoremap <silent><C-k> :<C-u>keepjumps normal! {<CR>
vnoremap <C-j> }
vnoremap <C-k> {
vnoremap  <Up>     <nop>
vnoremap  <Down>   <nop>
vnoremap  <Left>   <nop>
vnoremap  <Right>  <nop>

" In normal mode, Enter add a empty line.
function! s:cmd_cr_n(count) abort
    for _ in range(a:count)
        call append('.', '')
    endfor
    execute 'normal!' a:count.'j'
endfunction
nnoremap <silent><CR> :<C-u>call <SID>cmd_cr_n(v:count1)<CR>

nnoremap <silent><C-e> :NERDTreeToggle<CR>

syntax on

