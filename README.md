dot files
=========

This is just here to help me move between machines.

inspired by aniero's fu. (http://github.com/aniero/dotfiles)


use it
------

    python install.py
    git submodule init
    git submodule update


Brew stuff
----------

brew install ack dos2unix gfortran p7zip readline zeromq aspell jpeg pcre zsh
brew install fortune pngcrush sqlite beanstalk unrar mmv wget pkg-config
brew install phantomjs node pwgen python tmux

Adding git pathogen repos
-------------------------

    cd ~/dotfiles
    git submodule add git@github.com:derekwyatt/vim-scala.git vim/bundle/vim-scala
