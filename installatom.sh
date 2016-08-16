#!/bin/bash

# install Atom and plugins
cd ~/workspace
git clone https://github.com/ets/atom.git
cd atom
script/build # Creates application at /Applications/Atom.app
apm install file-watcher
apm install wordcount
apm install atom-django
apm install atom-sublime-select

