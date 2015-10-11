#!/bin/bash

# install Atom and plugins
cd ~/workspace
git clone https://github.com/ets/atom/atom.git
cd atom
script/build # Creates application at /Applications/Atom.app
apm install file-watcher
