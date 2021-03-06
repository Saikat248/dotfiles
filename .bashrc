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
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
    PS1="\[\e[01;32m\][\[\e[m\]\[\e[01;31m\]\u\[\e[m\]\[\e[01;33m\]@\[\e[m\]\[\e[01;32m\]\h\[\e[m\]:\[\e[1;36m\]]\w\[\e[m\]\\$ "
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



alias op23aa3='ssh op23aa3 -X'
alias op23aa4='ssh op23aa4 -X'
alias op23aa2='ssh op23aa2 -X'
alias op23aa1='ssh op23aa1 -X'
alias op20aa1='ssh op20aa1 -X'
alias kangsavati='ssh kangsavati -X'
alias tamilnadu='ssh tamilnadu -X'
alias yogesh-kangsavati='ssh yogesh@kangsavati -X'
alias anoop-kangsavati='ssh anoop@kangsavati -X'
alias souvik-kangsavati='ssh souvikr@kangsavati -X'
alias paramshakti='ssh -p 4422 17cy91r04@paramshakti.iitkgp.ac.in -X'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/saikat/software/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/saikat/software/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/saikat/software/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/saikat/software/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH=/home/saikat/software/orca_4_2_0_linux_x86-64_openmpi216:$PATH
export LD_LIBRARY_PATH=/home/saikat/software/openmpi/lib:$LD_LIBRARY_PATH
export PATH=/home/saikat/software/openmpi/bin:$PATH


export EDITOR=nvim
export PATH=/home/saikat/software:$PATH
export PATH=/home/saikat/software/molden:$PATH
alias molden="setsid molden &>/dev/null"
alias kmol="killall molden"

g16root=/home/saikat/software
export g16root
source $g16root/g16/bsd/g16.profile

export PARA_ARCH=SMP
#export PARA_ARCH=MPI
export PARNODES=6
export MPIRUN_OPTIONS=-TCP


export TURBODIR=/home/saikat/software/turbomole730
export PATH=$TURBODIR/scripts/:$PATH
export PATH=$TURBODIR/bin/`sysname`:$PATH
source $TURBODIR/Config_turbo_env


export KMP_STACKSIZE=200000000
export Multiwfnpath=/home/saikat/software/Multiwfn_3.6_bin_Linux
export PATH=$PATH:/home/saikat/software/Multiwfn_3.6_bin_Linux


#XTBHOME=/home/saikat/software/xtb_6.2.3
#XTBPATH=${XTBHOME}:${HOME}
#MANPATH=${MANPATH}:${XTBHOME}/man
#PATH=${PATH}:${XTBHOME}/bin:${XTBHOME}/scripts
#export PATH XTBPATH MANPATH

XTBHOME=/home/saikat/software/xtb-6.3.2
XTBPATH=${XTBHOME}:${HOME}
MANPATH=${MANPATH}:${XTBHOME}/man
PATH=${PATH}:${XTBHOME}/bin:${XTBHOME}/scripts
export PATH XTBPATH MANPATH

#XTBHOME=/home/saikat/software/xtb6.3/xtb-6.3.0
#XTBPATH=${XTBHOME}/share/xtb:${HOME}
#MANPATH=${MANPATH}:${XTBHOME}/share/man
#PATH=${PATH}:${XTBHOME}/bin
#export PATH XTBPATH MANPATH PKG_CONFIG_PATH



export PATH=/home/saikat/software/VESTA-x86_64:$PATH
export PATH=/home/saikat/software/Mercury/bin:$PATH

export PYTHONPATH=/home/saikat/pyar/:$PYTHONPATH
export PATH=$HOME/software/nvim:$PATH
export PATH=/home/saikat/software/openbabel-2.4.1/build/bin:$PATH


## For I3-wm
alias s=/usr/bin/swallow
alias r=/usr/local/bin/ranger

#alias m="swallow molden"
#alias eog="swallow eog"
#alias evince="swallow evince"
#alias celluloid="swallow celluloid"
#alias shutdown="sudo shutdown -h now"
alias v="nvim"

## Powerline setup for terminal

#function _update_ps1() {
#    PS1=$(powerline-shell $?)
#}

#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi

##
#neofetch
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

export PS1="\[\e[01;32m\][\[\e[m\]\[\e[01;31m\]\u\[\e[m\]\[\e[01;33m\]@\[\e[m\]\[\e[01;32m\]\h\[\e[m\]:\[\e[1;36m\]]\w\[\e[m\] \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "


### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../..'
alias .5='cd ../../../..'
alias .6='cd ../../../../..'


# adding flags
#alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h' # human-readable sizes
alias du='du -h'
alias free='free -h'

alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias config='/usr/bin/git --git-dir=/home/saikat/dotfiles/ --work-tree=/home/saikat'
source $HOME/.cargo/env


