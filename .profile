source ~/.bashrc

export PATH=$HOME/bin:/usr/local/bin:/usr/local/share/python:$PATH

export LSCOLORS=Exfxcxdxbxegedabagacad

export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
