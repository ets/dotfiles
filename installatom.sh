#!/bin/bash

curdir=`pwd`
# install Atom and plugins
cd ~/workspace
if [ -d atom ]; then
cd atom; git pull
else
git clone https://github.com/ets/atom.git
cd atom
fi
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
echo "Install https://fonts.google.com/?query=Incon&selection.family=Inconsolata"

cp ${curdir}/.atom/* ~/.atom
