#!/bin/bash

curdir=`pwd`
# install Atom and plugins
cd ~/workspace
git clone https://github.com/ets/atom.git
cd atom
script/build # Creates application at /Applications/Atom.app
apm install file-watcher
apm install wordcount
apm install atom-django
apm install sublime-style-column-selection
apm install language-docker
apm install go-plus
apm install go-rename
apm install vim-mode-plus
apm install file-icons
apm install dash
apm install monokai-seti

cp ${curdir}/.atom/* ~/.atom
