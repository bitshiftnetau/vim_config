# vim/neovim_config
vim configuration file

This document will serve as a personal reference for configuring nvim and vim on Arch Linux. 

Seeing as there is no default central way to configure vim or neovim across all users including root, I figured that
symlinking would be much better

Now, I am going to track these config files. So instead of creating them
in the actual global locations i.e. /etc/vimrc, we are going to create 
a git folder and place them there. 

mkdir -p  /etc/git/dotfiles/.vim/autoload
mkdir 		/etc/git/dotfiles/.vim/colors
mkdir 		/etc/git/dotfiles/.vim/plugged
touch			/etc/git/dotfiles/vimrc
touch			/etc/git/dotfiles/.vimrc.plug

|--- Plugins ---|

Download vim-plug:

sudo curl -fLo /etc/git/dotfiles/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

|--- Symlinks ---|

After that we need to symlink our /etc/.vim directories and /etc/vimrc file:

Vim:
ln -s /etc/git/dotfiles/.vim /etc/.vim
ln -s /etc/git/dotfiles/vimrc /etc/vimrc
ln -s /etc/git/dotfiles/.vimrc.plug /etc/.vimrc.plug

NeoVim:
(we can't link the full .vim dir because it causes a circular link):

ln -s /etc/git/dotfiles/.vim/autoload /etc/xdg/nvim/autoload
ln -s /etc/git/dotfiles/.vim/colors		/etc/xdg/nvim/colors
ln -s /etc/git/dotfiles/vimrc					/etc/xdg/nvim/init.vim
ln -s /etc/git/dotfiles/.vim/plugged	/etc/xdg/nvim/plugged
ln -s /etc/git/dotfiles/.vim/autoload/plug.vim /usr/share/vim/vimfiles/autoload/plug.vim



|--- Installation ---|

Install neovim, curl and vim-plug (vim plugin manager):

NeoVim:

pacman -S neovim 

Curl:

pacman -S curl


|--- Config ---|

Add the following to /etc/git/dotfiles/vimrc:

 if filereadable(expand("/etc/.vimrc.plug"))
    source /etc/.vimrc.plug
 endif



|--- Plugin Config ---|

NOTE: Please review the githubs for all plugins listed in the .vimrc.plug file as there are external dependencies like python3 and it's interface to vim

Any plugins you want to install, write them into the .vimrc.plug file you have just created. 

The format is as follows:

call plug#begin('/etc/.vim/plugged')

Plug 'plugin shorthand for git'

call plug#end()

Example:

Plug 'tpope/vim-fugitive'

Link:
sudo ln -s /home/user/.local/share/nvim/rplugin.vim /root/.local/share/nvim/rplugin.vim

YCM-Generator
export PATH=$PATH:/usr/share/YCM-Generator

Configuration is written out to the .ycm_extra_conf.py file. This file should go in your project folder.

What this generator does is reading the makefile in your project directory and translate the setup of your build into the setup of your auto-completion.
So you’ll have to know where does the C++ library locate in your machine. Type echo | clang -v -E -x c++ - into your terminal

You should tell your auto-completion program to search the same place as well. To do this, go to your YCM-Generator directory and find template.py. 
Find the flags variable (which is a python list) at the beginning of the source file, add your include directories like this:

flags = [
	'-isystem',
	'/path/to/your/first/system/include/directory',
	'-isystem',
	'/path/to/your/second/system/include/directory',
	...
	'-I',
	'/path/to/your/first/local/include/directory',
	...
]

In short, the -isystem tag precedes all the system library paths, while -I precedes all the local include directories. 
Keep in mind that this is a template so you shouldn’t add any project-specific paths in there. 
Personally, I only add . to the local include directories in template.py.

When you generate configuration files for your project with YCM-Generator, you should run:

/path/to/YCM-Generator/config_gen.py /path/to/project




|--- Plugin Installation ---|

Open up nvim or vim and run :PlugInstall


|--- Key Mappings ---|

After that, any key mappings you want to make are up to you. Just add them to the ~/.vimrc file. 




|--- Git tracking ---|

As mentioned earlier, we have structured our files and links in a way
that means it's easy to track without having a huge .gitignore file. 

Run the following in your /etc/git/dotfiles directory

git init


Then make a .gitignore file and add the following to it:

.vim/plugged


We need to do this because the plugins folder is actually a git repo
Even if we add this, it's a sub repo so it won't be tracked and just
makes more mess.

|--- TL;DR Installation list ---|

Editor:           Neovim
Plugin Manager:   Vim-plug
Main Config:      ~/.vimrc (symlinked to every other config location)

Key Mappings:     see: Key Mappings section for complete list of my current mappings
Plugins:          see: Plugin Config for a complete list of my current plugins 

|--- MISC ---|

Javascript plugins:
npm install -g prettier

System vim plugins:

YouCompleteMe:
sudo pip install future

packer -S: 
merlin-3.2.2-1  
vim-ale-2.1.0-1  
vim-bufexplorer-7.4.19-1  
vim-colorsamplerpack-2012.10.28-5  
vim-doxygentoolkit-0.2.13-4

NOTE: you will still need to add configuration options for the above plugins in your /etc/vimrc file


|------------------- TO DO -------------------------|

Move .vimrc file to global folder /etc/vim/ and change all symlinks to this directory. See Arch Linux Vim and NeoVim pages for directions.

sudo ln -s /etc/vimrc /etc/xdg/nvim/init.vim
sudo ln -s /etc/.vim   /etc/xdg/nvim

/etc/xdg/nvim
autoload 	-> /etc/.vim/autoload
colors 		-> /etc/.vim/colors
init.vim 	-> /etc/vimrc
plugged 	-> /etc/.vim/plugged


Add a map command for sloccount (counts lines of code)


LOCAL WORKSPACE CONFIG 

Create a local configuration file that applies to a new workspace upon
creation. 

Within this config file there should be a universal local directory 
structure, depending on the filetype that is created
Within that local directory structure should have a default set of the 
following:

  -git hooks
  -makefiles
  -local runtime commands for tools like nodemon, apache, etc. 
  -ctags
  -.ycm_extra_conf.py for each workspace
  -local .vimrc file related to: 
    -filetype extension
    -tags
  -either find a way to dynamically pass in the names of include folders
	so that vim can include libraries. OR just have a new template
	for each kind of project... just include all new sdks and include 
  paths = simple
  -lang specific linter config
		C: splint

Troubleshooting

Cmake

“The build failed. NOTE: It is *highly* unlikely that this is a bug but 
rather that this is a problem with the configuration of your system or a
 missing dependency”.  To spare the diagnostic process, what caused this
 was a really old version of GCC compiler. I had a newer version of the 
compiler at a different location which is not the standard one and hence
 the plugin could not find it. I added the following lines to “CMakeList
s.txt” to point to the right one.

set(CMAKE_C_COMPILER )
set(CMAKE_CXX_COMPILER <path_to_g++>)
project (YouCompleteMe)
