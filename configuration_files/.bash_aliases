# BASH SHORTCUT
alias j='jobs'
alias rmtd='rm -f *.*~ *.*# #*#'
alias mkdir='mkdir -pv'
alias c='clear'

# DEV ALIASES
alias plantuml='java -jar ~/bin/plantuml.jar -gui &'
alias e='emacs -nw'

alias_help()
{
  f=~/.bashrc
  my_aliases=$(egrep '^\s*alias\s+.+=' ${f}|sed -r 's/\s*alias\s+(.+)=\".+\"(\s*#\s*(.+))?/\1: \3;/')
  echo $my_aliases|tr ';' '\n'
}
