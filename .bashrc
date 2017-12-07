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
    if [ -n "$VIRTUAL_ENV" ]; then
      PS1="(`basename \"$VIRTUAL_ENV\"`) $PS1"
    fi
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
export MAVEN_OPTS="-Xmx768m -Dcom.sun.management.jmxremote "
export GOPATH=$HOME/golang
[[ ! -d $GOPATH ]] && mkdir -p $GOPATH; mkdir -p $GOPATH/src/github.com/$USER
export GOROOT=/usr/local/opt/go/libexec

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH=$HOME/bin:/usr/local/bin:$PATH:$RBENV_BIN:$GOPATH/bin:$GOROOT/bin

export PIP_REQUIRE_VIRTUALENV=true
# for python 3 we now use "python3 -m venv yourenv" to setup pip sandbox instead of virtualenv <https://docs.python.org/3/library/venv.html>

