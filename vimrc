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

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent          " always set autoindenting on
set nobackup            " don't keep a backup file
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

set tabstop=4
set shiftwidth=4
set expandtab

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
	set guifont=Monospace\ 10 guioptions-=T	guiheadroom=4
endif
colorscheme darkblue

set hlsearch

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
 
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=80
  autocmd FileType html,xhtml,htmldjango,javascript setlocal sw=2 ts=2 tw=80
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

"swap forward and backward
noremap <C-F> <C-B>
noremap <C-B> <C-F>

noremap db Oimport ipdb; ipdb.set_trace()<Esc>:w<Return>

"jump between windows
noremap <C-H> <C-W>j<C-W>_
noremap <C-T> <C-W>k<C-W>_
noremap <C-D> <C-W>h
noremap <C-N> <C-W>l
set winminheight=0


set tags=tags;/
set wrap

" The next 50 lines or so were stolen from nod.
"
set nomodeline

augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

let python_highlight_all = 1

function! SuperCleverTab()
  if pumvisible()
    return "\<C-N>"
  endif
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction
" inoremap <Tab> <C-R>=SuperCleverTab()<cr>
nmap <Tab> <C-R>=SuperCleverTab()<cr>

" trailing whitespace kills puppies
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" cscope goodness
set tags=~/.vim/tags/snoball.tags,~/.vim/tags/tornado.tags,~/.vim/tags/mogo.tags
set nocscopeverbose
cs add ~/.vim/tags/snoball.cscope
cs add ~/.vim/tags/tornado.cscope
cs add ~/.vim/tags/mogo.cscope
cs add ~/.vim/tags/python.cscope
set cscopeverbose

