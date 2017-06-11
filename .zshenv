#!/usr/bin/env zsh
#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
# _ / /_ ___) |  _  |  _ <| |___ 
#(_)____|____/|_| |_|_| \_\\____|
#
 
# Complétion 
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# Crée un cache des complétion possibles
# très utile pour les complétion qui demandent beaucoup de temps
# comme la recherche d'un paquet aptitude install moz<tab>
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
# des couleurs pour la complétion
# faites un kill -9 <tab><tab> pour voir :)
zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
 
# Correction des commandes
setopt correctall
 
# Un petit prompt sympa
autoload -U promptinit
promptinit
prompt redhat
 
# Les alias marchent comme sous bash
alias ll='ls -lh'
alias lll='ls -lh | less'
alias tn='tmux new-session -s "aLps"'
alias ta='tmux attach'
# marre de se faire corriger par zsh ;)
alias xs='cd'
alias sl='ls'
alias vi='vim'
# mplayer en plein framme buffer ;)
alias mplayerfb='mplayer -vo fbdev -vf scale=1024:768'
# Un grep avec des couleurs :
export GREP_COLOR=31
alias grep='grep --color=auto'
alias xte='nohup xterm &' # xte lancera un xterm qui ne se fermera pas si on ferme le terminal
# Pareil pour les variables d'environement :
#export http_proxy="http://hostname:8080/"
#export HTTP_PROXY=$http_proxy
# un VRAI éditeur de texte ;)
export EDITOR=/usr/bin/vim

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

bindkey '^R' history-incremental-search-backward

# Use vi as the default editor
export EDITOR=vim

# But still use emacs-style zsh bindings
bindkey -e
#bindkey "^[[H" beginning-of-line
#bindkey "^[[F" end-of-line
#bindkey '^[[1;9F' end-of-line
#bindkey '^[[1;9H' beginning-of-line
#bindkey '^[[1;5F' forward-word
#bindkey '^[[1;5H' backward-word
#bindkey '^[[1;9C' forward-word
#bindkey '^[[1;9D' backward-word
#bindkey "^[D" backward-word
#bindkey "^[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line

# Growl function
# growl() { echo -e $'\e]9;'${1}'\007' ; return ; }
# if [[ "$TERM_PROGRAM" == 'iTerm.app' ]]; then
#   function growl() {
#     printf '\e]9;%s\007' ${(V)argv}
#   }
# fi
function precmd(){ echo -n "]0;aLps" }

#source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="/usr/local/sbin:$PATH"
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#[[ "$TERM" == "xterm-256color" ]] && export TERM=xterm-256color
export TERM=xterm-256color
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
