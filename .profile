source ~/.bashrc

export PATH=$HOME/bin:/usr/local/bin:/usr/local/share/python:$PATH

export EDITOR=vim

export LSCOLORS=Exfxcxdxbxegedabagacad

export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
if [ -d ~/.node-completion ] ; then
  for f in ~/.node-completion/*; do
    test -f "$f" && . "$f"
  done
fi
# }}}

cd ~
