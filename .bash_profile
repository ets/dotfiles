# .bash_profile

# User specific environment and startup programs

export PYTHONPATH=/opt/local/Library/Frameworks/Python.framework/Versions/Current/

PATH=$PATH:$HOME/.rbenv/bin/:$HOME/bin:/opt/local/bin:$PYTHONPATH:bin
# /usr/local/bin:/usr/local/sbin:~/bin:$QTDIR/bin:$AWS_CLI_BIN

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

export PATH
eval "$(rbenv init -)"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
