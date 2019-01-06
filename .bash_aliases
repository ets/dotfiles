alias v="vim"
alias ll='ls -Al'                              # long list
alias la='ls -Altr'                              # all but . and ..
alias l='ls -CF'
alias ls='ls -hFG'                 # classify files in colour
alias ..='cd ../'
alias grep='grep --color'                     # show differences in colour

# Host access
alias fgaws='ssh foldergrid.com'

# VM
alias docker_kill='docker kill $(docker ps -q)'
alias docker_clean_images='docker rmi $(docker images -a --filter=dangling=true -q)'
alias docker_clean_ps='docker rm $(docker ps --filter=status=exited --filter=status=created -q)'
alias docker_clean_all_images='docker rmi $(docker images -a -q)'

# DEV
alias mvn-debug='export MAVEN_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=y"'
alias mysqlstart='/usr/local/opt/mysql@5.6/bin/mysql.server start'
alias mysqlstop='/usr/local/opt/mysql@5.6/bin/mysql.server stop'
alias checkjs="find . -name '*.js' -exec ~/bin/checkForJsErrors.sh {} \;"

# force tmux to use the $TERM env var
# which is set in .bashrc
alias tmux="tmux -2"


# FUNCTIONS

# Create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}

# browse style cd
function c() {
  while true
  do
    clear
    echo "pwd: $PWD"
    ls -ACFG
    read -e -p "cd into > " answer
    case "$answer" in
      q) break;;
      *) cd $answer;;
    esac
  done
}
function settitle() { echo -ne "\e]2;$@\a\e]1;$@\a"; }

alias java_ls='/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d[,_]" | cut -d , -f 1 | colrm 1 4 | grep -v Home'
function java_use() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
        export PATH=$JAVA_HOME/bin:$PATH
	    java -version
}
