#source /etc/zsh/zshrc
autoload colors; colors

if [[ "${LOGNAME}" == "jeff" ]]
then
    export PS1=$'\n'"%{$fg[red]%}%m%{$reset_color%}:%{$fg[green]%}%~%{$reset_color%}"$'\n>'
else
    export PS1=$'\n'"%{$fg[blue]%}%n@%m%{$reset_color%}:%{$fg[green]%}%~%{$reset_color%}"$'\n>'
fi

PATH="${HOME}/.bin:${PATH}:/usr/local/sbin:/usr/sbin:/sbin"
PATH="${HOME}/mymongo/bin:/usr/local/bin:${PATH}"
PATH="${HOME}/myphantomjs/bin:${PATH}"
PATH="${HOME}/.go/bin:${PATH}"
PATH="/usr/local/share/npm/bin:${PATH}"
export PATH

export MANPATH="/opt/local/share/man:${MANPATH}"
unset ROOTPATH
export EDITOR=/usr/bin/vim
export HISTFILE=~/.hist
export SAVEHIST=5000
export HISTSIZE=5000
export CDPATH=".:/Users/jeff/:/"
export CLASSPATH="."
export CVS_RSH=ssh
export LESS="-R"
export CLICOLOR_FORCE=1
#export JYTHON_HOME=/Users/jeff/jython
export GOPATH=~/hp/invert

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
alias tmux='tmux -2 attach'
alias bws="brunch w -s"

alias ap='ack --python'
alias ah='ack --html'
alias aph='ack --python --html'

alias gpum='git pull upstream master'
alias gprum='git pull --rebase upstream master'
alias gprom='git pull --rebase origin master'
alias gpo='git push origin'
alias gco='git checkout'
alias gcam='git commit -am'
alias gitmv='nocorrect git mv'
alias gcaa='git commit -a --amend'

alias pt="pdflatex -output-directory=out tamuthesis.tex"
alias pj='python -mjson.tool'
alias ns='nosetests -s'
alias nt='nosetests'
alias rd='rmdir'
alias mmv="noglob mmv"
alias df='df -h'
alias free='free -m'
alias dums='du -ms *'
alias wg="wget"
alias wos="cd ~/shopbot; workon shopbot"
alias wof="cd ~/friendloc; workon friendloc"
alias gorun="go run *.go~*_test.go"

case `uname` in
  Darwin)
    alias l='ls -alFG'
    PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
    export PATH
    export VISUAL="mvim -f"
    export JAVA_HOME=$(/usr/libexec/java_home)
    # make matplotlib cooperate
    #export CFLAGS="-I/usr/X11/include -I/usr/X11/include/freetype2 -I/usr/X11/include/libpng12"
    #export LDFLAGS="-L/usr/X11/lib"
    alias v='mvim -o'
    export CGO_CFLAGS="-I/usr/local/include"
    export CGO_LDFLAGS="-L/usr/local/lib"
    ;;
  Linux)
    alias l='ls -alF --color=always'
    export VISUAL="vim -f"
    alias v='vim -o'
    ;;
esac

if [ -x /usr/local/bin/fortune ] ; then
	echo
	/usr/local/bin/fortune
	echo
fi

source `which virtualenvwrapper.sh`

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
