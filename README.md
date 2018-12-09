# vim/neovim_config
vim configuration file

This document will serve as a personal reference for configuring nvim and vim on Arch Linux. 

Seeing as there is no default central way to configure vim or neovim across all users including root, I figured that
symlinking would be better. Most people don't advocate for linking this way or for running a global config from a user
account, as it's generally considered uncouth. I do agree, but in this instance I don't really care. 


|--- Installation ---|

Install neovim, curl and vim-plug (vim plugin manager):

NeoVim:

pacman -S neovim 

Curl:

pacman -S curl

Vim-Plug (This needs to be installed in both at the user level AND root, otherwise when you run PlugInstall after opening a 
file with sudo, it can't find the plugin): 

Create directories for vim-plug:


Vim:

User:
/home/access/.vim/autoload

Root:
/root/.vim/autoload

NeoVim:

User:
/home/access/.config/nvim
/home/access/.config/nvim/autoload

Root:
/root/.config/nvim
/root/.config/nvim/autoload

Vim:

User:
B
sudo curl -fLo /home/access/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Root:
sudo curl -fLo /root/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

NeoVim:

User:
sudo curl -fLo /home/access/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Root:
sudo curl -fLo /root/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim



|--- Config and Plugins ---|

Create a ~/.vimrc file and a .vimrc.plug file. Add the following to ~/.vimrc:

 if filereadable(expand("home/<user>/.vimrc.plug"))
    source /home/<user>/.vimrc.plug
 endif

Put all of your changes in the ~/.vimrc file, then symlink to the various config file locations. They are as follows:

Vim local user:
~/.vimrc

Vim root: 
ln -s /home/<user>/.vimrc   /root/.vimrc
ln -s /home/<user>/.vim/    /root/.vim/

Neovim local user:
ln -s /home/<user>/.vimrc   /home/access/.config/nvim/init.vim

Neovim root:
ln -s /home/<user>/.vimrc   /etc/xdg/nvim/init.vim


|--- Plugin Config ---|

Any plugins you want to install, write them into the .vimrc.plug file you have just created. 

The format is as follows:

call plug#begin('/home/<user>/.vim/plugged')

Plug '<plugin shorthand for git>'

call plug#end()

Example:

Plug 'tpope/vim-fugitive'


|--- Plugin Installation ---|

Open up nvim or vim and run :PlugInstall


|--- Key Mappings ---|

After that, any key mappings you want to make are up to you. Just add them to the ~/.vimrc file. 

Here is a list of my current keymappings:

" Vim's auto indentation feature does not work properly with text copied from outisde of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

nnoremap <C-d> :term<CR>
tnoremap <Esc> <C-\><C-n>:q!<CR>

nnoremap <C-F10> :source ~/.vimrc<CR>
nnoremap <C-F9> :w !sudo tee %<CR>
nnoremap <C-x> :w<CR>

nnoremap <C-k> :wincmd k<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-l> :wincmd l<CR>

tnoremap <C-h> <C-w>h<CR>
tnoremap <C-j> <C-w>j<CR>
tnoremap <C-k> <C-w>k<CR>
tnoremap <C-l> <C-w>l<CR>
inoremap <C-h> <C-w>h<CR>
inoremap <C-j> <C-w>j<CR>
inoremap <C-k> <C-w>k<CR>
inoremap <C-l> <C-w>l<CR>




|--- Git tracking ---|

Making a git repository of your home is probably a bad idea (you would be spending more time creating your .gitignore file than on doing what you really want to do).

I suggest using a separate git directory for your dotfiles (eg. ~/git/dotfiles) and them making symlinks to your home (eg. ln -s ~/git/dotfiles/.vim ~/.vim, etc.).


|--- TL;DR Installation list ---|

Editor:           Neovim
Plugin Manager:   Vim-plug
Main Config:      ~/.vimrc (symlinked to every other config location)

Key Mappings:     see: Key Mappings section for complete list of my current mappings
Plugins:          see: Plugin Config for a complete list of my current plugins 
