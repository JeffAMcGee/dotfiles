#source /etc/zsh/zshrc

export PS1=$'\n%{\e[31m%}%n:%{\e[01;32m%}%~%{\e[00m%}\n>'
export PATH="/opt/subversion/bin:/Users/jeff/.maven-2.2.1/bin:/Users/jeff/bin:/Applications/MAMP/Library/bin:/opt/subversion/bin:/opt/local/bin:/opt/local/sbin:${PATH}:/usr/local/mysql/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
export MANPATH="/opt/local/share/man:${MANPATH}"
export PYTHONPATH="/usr/local/lib/python2.6/site-packages/:${PYTHONPATH}"
unset ROOTPATH
export EDITOR=/usr/bin/vim
export VISUAL="/Users/jeff/bin/mvim -f"
export HISTFILE=~/.hist 
export SAVEHIST=5000
export HISTSIZE=5000
export CDPATH=".:/Users/jeff/:/"
export CLASSPATH="."
export CVS_RSH=ssh
export LESS="-R"
export CLICOLOR_FORCE=1
export JYTHON_HOME=/Users/jeff/jython
export HADOOP_HOME=/Users/jeff/hadoop-0.20.2
export HADOOP_CONF=/Users/jeff/hadoop-0.20.2/conf
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
alias sff='sftp nerd4christ@fitz.sourceforge.net'
alias shf='ssh nerd4christ@fitz.sourceforge.net'
alias ign='cat>/dev/null'
alias -- +='pushd .'
alias -- -='popd'
alias -- gwd='cd "`/bin/pwd`"'
alias -- ...='cd ../..'
alias -- ....='cd ../../..'
alias -- .....='cd ../../../..'
alias l='ls -alFG'
alias lsd='l -d */'
alias md='nocorrect mkdir -p'
alias mv='nocorrect mv'
alias mloc='mdfind -name'
alias o='less'
alias pa='ps -Af'
alias pag='ps -Af|grep '
alias paf='ps -Af --forest '
alias q='exit'
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
alias mm..='mmv '\''*/*.jpg'\'' '\''#1_#2.jpg'\'
alias mm...='mmv '\''*/*/*.jpg'\'' '\''#1_#3.jpg'\'
alias mm01001='mmv '\''*/??.jpg'\'' '\''#1/0#2#3.jpg'\'
alias mm101='mmv '\''*/?.jpg'\'' '\''#1/0#2.jpg'\'
alias mm2nd='mmv '\''*/*/*'\'' '\''#1/#3'\'
alias df='df -h'
alias free='free -m'
alias dums='du -ms *'
alias anull='tr \\0 \\n'
alias wg="wget"
alias c="noglob calc"
alias mnt="mount |column -t"

if [ -x /usr/games/fortune ] ; then
	echo
	/usr/games/fortune
	echo
fi

#setterm -blength 0

#c() {
#	print $(($1))
#}

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

