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


|--- Config ---|

Create a /etc/vimrc file and a /etc/.vimrc.plug file. 

Add the following to /etc/vimrc:

 if filereadable(expand("/etc/.vimrc.plug"))
    source /etc/.vimrc.plug
 endif


|--- Plugins ---|

Create directories for Vim, NeoVim, and vim-plug for both programs:

Vim:

(Global)

/etc/.vim
/etc/.vim/autoload <--- vim.plug will go here
/etc/.vim/colors
/etc/.vim/plugged

(User level is ~/.vimrc if you want to fine-tune on a user-level)

NeoVim:

/etc/xdg/nvim


Then download vim-plug:

sudo curl -fLo /etc/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


After that we need to symlink our /etc/.vim directories and /etc/vimrc file to 

ln -s /etc/.vim/autoload  /etc/xdg/nvim/autoload
ln -s /etc/.vim/colors    /etc/xdg/nvim/colors
ln -s /etc/vimrc          /etc/xdg/nvim/init.vim
ln -s /etc/.vim/plugged   /etc/xdg/nvim/plugged


Put all of your changes in the ~/.vimrc file, then symlink to the various config file locations. They are as follows:

Vim local user:
~/.vimrc

Vim root: 
ln -s   /home/user/.vimrc   /root/.vimrc

ln -s   /home/user/.vim/    /root/.vim/

Neovim local user:
ln -s /home/user/.vimrc   /home/access/.config/nvim/init.vim

Neovim root:
ln -s /home/user/.vimrc   /etc/xdg/nvim/init.vim

|--- Plugin Config ---|

NOTE: Please review the githubs for all plugins listed in the .vimrc.plug file as there are external dependencies like python3 and it's interface to vim

Any plugins you want to install, write them into the .vimrc.plug file you have just created. 

The format is as follows:

call plug#begin('/home/user/.vim/plugged')

Plug 'plugin shorthand for git'

call plug#end()

Example:

Plug 'tpope/vim-fugitive'

Link:
sudo ln -s /home/user/.local/share/nvim/rplugin.vim /root/.local/share/nvim/rplugin.vim



|--- Plugin Installation ---|

Open up nvim or vim and run :PlugInstall


|--- Key Mappings ---|

After that, any key mappings you want to make are up to you. Just add them to the ~/.vimrc file. 




|--- Git tracking ---|

Making a git repository of your home is probably a bad idea (you would be spending more time creating your .gitignore file than on doing what you really want to do).

I suggest using a separate git directory for your dotfiles (eg. ~/git/dotfiles) and them making symlinks to your home (eg. ln -s ~/git/dotfiles/.vim ~/.vim, etc.).


|--- TL;DR Installation list ---|

Editor:           Neovim
Plugin Manager:   Vim-plug
Main Config:      ~/.vimrc (symlinked to every other config location)

Key Mappings:     see: Key Mappings section for complete list of my current mappings
Plugins:          see: Plugin Config for a complete list of my current plugins 

|--- MISC ---|

Javascript plugins:
npm install -g prettier


|------------------- TO DO -------------------------|

Move .vimrc file to global folder /etc/vim/ and change all symlinks to this directory. See Arch Linux Vim and NeoVim pages for directions.

sudo ln -s /etc/vimrc /etc/xdg/nvim/init.vim
sudo ln -s /etc/.vim   /etc/xdg/nvim

/etc/xdg/nvim
autoload 	-> /etc/.vim/autoload
colors 		-> /etc/.vim/colors
init.vim 	-> /etc/vimrc
plugged 	-> /etc/.vim/plugged


