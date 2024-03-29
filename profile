# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022
echo 'sourced $HOME/.profile'

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Load RVM (Ruby Version Manager) into a shell session *as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"




# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cgn/google-cloud-sdk/path.bash.inc' ]; then . '/Users/cgn/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cgn/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/cgn/google-cloud-sdk/completion.bash.inc'; fi

# Make vim support more than 8 colors
export TERM=xterm-256color

alias stopgpu='gcloud --project cgn-research compute instances stop gpu'
alias startgpu='gcloud --project cgn-research compute instances start gpu'
alias gpu='gcloud compute --project "cgn-research" ssh --zone "us-east1-c" "gpu"'
alias gpunotebook='gcloud compute --project "cgn-research" ssh --zone "us-east1-c" "gpu" -- -N -p 22 -D localhost:8896 &'
alias gpulab='gcloud compute --project "cgn-research" ssh --zone "us-east1-c" "gpu" -- -N -p 22 -D localhost:8896 &'
alias sublime="open -a 'Sublime Text'"
alias iqss="ssh -t -A -L 8891:localhost:8891 cnorthcutt@rce6.hmdc.harvard.edu ssh -A -L 8891:localhost:8891 cnorthcutt@edx-1.priv.hmdc.harvard.edu"
alias rce="ssh -t -A -L 8895:localhost:8891 cnorthcutt@rce6-2.hmdc.harvard.edu"
alias lab="jupyter lab &"
alias simpletex='function _mylatex(){ end=".tex"; pdflatex $1$end; open $1".pdf"; };_mylatex'
alias tex='function _mybibtex(){ end=".tex"; pdflatex $1$end; bibtex $1; pdflatex $1$end; pdflatex $1$end; open $1".pdf"; };_mybibtex'
alias c="pbcopy"
alias fasttext='/Users/cgn/bin/fastText/fasttext'

alias yoderlab="ssh -N -f -L localhost:8890:localhost:8890 cgn@18.62.28.184"
alias murphylab="ssh -N -f -L localhost:8890:localhost:8890 cgn@18.62.27.76"
alias glab="ssh -N -f -L localhost:8890:localhost:8890 cgn@rle-eecs-mtl-dhcp-21-159.mit.edu"

alias restartDropBox="osascript -e 'tell application \"Dropbox\" to quit';killall Dropbox;open -a \"Dropbox\""
alias dropbox='python3 $HOME/.dropbox/dropbox.py'

alias dgx="ssh -t cgn@prn-shell02 -t ssh cgn@sea104-dgx111"
alias sublime="subl"
alias imac_cluster="osascript $HOME/.scpt/imac_cluster.scpt"

# Add $HOME/bin to path for bazel (used to build tensorflow from source)
export PATH="$PATH:$HOME/bin"
# Fixes access issues since El Capitan
export PATH="$PATH:/usr/bin"

# Makes pytorch gpu number match nvidia-smi number
export CUDA_DEVICE_ORDER=PCI_BUS_ID

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Add cuda to path
export PATH="$PATH:/usr/local/cuda-10.1/bin"

# Make python3 default on all systems
# alias python="python3"



export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"

