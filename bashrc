# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
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
alias easytex='function _mylatex(){ end=".tex"; pdflatex $1$end; open $1".pdf"; };_mylatex'
alias tex='function _mybibtex(){ end=".tex"; pdflatex $1$end; bibtex $1; pdflatex $1$end; pdflatex $1$end; open $1".pdf"; };_mybibtex'
alias c="pbcopy"
alias fasttext='/Users/cgn/bin/fastText/fasttext'

alias yoderlab="ssh -N -f -L localhost:8890:localhost:8890 cgn@18.62.28.184"
alias murphylab="ssh -N -f -L localhost:8890:localhost:8890 cgn@18.62.27.76"
alias glab="ssh -N -f -L localhost:8890:localhost:8890 cgn@rle-eecs-mtl-dhcp-21-159.mit.edu"

alias restartDropBox="osascript -e 'tell application \"Dropbox\" to quit';killall Dropbox;open -a \"Dropbox\""
alias dropbox='python3 $HOME/.dropbox/dropbox.py'

alias dgx="ssh -t cgn@prn-shell02 -t ssh cgn@sea104-dgx111"
# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/cgn/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    \eval "$__conda_setup"
#else
#    if [ -f "/home/cgn/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/cgn/miniconda3/etc/profile.d/conda.sh"
#        CONDA_CHANGEPS1=false conda activate base
#    else
#        \export PATH="/home/cgn/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda init <<<

# For making python3 default on all systems
alias python=python3
