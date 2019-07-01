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

  " delete all registers on vim start
  " autocmd VimEnter * WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
  "-------------------------------------
  "-------- VIM CORE CONFIG ------------
  "-------------------------------------

  " Set compatibility to Vim only.
  " set nocompatible

  "set timeoutlen=1000
  "set ttimeoutlen=0
  "maptimeout 0

  set noswapfile
  "colorscheme 
  "set background=dark
  "set termguicolors
  "colorscheme material-monokai

  "colorscheme access_colors
  hi MatchParen cterm=underline ctermbg=none ctermfg=red
  "colorscheme default

  "background (transparent to match tilda)
  hi Normal guibg=NONE ctermbg=NONE

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
  set nolist
  "set listchars=trail:•,extends:#,nbsp:.
  "tab:›\ ,trail:•,extends:#,nbsp:.

  " Show line numbers
  set number

  " Set status line display
  " set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\[BUFFER=%n]\ %{strftime('%c')} 

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

  " OmniCompletion
  "filetype plugin indent on
  "set omnifunc=syntaxcomplete#Complete



  "----------------------------------------------------------------------
  "--------------------------- KEYBINDINGS ------------------------------
  "----------------------------------------------------------------------

  " ------------ Vim --------------

  "Clear highlight of last search
  :nnoremap <silent> <CR> :nohlsearch<CR><CR>

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
  "nmap <C-j> <Plug>GitGutterNextHunk
  "nmap <C-k> <Plug>GitGutterPrevHunk
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



  "----------------------------- Devicons -----------------------------
  "let g:airline_powerline_fonts = 1
  "set encoding=utf-8
  set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

  "----------------------- vim-multiple-cursors -----------------------
  let g:multi_cursor_use_default_mapping=0

  " Default mapping
  "let g:multi_cursor_start_word_key      = '<C-n>'
  "let g:multi_cursor_select_all_word_key = '<A-n>'
  "let g:multi_cursor_start_key           = 'g<C-n>'
  "let g:multi_cursor_select_all_key      = 'g<A-n>'
  "let g:multi_cursor_next_key            = '<C-n>'
  "let g:multi_cursor_prev_key            = '<C-p>'
  "let g:multi_cursor_skip_key            = '<C-x>'
  "let g:multi_cursor_quit_key            = '<Esc>'



  "--------------------------- NERDTree -------------------------------
  nnoremap @ :NERDTreeToggle<CR>
  autocmd VimEnter * NERDTree

  "open auto
  "autocmd StdinReadPre * let s:std_in=1
  "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

  ":hi Directory guifg=#FF0000 ctermfg=red

  "--------------------------- UltiSnips ------------------------------

  " Trigger configuration. 
  " Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"

  " If you want :UltiSnipsEdit to split your window.
  "let g:UltiSnipsEditSplit="vertical"




  "-------------------------- Vim-lightline ------------------------------

  " Add diagnostic info for https://github.com/itchyny/lightline.vim
  "let g:lightline = {
  "      \ 'colorscheme': 'wombat',
  "      \ 'active': {
  "      \   'left': [ [ 'mode', 'paste' ],
  "      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
  "      \ },
  "      \ 'component_function': {
  "      \   'cocstatus': 'coc#status'
  "      \ },
  "      \ }

  "let g:lightline = {
  "  \     'active': {
  "  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  "  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  "  \     }
  "  \ }

  "g:lightline.colorscheme			*g:lightline.colorscheme*
  "		The colorscheme for lightline.vim.
  "		Currently, wombat, solarized, powerline, jellybeans, Tomorrow,
  "		Tomorrow_Night, Tomorrow_Night_Blue, Tomorrow_Night_Eighties,
  "		PaperColor, seoul256, landscape, one, darcula, molokai, materia,
  "		material, OldHope, nord, 16color and deus are available.

  let g:lightline = {
        \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], 
      \             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ],
      \  'right': [ ['lineinfo'], ['percent'], ['fileformat', 'fileencoding'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

"turn off tab-line (the the top line)
let g:lightline.enable = { 'tabline': 0 }

"-------------------------- Vim-buffet ------------------------------
"
let g:buffet_use_devicons = 1
"let g:workspace_use_devicons = 1

noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
"noremap <Leader><Tab> :Bw<CR>
"noremap <Leader><S-Tab> :Bw!<CR>
"noremap <C-t> :tabnew split<CR>

"cabbrev bonly WSBufOnly

let g:buffet_separator = "|"
let g:buffet_powerline_separators = 0
let g:buffet_tab_icon = ">>"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

"BuffetCurrentBuffer - the current buffer.
"BuffetActiveBuffer - an active buffer (a non-current buffer visible in a non-current window).
"BuffetBuffer - a non-current and non-active buffer.
"BuffetTrunc - the truncation indicator (count of truncated buffers from the left or right).
"BuffetTab - a tab.

"hi! TabLineFill ctermfg=195 ctermbg=54
"hi! TabLine ctermfg=195 ctermbg=red
"hi! TabLineSel ctermfg=Red ctermbg=Yellow


function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=154 ctermfg=0
    hi! BuffetActiveBuffer cterm=NONE ctermbg=154 ctermfg=0 
    hi! BuffetBuffer ctermfg=195 ctermbg=54
    hi! BuffetTrunc ctermfg=195 ctermbg=54
    hi! BuffetTab ctermfg=195 ctermbg=54
endfunction


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
"--------------------------- LINTERS ----------------------------------
"----------------------------------------------------------------------

"----------------------- ALE Linters ------------------------------

"C
"let g:ale_linters = {'c': 'all'}

"Javascript
"let g:ale_linters = {'javascript': ['eslint']}

"----------------------- vim-lsp / Cquery -----------------------------

"if executable('cquery')
"   au User lsp_setup call lsp#register_server({
"      \ 'name': 'cquery',
"      \ 'cmd': {server_info->['cquery']},
"      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
"      \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
"      \ 'whitelist': ['c', 'cpp'],
"      \ })
"endif

"-------------------------- Asyncomplete -------------------------

"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
"

"------------------------ coc.nvim -------------------------------

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>



" Trouble shooting

" Try these steps when you have problem with coc.nvim.

"    Make sure your vim version >= 8.0 by command :version.
"    If service failed to start, use command :CocInfo or :checkhealth on neovim.
"    Checkout the log of coc.nvim by command :CocOpenLog.
"    When you have issue with a languageserver, it's recommended to checkout the output



"----------------------------------------------------------------------
"---------------------------- LSPs ------------------------------------
"----------------------------------------------------------------------

"-------------------------- CCLS ---------------------------------



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
let &path.="src/include, /usr/include/AL, /usr/include/sdks/gecko_sdk_suite/v2.4/platform/CMSIS/Include, /usr/include/sdks/gecko_sdk_suite/v2.4/platform/Device/SiliconLabs/EFM32ZG/Include, /usr/include/sdks/gecko_sdk_suite/v2.4/util/third_party/freertos/include, /usr/include/sdks/gecko_sdk_suite/v2.4/platform/emlib/inc, /usr/include/sdks/gecko_sdk_suite/v2.4/hardware/kit/EFM32ZG_STK3200, /usr/include/sdks/gecko_sdk_suite/v2.4/hardware/kit/common/bsp"
"/usr/arm-none-eabi/include, /usr/lib/gcc/arm-none-eabi/8.3.0/include, /usr/lib/gcc/arm-none-eabi/8.3.0/include-fixed"

let spongecake = "/srv/code/c/SpongeCake/src/application, /srv/code/c/SpongeCake/src/application/configs, /srv/code/c/SpongeCake/src/board/STK3200, /srv/code/c/SpongeCake/src/middleware, /srv/code/c/SpongeCake/src/HAL, /srv/code/c/SpongeCake/src/HAL/host, /srv/code/c/SpongeCake/src/HAL/host/efm32zg222f32, /srv/code/c/SpongeCake/src/HAL/slave, /srv/code/c/SpongeCake/src/HAL/slave/dw1000, /srv/code/c/SpongeCake/src/HAL/slave/venus638, /srv/code/c/SpongeCake/src/port_adaptors"

let &path.= spongecake

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

"-------------------------------------
"---------- PLUGIN FILE --------------
"-------------------------------------

if filereadable(expand("/etc/.vimrc.plug"))
    source /etc/.vimrc.plug
endif


