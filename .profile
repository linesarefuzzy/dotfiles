alias eup="curl http://fuzzylines.com/developer5415/env_update.sh | bash"

alias ls="ls -F --color=tty"
alias ll="ls -lh"
alias la="ls -A"
alias lla="ls -lhA"
alias lld="ls -lhd"
alias psgrep="ps ax | grep"
alias vp="vi ~/.profile"
alias sp="source ~/.profile"
alias cp="cp -i" # confirm overwrites
alias mv="mv -i" # ditto
alias dnsflush="dscacheutil -flushcache"
alias be="bundle exec"
alias zed="zedrem -key E9BB9D9884B747BD8F988EABDDE89895"
alias sdr="screen -d -r"

# command prompt
#export PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\u@\h \[$(tput setaf 4)\]\w \\$ \[$(tput setaf 7)\]\[$(tput sgr0)\]"
export PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\u@\h \w \\$ \[$(tput setaf 7)\]\[$(tput sgr0)\]"

# command history: ignore duplicates
export HISTIGNORE="&"

# share history between open terminal windows
# shopt -s histappend                      # append to history, don't overwrite it
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# ls colors
# http://www.macosxhints.com/article.php?story=20031025162727485
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
#export LSCOLORS=ExFxCxDxBxegedabagacxx

export PATH=~/bin:$PATH:/sbin
export EDITOR=vim

# run dropbox if not in screen and dropbox is not already running
# if [[ -z "$STY" && ! `pgrep dropbox` ]]; then
#   ~/.dropbox-dist/dropboxd &
# fi

# resume screen on login
# [ -z "$STY" ] && screen -r