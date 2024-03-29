# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="custom_frisk"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-autosuggestions
    vi-mode
    zsh-syntax-highlighting
    colored-man-pages
    zsh-navigation-tools
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###########################################
#                SETTINGS                 #
###########################################

# Export HOSTNAME variable (compatibility with bash)
export HOSTNAME=$(hostname)

# Do an ls after cp
function cd {
        builtin cd "$@" && ls
}

# Compress file
function comp {
    echo "Trying to compress $1"
    tar -czvf "$1".tar.gz "$1"
}

# Alias to youtube-dl (to best audio, use --audio-quality 0)
alias youtube="youtube-dl --extract-audio --audio-format mp3"
# Alias git commands
alias gp="git pull --prune --recurse-submodules"
alias gc="git commit"
alias ga="git add"
alias gb="git branch"
alias gs="git status"
alias gl="git log"
alias goc="git checkout"
alias gd="git diff"
# Cluster MPI
alias cluster="/home/santiago/git/hiwi_scripts/vmc-old/irm4"
# Cling-tidy fix for ZSH. See: 
# https://stackoverflow.com/questions/62266965/clang-tidy-resolving-no-match-error-when-adding-arguments
alias clang-tidy='noglob clang-tidy'

# Use VIM mode
bindkey -v

# Use to solve some problems with tilix (a.k.a terminix). We might
# have to create the symbolic link pointing to vte-x.xx.sh inside
# /etc/profile.d
# source /etc/profile.d/vte.sh

# Env. variables
export PATH=~/.scripts:$PATH
export LIKWID_LIB=/usr/local/lib
export LIKWID_INCLUDE=/usr/local/include
export GTAGSLABEL=pygments
export PATH=$PATH:/usr/local/go/bin

CONDA_PATH=
# Select options for laptop and work
if [[ $(hostname) == *"atsccs"* ]]; then
  CONDA_PATH=$HOME/.anaconda3
  export PATH=/home/ga85pun/git/Programs/aspectc++:$PATH
  export PATH=/home/ga85pun/git/Programs/cmake-3.22.3-linux-x86_64/bin:$PATH

  # TeX Live
  export PATH=/work/ga85pun/texlive/2021/bin/x86_64-linux:$PATH
  export MANPATH=/work/ga85pun/texlive/2021/texmf-dist/doc/man:$MANPATH
  export INFOPATH=/work/ga85pun/texlive/2021/texmf-dist/doc/info:$INFOPATH

  # Build irtss
  export IRTSS_PATH=/work_fast/ga85pun/git/irtss
else
  export PATH=/home/santiago/.Programs/aspectc++:$PATH
  export IRTSS_PATH=/home/santiago/git/irtss
  CONDA_PATH=$HOME/.miniconda3
fi

alias birtss="$IRTSS_PATH/tools/bin/build4platform.pl $IRTSS_PATH/platform/release.x86guest.generic-debug.pm"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$($CONDA_PATH'/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$CONDA_PATH/etc/profile.d/conda.sh" ]; then
        . "$CONDA_PATH/etc/profile.d/conda.sh"
    else
        export PATH="$CONDA_PATH/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

