set nocompatible
syntax on

let mapleader=' '

"Syntax highlighting lagging vim due to long lines
set synmaxcol=160
" Set 120 Char line length
set colorcolumn=80

" Line numbers on
set number
set numberwidth=3

" set showtabline=1
" disable all beeps
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" disable backspace
" inoremap <BS> <Nop>
" disable delete
inoremap <Del> <Nop>


"so it pastes nicely
" set paste
set smartindent

" Set tabs to 4 spaces, with smart indent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" 256 color 
set t_Co=256

set title
set noswapfile

set laststatus=2

" let g:aldmeris_termcolors = "tango"

" so i can yank to clipboard only for vim 7.3.74+
" set clipboard=unnamedplus 

" need this so when i write underscore seperated variables names `w` moves
" between each underscore seperator rather than the complete variable name
set iskeyword-=_

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

set hidden
nmap <leader>T :enew<cr>
"" nmap <leader>l :bnext<CR>
"" nmap <leader>h :bprevious<CR>
"""nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>q :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

nmap <leader>a :Ack 
nmap <leader>p :set paste <CR>i

"" move between tabs
noremap <leader>l gt
noremap <leader>h gT

syntax enable
filetype plugin indent on 
filetype on

" DISABLE FOLDING YO
set nofoldenable

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"""" I USE THESE
Plugin 'scrooloose/syntastic'
Plugin 'Yggdroot/indentLine'
Plugin 'bling/vim-airline'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'sudar/vim-arduino-syntax'
Plugin 'elzr/vim-json'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'airblade/vim-gitgutter'

"""" MAYBE I USE THESE
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
" (dont think so)
" Plugin 'flazz/vim-colorschemes'
" Plugin 'godlygeek/tabular'  http://vimcasts.org/episodes/aligning-text-with-tabular-vim/

"""" I SHOULD USE
" Plugin 'davidhalter/jedi-vim'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'Valloric/YouCompleteMe'

"""" EH
" Plugin 'scrooloose/nerdtree'
" Plugin 'mrtazz/simplenote.vim'
" Plugin 'vimwiki/vimwiki'
" Plugin 'Shougo/deoplete.nvim'
" Plugin 'zchee/deoplete-go'

"""" NOT CURRENTLY REQUIRED
" Plugin 'vim-scripts/groovy.vim'
" Plugin 'avakhov/vim-yaml'
" Plugin 'fatih/vim-go'
" Plugin 'chase/vim-ansible-yaml'
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'b4b4r07/vim-hcl'
" Plugin 'hashivim/vim-terraform'

"""" DONT USE
" Plugin 'mileszs/ack.vim'
" Plugin 'amoffat/snake'
" Plugin 'tpope/vim-commentary'
" Plugin 'markcornick/vim-bats'
call vundle#end()

"""NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" autocmd StdinReadPre * let s:std_in=1
"" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:indentLine_color_term = 245
let g:indentLine_char = '¦'
let g:indentLine_enabled = 1

" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set statusline=%f\ -\ FileType:\ %y
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" set background=dark

highlight Comment    ctermfg=7 ctermbg=160 cterm=bold
""highlight Identifier ctermfg=99AA00

" set +x on files that start with #!
au BufWritePost * if getline(1) =~ "^#!" | silent !chmod +x <afile>

" json being set to javascript, not loading vim-json
let g:vim_json_syntax_conceal = 0

" force coffeescript ft

" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

" disable ctrl+a int increment as its fuckin annoying when in tmux 
" map <C-a> <Nop>

" Use deoplete
" let g:deoplete#enable_at_startup = 1

" ctrl n, open NERDTree
" map <C-n> :NERDTreeToggle<CR>

" let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_python_checkers=['python -m flake8']
let g:syntastic_ruby_checkers=['foodcritic']
let g:syntastic_sh_checkers=['shellcheck']
let g:syntastic_javascript_checkers=['json_verify'] 
let g:syntastic_cpp_checkers=[''] 
let g:syntastic_debug = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_w = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_ignore_files = ['.*\.bats$']

" let g:vimwiki_list = [{'path': '~/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]

" https://github.com/vim-syntastic/syntastic/issues/1391
noremap :w<CR> :w<CR>:SyntasticCheck<CR>

" let g:ycm_autoclose_preview_window_after_completion=1
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

au FileType arduino setl sw=2 sts=2 et
au FileType cpp setl sw=2 sts=2 et
au FileType c setl sw=4 sts=4 et
au FileType yaml setl sw=2 sts=2 et
au FileType yml setl sw=2 sts=2 et
au FileType tf setl sw=2 sts=2 et
au FileType sh setl sw=2 sts=2 et
au FileType tf setl sw=2 sts=2 et
au FileType ruby setl sw=2 sts=2 et
au FileType css setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et
au FileType htmldjango setl sw=2 sts=2 et
au FileType json setl sw=2 sts=2 et
au FileType javascript setl sw=2 sts=2 et

au BufEnter,BufRead,BufNewFile *.ino,*.pde set filetype=arduino
au BufEnter,BufRead,BufNewFile *.bats set filetype=sh
au BufEnter,BufRead,BufNewFile *.tf set filetype=hcl
au BufEnter,BufRead,BufNewFile Apronfile set filetype=yaml
au BufEnter,BufRead,BufNewFile Vagrantfile set filetype=ruby
au BufEnter,BufRead,BufNewFile *.go set filetype=go
au BufEnter,BufRead,BufNewFile *.coffee set filetype=coffee
au BufEnter,BufRead,BufNewFile *.json set filetype=json
" au BufEnter,BufRead,BufNewFile *.md set filetype=markdown
" autocmd BufEnter,BufRead,BufNewFile *.md set filetype=markdown

" augroup filetypedetect
"   au! BufRead,BufNewFile */vimwiki/*        set filetype=markdown
" augroup END

colorscheme solarized
" not sure why this has to be dark to get light :(
" set background=dark
" let g:airline_solarized_bg='dark'
