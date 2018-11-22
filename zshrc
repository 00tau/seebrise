#file: ~/.zshrc
#author: Thomas W. D. Moebius (00tau@suud.de)
#year: 2011,2012,2013,2014,2016
#
# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2 eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#  # Completion
# autoload -Uz compinit && compinit
#  zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
#  zstyle ':completion:*' completions 1
#  zstyle ':completion:*' glob 1
#  zstyle ':completion:*' list-colors ''
#  zstyle ':completion:*' max-errors 2 numeric
#  zstyle ':completion:*' prompt '%e'
#  zstyle ':completion:*' substitute 1
#
#  # Completing process IDs with menu selection:
#  zstyle ':completion:*:*:kill:*' menu yes select
#  zstyle ':completion:*:kill:*'   force-list always
#
#  # directory as argument, this will remove the trailing slash (usefull in ln)
#  zstyle ':completion:*' squeeze-slashes true

# cd will never select the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

autoload -U colors && colors

setopt menu_complete

# Settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
#setopt appendhistory histignorealldups sharehistory
setopt INC_APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_ALL_DUPS \
    HIST_SAVE_NO_DUPS HIST_REDUCE_BLANKS HIST_IGNORE_SPACE \
    NO_HIST_BEEP
setopt autocd nomatch
unsetopt beep notify

# Setting the promt to the most simple
autoload -U promptinit
promptinit
prompt off

# Following: Zsh Gem #1 at refining-linux.org
autoload -U zmv
alias mmv='noglob zmv -W'

# Following: Zsh Gem #2 at refining-linux.org
setopt extendedglob

# Following: Zsh Gem #4 at refining-linux.org
setopt correct
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r?$reset_color (Yes, No, Abort, Edit) "

# Aliases
alias eu="ls -h --time-style=iso --color=auto --group-directories-first "
alias e="eu -l "
alias ey="eu -la "
alias hc="herbstclient "
alias ch="herbstclient spawn "
alias tmux="tmux -2 "
alias R="R --no-save -q "
alias p="ipython --colors=Linux --pylab='auto' "
alias running="htop -u $(whoami)"
alias nemo="nemo --no-desktop "
alias pan="pandoc -s --toc -S -V papersize:"a4paper" -V geometry:margin=2.5cm "

alias balin="ssh balin"

# Aliases
alias kalender="surf posteo.de"
alias wunderlist="surf -u chromium wunderlist.com"

# Suffix Aliases
alias -s pdf=mupdf
alias -s png=sxiv
alias -s jpg=sxiv
alias -s JPG=sxiv
alias -s jpeg=sxiv
alias -s JPEG=sxiv
alias -s tex=op
alias -s md=vimpager
alias -s html=luakit
alias -s org=luakit
alias -s com=luakit
alias -s de=luakit
alias -s plink='p-link --noweb --script'
alias -s ine=lrs
alias -s csv=gnumeric --no-splash
alias -s dat=gnumeric --no-splash
alias -s nii=fslview

# Uncompress files with Do The Right eXtraction
alias -s tar=dtrx
alias -s tar.gz=dtrx
alias -s zip=dtrx
alias -s 7z=dtrx

# Keybindings
bindkey -v
bindkey "^T" vi-cmd-mode
#bindkey "up" history-search-backward
#bindkey "down" history-search-forward
#bindkey '\e[A' history-search-backward
#bindkey '\e[B' history-search-forward

# ENVIRONMENT VARIABLES
export EDITOR=/usr/bin/vim
export PATH=~/.config/herbstluftwm:~/.config/seebrise:$PATH
#export PAGER=/usr/local/bin/vimpager

# Software and their ENVIRONMENT VARIABLES

# R
export R_LIBS_USER=/home/moebius/software/R

# FSL
source /usr/share/fsl/5.0/etc/fslconf/fsl.sh

alias flirt="fsl5.0-flirt "
alias fnirt="fsl5.0-fnirt "
alias img2imgcoord="fsl5.0-img2imgcoord "
alias std2imgcoord="fsl5.0-std2imgcoord "
alias fnirtfileutils="fsl5.0-fnirtfileutils "

# ANTs
export ANTSPATH=/home/moebius/software/ants/antsbin/bin/
export PATH=/home/moebius/software/ants/antsbin/bin:/home/moebius/software/ants/ANTs/Scripts:$PATH

# Freesurfer
export FREESURFER=/home/moebius/software/freesurfer/freesurfer
export FREESURFER_HOME=/home/moebius/software/freesurfer/freesurfer
export FSFAST_HOME=$FREESURFER/fsfast
export FSF_OUTPUT_FORMAT=nii
export SUBJECTS_DIR=$FREESURFER/subjects
export MNI_DIR=$FREESURFER/mni
alias freesource=$FREESURFER/SetUpFreeSurfer.sh

# Source python environment
alias pythonenvironment="source /home/moebius/software/python-environments/aghaba/bin/activate"
pythonenvironment

# Display current working directory at the bottom of Tmux
precmd () {
    tmux set -qg status-right "[#D|#P|#T|$(pwd)] "
}
