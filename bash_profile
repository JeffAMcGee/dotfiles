
PATH="${HOME}/bin:${PATH}:/usr/local/sbin:/usr/sbin:/sbin"
PATH="/usr/local/bin:${PATH}"
PATH=`echo ~/mongo*/bin`":${PATH}" #This is ugly and fragile
export PATH

export MANPATH="/opt/local/share/man:${MANPATH}"
unset ROOTPATH
export EDITOR=/usr/bin/vim
export VISUAL="mvim -f"
export LESS="-R"
export CLICOLOR_FORCE=1

#when you create new aliases, remember huffman coding:
#sort ../.zsh_history |uniq -c -W 1|sort -n
alias s='sudo'
alias se='sudoedit'
alias st='sudo tee'
alias ssh='ssh -2'
alias ign='cat>/dev/null'
alias -- ..='cd ..'
alias -- ...='cd ../..'
alias -- ....='cd ../../..'
alias -- .....='cd ../../../..'
alias lsd='l -d */'
alias md='mkdir -p'
alias mv='mv'
alias mloc='mdfind -name'
alias o='less -r'
alias pa='ps -Af'
alias pag='ps -Af|grep '
alias paf='ps -Af --forest '
alias aph='ack --python --html'
alias ap='ack --python'
alias ah='ack --html'
alias q='exit'
alias rd='rmdir'
alias v='mvim -o'
alias g='grep'
alias vmd='vimdiff'
alias cz='suspend -f'
alias df='df -h'
alias free='free -m'
alias dums='du -ms *'
alias wg="wget"

case `uname` in
  Darwin)
    alias l='ls -alFG'
    PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
    export PATH
    ;;
  Linux)
    alias l='ls -alF --color=always'
    ;;
esac

# python virtualenvwrapper
# http://www.doughellmann.com/docs/virtualenvwrapper/
vw=`which virtualenvwrapper.sh 2>/dev/null`
if [[ -n "$vw" ]] ; then
    export PIP_RESPECT_VIRTUALENV=true
    export WORKON_HOME=$HOME/virtualenv
    source "$vw"
    export PIP_VIRTUALENV_BASE=$WORKON_HOME
fi
alias mve="mkvirtualenv --no-site-packages"

