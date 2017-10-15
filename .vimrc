" Eric Appelbaum
" vim-plug {{{
call plug#begin()
Plug 'majutsushi/tagbar'
Plug 'kien/ctrlp.vim'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'chriskempson/base16-vim'
Plug 'terryma/vim-expand-region'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex'  }
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
call plug#end()
" }}}
" Color & Highlighting {{{
syntax on
set t_Co=256

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

hi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
hi Folded term=bold cterm=NONE ctermfg=Cyan ctermbg=NONE gui=NONE guifg=Cyan guibg=NONE
hi MatchParen cterm=bold ctermbg=NONE ctermfg=Black
" }}}
" Spaces & Tabs {{{
set expandtab       " Use spaces instead of tabs
set smarttab        " Be smart when using tabs
set sw=2 ts=2 et    " 1 tab == 2 spaces
set lbr tw=500      " Linebreak on 500 characters
set ai              "Auto indent
set si              "Smart indent
set wrap            "Wrap lines
" }}}
" UI {{{
filetype plugin indent on
set number          " Show line number
set showcmd         " Show last cmd"
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to.
set showmatch       " highlight matching [{()}]
set so=5            " Show 5 lines

" Show when going over 80 columns
if exists('+colorcolumn')
  set cc=81
else
  hi OverLength ctermfg=red
  match OverLength /\%81v.\+/
endif
" }}}
" Searching {{{
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
" }}}
" Folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set modelines=1
" }}}
" Leader {{{
" set leader
let mapleader = "\<Space>"

let g:mapleader = "\<Space>"

" Fast saving
nmap <Leader>w :w!<cr>
command W w !sudo tee % > /dev/null

" visual mode
nmap <Leader><Leader> V
" }}}
" Movement {{{
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" save session
nnoremap <leader>s :mksession<CR>
" }}}
" Line Numbering {{{
set nu 
set numberwidth=3
" }}}
" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Buffers {{{
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" }}}
" Plugins {{{
" vim-airline {{{
set ttimeoutlen=50
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_atelierdune'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'"
" }}}
" vim-expand-region {{{
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
" }}}
" syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}
" tagbar {{{
nmap <F8> :TagbarToggle<CR>
" }}}
" latex-live-preview {{{
let g:livepreview_previewer = 'evince'
" }}}
" ag {{{
" open ag.vim
nnoremap <leader>a :Ag
" }}}
" CtrlP {{{
" opening a file
nnoremap <Leader>o :CtrlP<CR>
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" }}}
" }}}
" Autocmd {{{
augroup filetype
  autocmd BufNewFile,BufRead *.make set filetype=make
augroup END

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
autocmd FileType asm set noexpandtab shiftwidth=8 softtabstop=0 syntax=nasm
" }}}
" Misc. {{{
set updatetime=1000
" }}}
" vim:foldmethod=marker:foldlevel=0
