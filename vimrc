" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2001 Jul 18
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"             for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"           for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Function to activate a virtualenv in the embedded interpreter for
" omnicomplete and other things like that.
function LoadVirtualEnv(path)
    let activate_this = a:path . '/bin/activate_this.py'
    if getftype(a:path) == "dir" && filereadable(activate_this)
        python << EOF
import vim
activate_this = vim.eval('l:activate_this')
execfile(activate_this, dict(__file__=activate_this))
EOF
    endif
endfunction

let defaultvirtualenv = $HOME . "/.virtualenvs/shopbot"

" Only attempt to load this virtualenv if the defaultvirtualenv
" actually exists, and we aren't running with a virtualenv active.
if has("python")
    if empty($VIRTUAL_ENV) && getftype(defaultvirtualenv) == "dir"
        call LoadVirtualEnv(defaultvirtualenv)
    endif
endif

filetype off
" pathogen must be loaded without filetype
call pathogen#infect()
filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent          " always set autoindenting on
set nobackup            " don't keep a backup file
set history=50          " keep 50 lines of command line history
set scrolloff=5         " give me some context
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set ignorecase
set smartcase

set tabstop=4
set shiftwidth=4
set expandtab
set shortmess=atI
set diffopt=filler,vertical

" Bash-like filename completion
set wildmenu
set wildmode=list:longest
set wildignore=*.pyc,*.bak

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

set fileformats=unix,dos,mac

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

if &term =~ "vt100"
	if has("terminfo")
		set t_Co=8
		set t_Sf=[3%p1%dm
		set t_Sb=[4%p1%dm
	else
		set t_Co=8
		set t_Sf=[3%dm
		set t_Sb=[4%dm
	endif
endif

"quit your yapping
set vb t_vb=

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
endif

if has("gui_running")
    set lines=100
    set columns=81
	set guifont=Inconsolata-dz:h11 guioptions-=T	guiheadroom=4
endif
colorscheme vj

set hlsearch

" plugin options
let g:pydoc_highlight=0
map <leader>v <Plug>TaskList
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:surround_no_mappings = 1
"au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

if has("autocmd")
  "" *.md should be markdown
  autocmd BufRead,BufNewFile *.md set filetype=mkd

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=80
  autocmd FileType html,xhtml,htmldjango,javascript setlocal sw=2 ts=2 tw=100
  autocmd FileType html,xhtml,htmldjango,javascript setlocal isk=@,48-57,_,192-255,-,$
  autocmd BufRead,BufNewFile *.bayou setfiletype bayou
  autocmd BufRead,BufNewFile *.scala setfiletype scala

  "autocmd FileType c,cpp,php,perl setlocal foldmethod=indent foldminlines=5 foldnestmax=5

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
endif " has("autocmd")

augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END

"arrow keys for dvorak
noremap d h
noremap h j
noremap t k
noremap n l
noremap j t
noremap k d
noremap l n

" fix the shortcuts in the surround plugin for dvorak
nmap ks  <Plug>Dsurround
nmap cs  <Plug>Csurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap S   <Plug>VSurround
xmap gS  <Plug>VgSurround
if maparg('s', 'x') ==# ''
  xnoremap <silent> s :<C-U>echoerr 'surround.vim: Visual mode s has been removed in favor of S'<CR>
endif
if !hasmapto("<Plug>Isurround","i") && "" == mapcheck("<C-S>","i")
  imap    <C-S> <Plug>Isurround
endif
imap      <C-G>s <Plug>Isurround
imap      <C-G>S <Plug>ISurround

"swap forward and backward
noremap <C-F> <C-B>
noremap <C-B> <C-F>

noremap <D-d> Oimport ipdb; ipdb.set_trace()<Esc>:w<Return>

"jump between windows
noremap <C-H> <C-W>j<C-W>_
noremap <C-T> <C-W>k<C-W>_
noremap <C-D> <C-W>h
noremap <C-N> <C-W>l
set winminheight=0

set wrap

" The next 50 lines or so were stolen from nod.
"
set nomodeline

augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

let python_highlight_all = 1

" trailing whitespace kills puppies
"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()

" cscope goodness
set tags=~/.vim/tags/snoball.tags,~/.vim/tags/tornado.tags,~/.vim/tags/mogo.tags
set cscopeverbose

