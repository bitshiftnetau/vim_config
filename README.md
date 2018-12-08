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

User:
sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Root:
sudo curl -fLo /root/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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

|--- Git tracking ---|

Making a git repository of your home is probably a bad idea (you would be spending more time creating your .gitignore file than on doing what you really want to do).

I suggest using a separate git directory for your dotfiles (eg. ~/git/dotfiles) and them making symlinks to your home (eg. ln -s ~/git/dotfiles/.vim ~/.vim, etc.).

