" syntax on
"Syntax highlighting lagging vim due to long lines
set synmaxcol=80
" Line numbers on
set number
set numberwidth=3

" disable all beeps
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" disable backspace
inoremap <BS> <Nop>
" disable delete
inoremap <Del> <Nop>

" Set 120 Char line length
set colorcolumn=80

"so it pastes nicely
set paste
set smartindent

" Set tabs to 4 spaces, with smart indent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" set sw=4 ts=4 sts=4
" autocmd FileType rb :setlocal sw=2 ts=2 sts=2
" so can paste in vim fine
" set paste 

" 256 color 
set t_Co=256

set title
set noswapfile

set laststatus=2

function! ForceReload()
    silent !curl http://localhost:9000/reload
    redraw!
endfunction

" Save with ctrl-S
" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :w<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <Esc>:w<CR>

set nocompatible
" execute pathogen#infect()
" Color Scheme Setup -> Solarized Details
" colorscheme solarized

" set background=light
" colorscheme aldmeris

let g:aldmeris_termcolors = "tango"
" let g:indentLine_color_term=239

"so i can yank to clipboard only for vim 7.3.74+
set clipboard=unnamedplus 

nnoremap ; :

inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
command -bang Q quit<bang>

command! W write

let mapleader=' '
set hidden
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
"""nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

nmap <leader>a :Ack 
nmap <leader>p :set paste <CR>i



syntax enable
filetype plugin indent on 
filetype on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdtree'
" Plugin 'godlygeek/tabular'  http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
" Plugin 'amoffat/snake'
" Plugin 'avakhov/vim-yaml'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'fatih/vim-go'
Plugin 'mileszs/ack.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'markcornick/vim-bats'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'chase/vim-ansible-yaml'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'elzr/vim-json'
Plugin 'kchmck/vim-coffee-script'
Plugin 'b4b4r07/vim-hcl'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'mrtazz/simplenote.vim'
Plugin 'sudar/vim-arduino-syntax'
" Plugin 'hashivim/vim-terraform'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vimwiki/vimwiki'
Plugin 'Shougo/deoplete.nvim'
Plugin 'zchee/deoplete-go'
call vundle#end()

"""NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd StdinReadPre * let s:std_in=1
"" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

let g:vim_markdown_folding_disabled=1

let g:indentLine_color_term = 245
let g:indentLine_char = '¦'
let g:indentLine_enabled = 1

let g:syntastic_python_checkers=['flake8 --config=${HOME}/.flake8']
let g:syntastic_ruby_checkers=['foodcritic']
let g:syntastic_sh_checkers=['shellcheck']
let g:syntastic_javascript_checkers=['json_verify'] 
let g:syntastic_check_on_w = 1
let g:syntastic_debug = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" set statusline=%f\ -\ FileType:\ %y
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

set background=dark
highlight Comment    ctermfg=7 ctermbg=160 cterm=bold
""highlight Identifier ctermfg=99AA00

" set +x on files that start with #!
au BufWritePost * if getline(1) =~ "^#!" | silent !chmod +x <afile>

" json being set to javascript, not loading vim-json
au BufNewFile,BufRead *.json set filetype=json
let g:vim_json_syntax_conceal = 0

" force coffeescript ft
au BufNewFile,BufRead *.coffee set filetype=coffee

let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='google-chrome'
let vim_markdown_preview_use_xdg_open=1

let g:ctrl_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

au FileType yaml setl sw=2 sts=2 et
au FileType yml setl sw=2 sts=2 et
au FileType tf setl sw=2 sts=2 et
au FileType sh setl sw=2 sts=2 et
au FileType tf setl sw=2 sts=2 et
au FileType ruby setl sw=2 sts=2 et
au FileType css setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et
au FileType json setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et

" source ~/.simplenoterc 
 
" command Todo Simplenote -o todo

" disable ctrl+a int increment as its fuckin annoying when in tmux 
" map <C-a> <Nop>

" force arduino detection
au BufRead,BufNewFile *.ino,*.pde set filetype=arduino
au FileType arduino setl sw=2 sts=2 et

" force hcl detection
au BufRead,BufNewFile *.tf set filetype=hcl
au BufRead,BufNewFile Apronfile set filetype=yaml
au BufRead,BufNewFile Vagrantfile set filetype=ruby

au BufRead,BufNewFile *.go set filetype=go

" Use deoplete
let g:deoplete#enable_at_startup = 1

" ctrl n, open NERDTree
map <C-n> :NERDTreeToggle<CR>
