# .bashrc

# set bash prompt
function _git_prompt() {
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local ansi=42
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local ansi=43
        else
            local ansi=45
        fi
        if [[ "$git_status" =~ On\ branch\ ([^[:space:]]+) ]]; then
            branch=${BASH_REMATCH[1]}
            test "$branch" != master || branch=' '
        else
            # Detached HEAD.  (branch=HEAD is a faster alternative.)
            branch="(`git describe --all --contains --abbrev=4 HEAD 2> /dev/null ||
                echo HEAD`)"
        fi
        echo -n '\[\e[0;37;'"$ansi"';1m\]'"$branch"'\[\e[0m\] '
    fi
}
function _prompt_command() {
    PS1="`_git_prompt`"'[\u@tinkertoys:\w]\$ '
}
PROMPT_COMMAND=_prompt_command

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# load aliases
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.bash_local ]; then
  . ~/.bash_local
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# make all completions case insensitive
bind 'set completion-ignore-case on'

# we want tmux to use 256 colors
export TERM="screen-256color"

export LANG=en_US.UTF-8
export LSCOLORS=gxFxCxDxBxegedabagacad
export SVN_EDITOR=vi
export AWS_CREDENTIAL_FILE=~/.aws.creds
export QTDIR=/usr/local/qt
export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH
export RBENV_BIN=~/.rbenv/bin

# Needed for webgen https://groups.google.com/d/msg/webgen-users/wYYWrwljJ1Y/Q8G4SzG_lEcJ
#export RUBYOPT="-rsyck"

export JAVA_OPTS="-Xms128m -Xmx1024m"
export MAVEN_OPTS="-Xmx768m -XX:MaxPermSize=512m -Dcom.sun.management.jmxremote "

export NVM_DIR="/Volumes/SolidStorage/Users/ets/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [ "$(uname)" == "Darwin" ]; then
  # Support brew AND macport paths??
  export PYTHONPATH=/opt/local/Library/Frameworks/Python.framework/Versions/Current
  if [ ! -e "$PYTHONPATH" ]; then
    export PYTHONPATH=/usr/local
  fi
  export PIP_REQUIRE_VIRTUALENV=true
  export PATH=$RBENV_BIN:$PATH:$HOME/bin:/opt/local/bin:$PYTHONPATH/bin
  # Make use of Virtualenvwrapper
  export WORKON_HOME=~/.virtualenvs
  export VIRTUALENVWRAPPER_PYTHON=$PYTHONPATH/bin/python3
  source /usr/local/bin/virtualenvwrapper.sh
else
  export PATH=$RBENV_BIN:$PATH:$HOME/bin:/opt/local/bin
fi
