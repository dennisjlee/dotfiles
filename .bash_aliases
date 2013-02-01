# .aliases

# User specific aliases and functions

# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

if [ -f /etc/bash_aliases ]; then 
    . /etc/bash_aliases
fi

(uname | grep Darwin >/dev/null) && IS_MAC=true || IS_MAC=false

alias c=clear
alias x=exit
alias vv="vim ~/.vimrc"

alias log='git log'
alias pull='git pull'
alias show='git show'

alias bn='(cd buildn; ninja Spotify)'

alias ssh="ssh -AXY"
alias sshin="ssh icenine@icenine2"
alias ssha="ssh appstore-admin.spotify.net"
alias sshj="ssh jill.int.sto.spotify.net"
alias sshh="ssh hunter.int.sto.spotify.net"
alias sshu="ssh ursula.int.sto.spotify.net"
alias sshr="ssh rabi.ash.spotify.net"
alias sshn="ssh socialgraph.neville.ash.d.spotify.net"
#alias sshn="ssh social.neville.ash.d.spotify.net"
alias sshs="ssh screen.d.spotify.net"
alias sshp="ssh play.djlee.ash.d.spotify.net"
alias sshdev="ssh ash1-devadmin-a1.ash.spotify.net"

alias val="vim ~/.bash_aliases"
alias sal="source ~/.bash_aliases"
alias vb="vim ~/.bashrc"
alias sb="source ~/.bashrc"

alias sml='ledit -h .sml-history -x /usr/bin/sml'
#alias irb='ledit -h .irb-history -x /usr/bin/irb --noreadline'

if $IS_MAC; then
    alias ls='ls -G'
else
    alias ls='ls --color'
fi
alias ll='ls -lh'
alias la='ls -A'

alias ducks='find . -maxdepth 1 -mindepth 1 -print0 | xargs -0i du -ks {} | sort -rn | head -n 20 | cut -f 2 | zero | xargs -0i du -hs {}'

alias reset_binaries="rm -rf apps/bundles/desktop/built-in/ && git checkout -- apps/bundles/desktop/built-in && python binaries.py update"

unset IS_MAC

alias dotgit="GIT_DIR=$HOME/dotfiles.git GIT_WORK_TREE=$HOME git"
