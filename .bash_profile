# .bash_profile

# User specific environment and startup programs

PATH=$PATH:$HOME/.rbenv/bin:$HOME/bin

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

export PATH
eval "$(rbenv init -)"

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi


