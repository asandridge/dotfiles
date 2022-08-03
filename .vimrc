set nocompatible
filetype off
syntax on

" ===============================================
" Basic Config
" ===============================================
"
" Plugins (Vundle)
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'ctrlpvim/ctrlp.vim.git'
Plugin 'rking/ag.vim.git'
Plugin 'tpope/vim-surround'
Plugin 'itchyny/lightline.vim'
Plugin '907th/vim-auto-save'
Plugin 'ap/vim-buftabline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'maralla/completor.vim'
Plugin 'zivyangll/git-blame.vim'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

" Pretty hard to beat gruvbox (dark)
colorscheme gruvbox
set bg=dark

 " Space is the best leader!
let mapleader = " "

" ===============================================
" Global settings
" ===============================================

" Tabs
set shiftwidth=4 " >> is four spaces
set tabstop=4 " Number of visual spaces per TAB
set expandtab " Tabs are spaces
set softtabstop=4 " Number of spaces in tab when editing

" Lines
set cursorline " Highlight current line
set number " Show line numbers
set relativenumber " Show the relative line number

" Command
set showcmd " Show command in bottom bar
set wildmenu " Visual autocomplete for command menu

" Search
set incsearch " Search as characters are entered
set hlsearch " Highlight matches" move vertically by visual line
set ic " Ignore case when searching

" Undo files
set undofile                " Save undos after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set autoread " update any unchanged files automatically

" Backup files
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Misc
set gdefault " Substitute all instances by default
set showmatch " Highlight matching [{()}]
set timeoutlen=1000 ttimeoutlen=0 " Reduce time to wait for next char
set scrolloff=10 " Keep 10 lines between cursor and end of window
set backspace=indent,eol,start  " more powerful backspacing

" ===============================================
" Plugin specific settings
" ===============================================

" Lightline
set laststatus=2 " Make lightline show up
set noshowmode " Turn off default mode prompt (since we have lightline)

" Autosave settings
let g:auto_save = 1
let g:auto_save_silent = 1

" Add space after comment delimiter by default
let g:NERDSpaceDelims = 1

" ===============================================
" Remappings
" ===============================================

" Remap home index
" noremap n j
" noremap j n

" jk is escape
imap jk <esc>
nmap <BS> <leader>

" Why do we need to hold shift for this?
nmap zz ZZ
nmap zq ZQ
nmap <leader>e ZZ

" Move to beginning/end of line in normal and visual
noremap B ^
noremap E $

" Open up nerdtree
nnoremap <leader>n :NERDTreeToggle<CR>

" Buffer bindings
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-b> :buffers<CR>
nnoremap <leader>w :bp<bar>sp<bar>bn<bar>bd!<CR>

" Search for visual selection with '//'
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Enter will unhighlight search results
nnoremap <CR> :noh<CR>

" Git blame
nnoremap <leader>b :<C-u>call gitblame#echo()<CR>

" Search working directory
nnoremap <leader>p :Ag<SPACE>

" Jump between windows easily
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
" nnoremap <leader>n :wincmd n<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Semicolon is easier to type even though colon is more useful
nnoremap ; :

" Easily source vimrc in working session
nnoremap<leader>v :source ~/.vimrc<CR>

" Sw to save as sudo (so can use vimrc to edit root files)
command! -nargs=0 Sw w !sudo tee % > /dev/null

" Faster movement
nnoremap <C-j> 10j
vnoremap <C-j> 10j
nnoremap <C-k> 10k
vnoremap <C-k> 10k

" Sync syntax highlighting
nnoremap <leader>s :syntax sync fromstart<CR>

" Output file path for current buffer
nnoremap <leader>f :echo expand("%")<CR>

" Fugitive shortcuts
nnoremap <leader>gs :G<CR>
nnoremap <leader>gd :Git diff<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gj :diffget //3<CR>

" Make yanking to the clipboard easier
vnoremap <leader>y "*y
nnoremap <leader>y "*yiw

" ===============================================
" FUNCTIONS AND OTHER CONFIGURATIONS
" ===============================================

" Highlight trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Strips trailing whitespace when writing to buffer
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" CTRL-P
let g:ctrlp_working_path_mode = ''
set runtimepath^=~/.vim/bundle/ctrlp.vim
" Use ag if possible
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" CTRL-U and CTRL-D scroll instead of jump
function SmoothScroll(up)
    if a:up
        let scrollaction=""
    else
        let scrollaction=""
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 3m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction

nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>
