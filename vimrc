"-------------------------------------
"------------- RUNTIME ---------------
"-------------------------------------

" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

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


"set timeoutlen=1000
"set ttimeoutlen=0
"maptimeout 0


"colorscheme 
"set background=dark
"set termguicolors
"colorscheme material-monokai
colorscheme access_colors
"colorscheme default


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

" Uncomment below to set the max textwidth. Use a value corresponding to 
" the width of your screen.
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

" Highlight matching pairs of brackets. 
" Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\[BUFFER=%n]\ %{strftime('%c')} 

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

" Store info from no more than 100 files at a time, 9999 lines of text, 
" 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

set showcmd " Show (partial) command in status line.
set showmatch " Show matching brackets.
set incsearch " Incremental search
set autowrite " Automatically save before commands like :next and :make
"t hidden " Hide buffers when they are abandoned
set mouse=a " Enable mouse usage (all modes)
set clipboard=unnamedplus


"----------------------------------------------------------------------
"--------------------------- KEYBINDINGS ------------------------------
"----------------------------------------------------------------------


" ------------ Vim --------------

"Exit out of terminal
tnoremap <C-x> <C-w>:bd!<CR>j

"Close current buffer
nnoremap <C-x> :bd!<CR>

" Reload vimrc
nnoremap <C-F10> :source /etc/vimrc<CR>

" Write buffer to file when not opened as sudo
nnoremap <C-F9> :w !sudo tee % >/dev/null<CR>

" PlugInstall/Update/Status
nnoremap <C-F5> :PlugInstall<CR>
nnoremap <C-F6> :PlugUpdate<CR>
nnoremap <C-F7> :PlugStatus<CR>
nnoremap <C-F8> :PlugClean<CR>

" ---------  NeoVim ------------

"Exit out of terminal
"if has('nvim')
"tnoremap <Esc> <C-\><C-n>:q!<CR>
"endif

" Reload vimrc
nnoremap <F34> :source /etc/vimrc<CR>

" Write buffer to file when not opened as sudo
nnoremap <F33> :w !sudo tee % > /dev/null<CR>

" PlugInstall/Update/Status
nnoremap <F29> :PlugInstall<CR>
nnoremap <F30> :PlugUpdate<CR>
nnoremap <F31> :PlugStatus<CR>
nnoremap <F32> :PlugClean<CR>

" ---------- *Vim AGNOSTIC ------------

"nnoremap <C-d> :term<CR>
nnoremap <C-d> :terminal<CR>

" Navigate to previous buffer
nnoremap <C-c> :b#<CR>

" Write buffer to file
nnoremap <s> :w<CR>

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

" Vim's auto indentation feature does not work properly with text 
" copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>

"tnoremap <C-k> <Up>
"tnoremap <C-j> <Down>
"tnoremap <C-h> <Left>
"tnoremap l <Right>

" Close Terminal
"tnoremap <C-d> :bd<CR>


" Automatically save and load folds
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview"

" Jump to next tag
nnoremap N :C-]j

"Paste into terminal

"----------------------------------------------------------------------
"--------------------- GLOBAL PLUGIN CONFIG ---------------------------
"----------------------------------------------------------------------

"----------------------- vim-gitgutter ----------------------------

" https://github.com/airblade/vim-gitgutter

set updatetime=50 " speed of update 
let g:gitgutter_max_signs = 500  " maximum number of changes that will be
                                 " shown in a given file
let g:gitgutter_map_keys = 0 " don't setup any default mappings 

" View next or previous hunk when adding files
nmap <C-j> <Plug>GitGutterNextHunk
nmap <C-k> <Plug>GitGutterPrevHunk
"nmap <Leader>ha <Plug>GitGutterStageHunk
"nmap <Leader>hr <Plug>GitGutterUndoHunk
"nmap <Leader>hv <Plug>GitGutterPreviewHunk
"omap ih <Plug>GitGutterTextObjectInnerPending
"omap ah <Plug>GitGutterTextObjectOuterPending
"xmap ih <Plug>GitGutterTextObjectInnerVisual
"xmap ah <Plug>GitGutterTextObjectOuterVisual

"To customise your sign column's background color, 
"first tell vim-gitgutter to leave it alone
"let g:gitgutter_override_sign_column_highlight = 0

"And then either update your colorscheme's SignColumn 
"highlight group or set it in your vimrc:

"highlight SignColumn ctermbg=whatever    " terminal Vim
"highlight SignColumn guibg=whatever      " gVim/MacVim

"By default the sign column will appear when there are 
"signs to show and disappear when there aren't. 
"To always have the sign column, add to your vimrc:

if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

"To customise the colours, set up the following highlight groups in your
"colorscheme or ~/.vimrc:

"GitGutterAdd          " an added line
"GitGutterChange       " a changed line
"GitGutterDelete       " at least one removed line
"GitGutterChangeDelete " a changed line followed by at least one removed line

"You can either set these with highlight GitGutterAdd {key}={arg}... 
"or link them to existing highlight groups with, say, highlight link 
"GitGutterAdd DiffAdd.

"To customise the symbols, add the following to your ~/.vimrc:

"let g:gitgutter_sign_added = 'xx'
"let g:gitgutter_sign_modified = 'yy'
"let g:gitgutter_sign_removed = 'zz'
"let g:gitgutter_sign_removed_first_line = '^^'
"let g:gitgutter_sign_modified_removed = 'ww'

"Line highlights
"Similarly to the signs' colours, set up the following highlight 
"groups in your colorscheme or ~/.vimrc:

"GitGutterAddLine          " default: links to DiffAdd
"GitGutterChangeLine       " default: links to DiffChange
"GitGutterDeleteLine       " default: links to DiffDelete
"GitGutterChangeDeleteLine " default: links to GitGutterChangeLineDefault, i.e. DiffChange





"--------------------------- NERDTree -------------------------------
nnoremap @ :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree<CR>



"--------------------------- UltiSnips ------------------------------

" Trigger configuration. 
" Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"



"---------------------------- UltiSnips -------------------------------

" Trigger configuration. 
" Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"



"-------------------------- YouCompleteMe ------------------------------

"Default YouCompleteMe conflicts with default UltiSnips tab key usage. 
"Both YouCompleteMe and UltiSnips suggest map UltiSnips expand trigger to 
"a different key, but I found this unsatisfactory. Rather than using a 
"different key for UltiSnips it’s better to make YCM not use Tab key. 
"To do this, add two following lines to your .vimrc:
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
"Don’t worry, you still be able to cycle through completion 
"with <C-N> and <C-P> keys.




"-------------------------- Vim-workspace ------------------------------
"
let g:workspace_use_devicons = 1

nnoremap <Tab> :WSNext<CR>
nnoremap <S-Tab> :WSPrev<CR>
nnoremap <Leader><Tab> :WSClose<CR>
nnoremap <Leader><S-Tab> :WSClose!<CR>
nnoremap <C-t> :WSTabNew<CR>

"cabbrev bonly WSBufOnly

let g:workspace_powerline_separators = 1
let g:workspace_tab_icon = "\uf00a"
"let g:workspace_left_trunc_icon = "\uf0a8"
"let g:workspace_right_trunc_icon = "\uf0a9"





" -------------------------- vim-fugitive -------------------------------
"
" https://github.com/tpope/vim-fugitive
"
nnoremap <C-f> :Ggrep 
"set statusline={FugitiveStatusline()}

"Vim
nnoremap <C-F12> :Gcommit -a -m
nnoremap <C-F11> :Gcommit %

"Neovim
nnoremap <F36> :Gcommit -a -m
nnoremap <F37> :Gcommit %

" -------------------------- Emmett -------------------------------------
"
let g:user_emmet_leader_key=','





"let g:signify_vcs_list = 1
"let g:signify_realtime = 1

"----------------------------------------------------------------------
"--------------------- WORKSPACE / PROJECT ----------------------------
"----------------------------------------------------------------------

" Load .vimrc if it exists in currect dir
set exrc

"The following configuration options need to go into a .vimrc template 
"file that will be included in the workspace template structure. 
"This .vimrc file will be used as defined above by 'set exrc'

" Set filetype on 
filetype on


" --------- C Language ----------

" C source and header filetype detection with doxygen
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END


"Vim has a gf command (and related, <C-W><C-F> to open in new tab) 
"which opens a file, whose name is under or after the cursor. 
"This feature is extremely useful for browsing header files.
"By default, Vim searches file in working directory. 
"However, most projects have separated directory for include files. 
"Thus, you should set Vim’s path option to contain a comma-separated 
"list of directories to look for the file.
let &path.="src/include, /usr/include/AL"

"To let clang know about your include directories custom defines, 
"you should place your -I and -D compiler flags into the
" .clang_complete file at the root of your project.

"If you already populated path option with include directories, 
"you may use the following command to insert list of compiler options:

" "='-I'.substitute(&path, ',', '\n-I', 'g')<cr>p

"After you’re done with file editing and navigation, you want to 
"configure Vim to compile your project. Vim has a make command which, 
"by default, executes make in current directory and parses output for errors.

"The actual command to execute is stored in makeprg option. 
"If you build your project out-of-source, with custom make 
"arguments or even a different build command, 
"just change makeprg to reflect this.
set makeprg=make\ -C\ ../build\ -j4

"After that, you can compile your project as quickly as typing “:make.” 
"You may go further and bind this command to one of the keys. For example:
nnoremap <F5> :make!<cr>

"After you build your project, it’s expected to run it. 
"You can execute any shell command from Vim’s command mode if you 
"prepend it with !. So, to run your great program, 
"you just type :!./my_great_program.
"nnoremap <F5> :!./<program name><cr>



"--------- Javascript -----------



"------------ Java --------------
"set includeexpr=substitute(v:fname,'\\.','/','g')

