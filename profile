export DOTFILES="$HOME/dotfiles"
export TZ="America/New_York"

# Update environment
alias eup="cd $DOTFILES && git pull origin master && cd - && source ~/.profile && vim +PluginUpdate +qall"

#alias ls="ls -F --color=auto"
#alias ls="ls -FG"
alias ll="ls -lh"
alias la="ls -A"
alias lla="ls -lhA"
alias lld="ls -lhd"
alias llt="ls -lht" # sort by modified date
alias psgrep="ps ax | grep"
alias vp="vi ~/.profile"
alias sp="source ~/.profile"
alias vd="cd $DOTFILES && vi"
alias vl="cd $DOTFILES && vi local.sh && cd -"
alias cp="cp -i" # confirm overwrites
alias mv="mv -i" # ditto
alias dnsflush="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
#alias be="bundle exec"
alias sdr="screen -dR"
alias less="less -i"

alias autojump_install="mkdir -p ~/bin && cd ~/bin && git clone git://github.com/joelthelion/autojump.git && cd autojump && ./install.py"

# git
alias g="git status"
alias gl="git pull"
alias gh="git push"
alias gst="git stash"
alias gstl="git stash list"
alias gmn="git merge --no-ff"
alias gpt="git push && git push --tags"
alias gtl="git tag -l --sort=v:refname"
alias gta='git tag -m "" -a'

# rails
alias rdb='rails dbconsole'
alias rdm='rake db:migrate'
alias rdms='rake db:migrate:status'
alias rdmtc='rake db:migrate db:test:clone'
alias rdr='rake db:rollback'
alias rdrs='rake db:reset'
alias rdtc='rake db:test:clone'
alias rdtp='rake db:test:prepare'
alias rgm='rails generate migration'
alias rr='rake routes'
alias rrg='rake routes | grep'

# command history: ignore duplicates
export HISTIGNORE="&"

export PATH=~/bin:$PATH:/sbin
export EDITOR=vim

# run dropbox if not in screen and dropbox is not already running
# if [[ -z "$STY" && ! `pgrep dropbox` ]]; then
#   ~/.dropbox-dist/dropboxd &
# fi

# resume screen on login
# [ -z "$STY" ] && screen -r

# Activate autojump if installed
[ -s $HOME/.autojump/etc/profile.d/autojump.sh ] && source $HOME/.autojump/etc/profile.d/autojump.sh

# Local overrides in ~/dotfiles/local.sh
[ -f $DOTFILES/local.sh ] && . $DOTFILES/local.sh
