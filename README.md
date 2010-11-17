Dot Vim
=======

This is my .vim directory.  I took a page out of the [VimCasts][1] book and utilize submodules to manage bundles.  

Usage:
------

Usage can be seen by watching the [VimCasts Episode : Synchronizing plugins with git submodules and pathogen][2], but basically it follows as:

    cd ~
    git clone https://github.com/klauern/dot-vim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule init
    git submodule update

[1]: http://www.vimcasts.org/
[2]: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
