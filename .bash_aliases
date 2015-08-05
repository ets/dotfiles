alias v="vim"
alias ll='ls -Al'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'
alias ls='ls -hFG'                 # classify files in colour
alias ..='cd ../'
alias grep='grep --color'                     # show differences in colour

# Host access
alias atweb='ssh 172.16.34.5'
alias fgdb2='ssh grid02admin@162.218.139.223'
alias fgdb='ssh grid02admin@198.90.21.14'
alias fgaws='ssh ftp.foldergrid.com'
alias fgaws2='ssh 54.173.122.112'
alias ap='ssh ets@catprep.com'
alias bh='ssh lsatexam@lsat-exams.com'

# VM
alias startdocker='boot2docker start; $(boot2docker shellinit)'
alias stopdocker='boot2docker stop'
alias killdocker='docker stop $(docker ps -a -q); docker rm $(docker ps -a -q);'

# DEV
alias mvn-debug='export MAVEN_OPTS="-Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=y"'

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
