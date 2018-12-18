"------------------ vim-gitgutter -------------------

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


