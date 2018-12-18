"------------------ YouCompleteMe ------------------

"Default YouCompleteMe conflicts with default UltiSnips tab key usage. 
"Both YouCompleteMe and UltiSnips suggest map UltiSnips expand trigger to 
"a different key, but I found this unsatisfactory. Rather than using a 
"different key for UltiSnips it’s better to make YCM not use Tab key. 
"To do this, add two following lines to your .vimrc:
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
"Don’t worry, you still be able to cycle through completion 
"with <C-N> and <C-P> keys.


