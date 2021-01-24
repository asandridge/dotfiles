set nocompatible              " be iMproved, required
filetype off                  " required

" You better be using iTerm2
colorscheme solarized8_dark

" Vundle stuff yo
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Bundle 'takac/vim-hardtime'
Plugin 'tpope/vim-surround'
Plugin 'itchyny/lightline.vim'
Plugin '907th/vim-auto-save'
Plugin 'ap/vim-buftabline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
let mapleader = ","
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set shiftwidth=4 " >> is four spaces
set expandtab " tabs are spaces
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

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
"nnoremap $ <nop>
"nnoremap ^ <nop>

" Arrow keys do nothing
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

" jk is escape
imap jk <esc>
nnoremap <leader>h :HardTimeToggle<CR>

" control-s is save
" nmap <C-s> :w<CR>

" automatically generate closing characters
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>

" nerdtree bindings
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeFocus<CR>

" buffer bindings
nnoremap <C-j> :bprev<CR>
nnoremap <C-k> :bnext<CR>
nnoremap <C-b> :buffers<CR>
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Backup files
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

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
endif

" Default to hard mode
" let g:hardtime_default_on = 1

" Autosave settings
let g:auto_save = 1
let g:auto_save_silent = 1

" Make trailing whitespace red
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

if filereadable(".vim.custom")
    so .vim.custom
endif
