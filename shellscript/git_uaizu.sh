#!/bin/sh

if [ -e ~/usr/bin/Git/git-1.9.5/git ]; then
    echo "Git has been already built"
else
    mkdir -p ~/usr/bin/Git
    cd ~/usr/bin/Git
    wget https://www.kernel.org/pub/software/scm/git/git-1.9.5.tar.gz
    tar xvf git-1.9.5.tar.gz
    rm git-1.9.5.tar.gz
    cd git-1.9.5
    ./configure
    make
    echo "PATH=\$PATH:/home/student/$USER/usr/bin/Git/git-1.9.5" >> ~/.zshrc
fi
cd $HOME
exec zsh -l
