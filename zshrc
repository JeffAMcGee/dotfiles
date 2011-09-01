#source /etc/zsh/zshrc

export PS1=$'\n%{\e[31m%}%n:%{\e[01;32m%}%~%{\e[00m%}\n>'
PATH="${HOME}/.bin:${PATH}:/usr/local/sbin:/usr/sbin:/sbin"
PATH="/usr/local/bin:${PATH}"
PATH=`echo ~/mongo*/bin`":${PATH}" #This is ugly and fragile
export PATH

export MANPATH="/opt/local/share/man:${MANPATH}"
unset ROOTPATH
export EDITOR=/usr/bin/vim
export VISUAL="mvim -f"
export HISTFILE=~/.hist 
export SAVEHIST=5000
export HISTSIZE=5000
export CDPATH=".:/Users/jeff/:/"
export CLASSPATH="."
export CVS_RSH=ssh
export LESS="-R"
export CLICOLOR_FORCE=1
export JYTHON_HOME=/Users/jeff/jython
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

setopt correctall
setopt share_history
setopt hist_ignore_dups
setopt HIST_EXPIRE_DUPS_FIRST
setopt no_hist_beep
setopt no_beep
setopt dvorak
setopt autocd
setopt brace_ccl
setopt auto_pushd
setopt auto_resume
setopt brace_ccl
setopt extended_glob
setopt long_list_jobs
setopt hist_find_no_dups
setopt hist_verify
setopt list_packed
setopt notify
setopt appendhistory


bindkey -M vicmd "^R" redo
bindkey -M vicmd "u" undo
bindkey -M vicmd "d" vi-backward-char
bindkey -M vicmd "h" down-line-or-history
bindkey -M vicmd "t" up-line-or-history
bindkey -M vicmd "n" vi-forward-char
bindkey -M vicmd "l" vi-repeat-search
bindkey -M vicmd "k" vi-delete

bindkey -M viins "^[OH" beginning-of-line
bindkey -M viins "^[OH" beginning-of-line
bindkey -M viins "^[OF" end-of-line
bindkey -M viins "^[h" run-help
bindkey -M viins "^S" spell-word
bindkey -M viins "^X" transpose-words
bindkey -M viins "^N" history-incremental-search-backward
bindkey -M viins "^S" history-incremental-search-forward
bindkey -v


#when you create new aliases, remember huffman coding:
#sort ../.zsh_history |uniq -c -W 1|sort -n

alias q="exit"
alias s='sudo'
alias se='sudoedit'
alias st='sudo tee'
alias sk="sudo -H -u kde"
alias ssh='ssh -2'
alias ign='cat>/dev/null'
alias -- +='pushd .'
alias -- -='popd'
alias -- gwd='cd "`/bin/pwd`"'
alias -- ...='cd ../..'
alias -- ....='cd ../../..'
alias -- .....='cd ../../../..'
alias lsd='l -d */'
alias md='nocorrect mkdir -p'
alias mv='nocorrect mv'
alias mloc='mdfind -name'
alias o='less -r'
alias pa='ps -Af'
alias pag='ps -Af|grep '
alias paf='ps -Af --forest '
alias ap='ack --python'
alias ah='ack --html'
alias aph='ack --python --html'
alias gpum='git pull upstream master'
alias gprum='git pull --rebase upstream master'
alias gpo='git push origin'
alias rd='rmdir'
alias v='mvim -o'
alias ipy='ipython2.6'
alias g='grep'
alias vmd='vimdiff'
alias cz='suspend -f'
alias c6='chmod 600'
alias c7='chmod 700'
alias c4='chmod 644'
alias c5='chmod 755'
alias m='man'
alias mmv="noglob mmv"
alias mm2nd='mmv '\''*/*/*'\'' '\''#1/#3'\'
alias df='df -h'
alias free='free -m'
alias dums='du -ms *'
alias anull='tr \\0 \\n'
alias wg="wget"
alias mnt="mount |column -t"

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

if [ -x /usr/games/fortune ] ; then
	echo
	/usr/games/fortune
	echo
fi

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

#setterm -blength 0

chpwd() {
	[[ -t 1 ]] || return
	case $TERM in
		sun-cmd) print -Pn "\e]l%~\e\\"
			;;
		*xterm*|rxvt|(dt|k|E)term|konsole) print -Pn "\e]2;%~\a"
			;;
	esac
}

autoload -Uz compinit
compinit

if [ -f $HOME/.pullr.sh ] ; then
    source $HOME/.pullr.sh
fi

if [ -f $HOME/.shrc_secret ] ; then
    source $HOME/.shrc_secret
fi

