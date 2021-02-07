set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle stuff yo
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'ctrlp.vim.git'
Plugin 'rking/ag.vim.git'
Plugin 'tpope/vim-surround'
Plugin 'itchyny/lightline.vim'
Plugin '907th/vim-auto-save'
Plugin 'ap/vim-buftabline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'maralla/completor.vim'
Plugin 'zivyangll/git-blame.vim'
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme gruvbox
set bg=dark

syntax on
let mapleader = " "
set shiftwidth=4 " >> is four spaces
set tabstop=4 " number of visual spaces per TAB
set expandtab " tabs are spaces
set softtabstop=4 " number of spaces in tab when editing
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set showmatch " highlight matching [{()}]
set incsearch " search as characters are entered
set hlsearch " highlight matches" move vertically by visual line
set gdefault " subsitute all instances by default
set relativenumber " show the relative line number
set ic " ignore case when searching
set laststatus=2 " make lightline show up
set noshowmode " turn off default mode prompt
set timeoutlen=1000 ttimeoutlen=0 " reduce time to wait for next char
set undofile                " Save undos after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Backup files
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" jk is escape
imap jk <esc>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Arrow keys do nothing
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" nerdtree bindings
nnoremap <leader>n :NERDTreeToggle<CR>

" buffer bindings
nnoremap <C-j> :bprev<CR>
nnoremap <C-k> :bnext<CR>
nnoremap <C-b> :buffers<CR>
map <C-q> :bp<bar>sp<bar>bn<bar>bd<CR>

" shift-j and shift-k moves highlighted section up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv

" Search for visual selection with '//'
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Git blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

map<leader>h :wincmd h<CR>
map<leader>j :wincmd j<CR>
map<leader>k :wincmd k<CR>
map<leader>l :wincmd l<CR>

" Sw to save as sudo (so can use vimrc to edit root files)
command! -nargs=0 Sw w !sudo tee % > /dev/null

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
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

" ctrl-p stuff
let g:ctrlp_working_path_mode = ''
set runtimepath^=~/.vim/bundle/ctrlp.vim
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" Autosave settings
let g:auto_save = 1
let g:auto_save_silent = 1

" Make trailing whitespace red
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

if filereadable(".vim.custom")
    so .vim.custom
endif
