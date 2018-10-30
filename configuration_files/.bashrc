# To be included by $HOME/.bashrc
# if [ -f ~/.bash_juliette ]; then
#    . ~/.bash_juliette
# fi

# DEV

# Git diff
export PATH="$PATH:$HOME/.git/diff-so-fancy:$HOME/.git/diff-highlight"

# Display git and rvm in prompt
find_gemset() {
  rvm_gemset=$(rvm-prompt g 2> /dev/null)
}
PROMPT_COMMAND="find_gemset; $PROMPT_COMMAND"

# sources : https://github.com/jimeh/git-aware-prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\[$txtylw\]\$(ruby -v | cut -f2 -d' ' | cut -f1 -d'p')\[$txtylw\]\$rvm_gemset\[$txtpur\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\u:\w$ "

# SYSTEM UTILITIES

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

# Handy Extract Program for lazy persons like me
function extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# Get IP address on ethernet.
function my_ip()
{
    MY_IP=$(/sbin/ifconfig eth0 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}
