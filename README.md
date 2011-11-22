Dot Vim
=======

Vim-Scripts has a GitHub mirror that allows users to create git bundles that can be pretty easily mirrored to GitHub and managed for users.  I took
a page out of their book and am using that now.  See [Vim-Scripts](http://vim-scripts.org/) for details on the project.

From the Vim-Scripts/Tools page, I am also using [vim-update-bundles](https://github.com/bronson/vim-update-bundles) which allows you to place a number
of small comments in your .vimrc file that will automatically update and place itself in your bundle/ directory.  No more having to commit changes
for these bundles all the time (Thank God.  Why waste the commits and space on that, especially if you don't control it).

It's pretty easy to use, so take a look at it and how you might use it.

Config
------

Mostly for me, but if you need to use this from a brand new installation, be sure to clone vundle:

   git clone https://github.com/gmarik/vundle.git bundle/vundle

Where `bundle/vundle` is in your `.vim/` directory.
