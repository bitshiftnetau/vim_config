" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

"-------------------------------------
"------------- RUNTIME ---------------
"-------------------------------------

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" do not load defaults if ~/.vimrc is missing
let skip_defaults_vim=1

"-------------------------------------
"---------- PLUGIN FILE --------------
"-------------------------------------

if filereadable(expand("/etc/.vimrc.plug"))
    source /etc/.vimrc.plug
endif

"-------------------------------------
"-------- VIM CORE CONFIG ------------
"-------------------------------------

" Set compatibility to Vim only.
" set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" Toggle paste option
set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

set showcmd " Show (partial) command in status line.
set showmatch " Show matching brackets.
"set ignorecase " Do case insensitive matching
"set smartcase " Do smart case matching
set incsearch " Incremental search
set autowrite " Automatically save before commands like :next and :make
"set hidden " Hide buffers when they are abandoned
set mouse=a " Enable mouse usage (all modes)
set clipboard=unnamedplus

"--------------------------------------------
"-------------- KEYBINDINGS -----------------
"--------------------------------------------

" ------------ Vim --------------

" Reload vimrc
nnoremap <C-F10> :source /etc/vimrc<CR>

" Write buffer to file when not opened as sudo
nnoremap <C-F9> :w !sudo tee %<CR>

" Write buffer to file
nnoremap <C-x> :w<CR>

" PlugInstall/Update/Status
nnoremap <C-F5> :PlugInstall<CR>
nnoremap <C-F6> :PlugUpdate<CR>
nnoremap <C-F7> :PlugStatus<CR>

" ---------  NeoVim ------------

" Reload vimrc
nnoremap <F34> :source /etc/vimrc<CR>

" Write buffer to file when not opened as sudo
nnoremap <F33> :w !sudo tee %<CR>

" PlugInstall/Update/Status
nnoremap <F29> :PlugInstall<CR>
nnoremap <F30> :PlugUpdate<CR>
nnoremap <F31> :PlugStatus<CR>

" ---------- *Vim AGNOSTIC ------------

" Write buffer to file
nnoremap <C-x> :w<CR>

" Navigate between windows in normal mode
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-l> :wincmd l<CR>

" Navigate between windows in terminal mode
tnoremap <C-h> <C-w>h<CR>
tnoremap <C-j> <C-w>j<CR>
tnoremap <C-k> <C-w>k<CR>
tnoremap <C-l> <C-w>l<CR>

" Navigate between windows in insert mode
inoremap <C-h> <C-w>h<CR>
inoremap <C-j> <C-w>j<CR>
inoremap <C-k> <C-w>k<CR>
inoremap <C-l> <C-w>l<CR>

" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>

" Open Terminal
nnoremap <C-d> :term<CR>

" Close Terminal
tnoremap <Esc> <C-\><C-n>:q!<CR>

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

" Jump to next tag
"nnoremap N :C-]

"----------------------------------
"------ GLOBAL PLUGIN CONFIG ------ 
"---------------------------------- 

"-------- NERDTree ----------
nnoremap @ :NERDTreeToggle<CR>

autocmd VimEnter * NERDTree<CR>


"-------- UltiSnips ---------

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"



"--------------------------------------------
"---------- WORKSPACE / PROJECT -------------
"--------------------------------------------

" Load .vimrc if it exists in currect dir
set exrc

"The following configuration options need to 
"go into a .vimrc template file that will be
"included in the workspace template structure
"this .vimrc file will be used as defined
"above by 'set exrc'

" Set filetype on 
filetype on


" --------- C Language ----------

" C source and header filetype detection
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END


"Vim has a gf command (and related, <C-W><C-F> to open in new tab) which opens a file, whose name is under or after the cursor. 
"This feature is extremely useful for browsing header files.
"By default, Vim searches file in working directory. However, most projects have separated directory for include files. 
"Thus, you should set Vim’s path option to contain a comma-separated list of directories to look for the file.
let &path.="src/include"



"--------- Javascript -----------

" deoplete
autocmd FileType javascript set formatprg=prettier\ --stdin
let g:deoplete#enable_at_startup = 1


"------------ Java --------------
"set includeexpr=substitute(v:fname,'\\.','/','g')
