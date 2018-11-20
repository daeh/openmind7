# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/daeda/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
  git
  zsh-syntax-highlighting
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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


####################################
### from bashrc
###################################
# Source global definitions
if [ -f /etc/zshrc ]; then
	# . /etc/zshrc
fi

# OM features
module add openmind/gcc/5.3.0 # needed to lauch sbatch jobs
module add slurm

# Setup a fancy shell command prompt:
# project_name="base"
# prompt1="\[\e[0;33m\][\A]\[\e[0m\]" # Display the time in the bash prompt
# prompt2="\[\e[1;39m\]\h:\[\e[0;34m\]\W\[\e[0m\]" # Add host:dir$
# PROMPT_COMMAND='PS1="\[\e[1;37m\e[44m\]${project_name}\[\e[0;0m\]${prompt1}${prompt2}🐹   "' # includes emoji in prompt

PROMPT='%{$fg_bold[blue]%}[%T]\
%{$fg_bold[white]%}%m\
${ret_status}\
%{$fg[cyan]%}%c%{$reset_color%}🐹\
$(git_prompt_info)'
# host: %{$fg_bold[white]%}%M
# arrow: %{$fg_bold[red]%}➜ 

# Project specific environments
source "${HOME}/.functions"
source "${HOME}/.projects"

# Command aliases
alias interact="srun --x11 --cpus-per-task=6 --mem=25G --time=1-00:00:00 --pty zsh"
alias interactqos="srun --x11 --cpus-per-task=2 --mem=4G --time=1-00:00:00 --qos=gablab --pty zsh"
alias interactmin="srun --x11 --mem=4G --time=0-4:00:00 --pty zsh"
alias interactmid="srun --x11 --cpus-per-task=10 --mem=60G --time=1-12:00:00 --pty zsh"
alias interactmax="srun --x11 --cpus-per-task=16 --mem=100G --time=1-12:00:00 --pty zsh"
alias interactquick="srun --x11 --mem=60G -p om_bigmem --pty zsh" # time = 1h. If the requested time limit exceeds the partition's time limit, the job will be left in a PENDING state (possibly indefinitely). The default time limit is the partition's default time limit.
alias interactiaa="srun --x11 --cpus-per-task=25 --mem=30G --time=1-12:00:00 --pty zsh"
alias interactiaaheavy="srun --x11 --cpus-per-task=25 --mem=60G --time=1-12:00:00 --pty zsh"
alias interactiaaquick="srun --x11 --cpus-per-task=25 --mem=60G -p om_bigmem --pty zsh" # time limit is 1h

alias que="squeue -u daeda"
alias info='sinfo -N -o "%N, %c, %C, %e, %E, %G, %m, %T, %z"'
alias sacctfin="sacct --format=jobid,jobname%40,maxvmsize,maxrss,maxpages,alloccpus,elapsed,exitcode,maxdiskread,maxdiskwrite,state"
alias zprofile="vim ~/.zshrc"

# Project specific aliases
alias omhome="cd /om/user/daeda"
alias om2home="cd /om2/user/daeda"
alias mhhome="cd /mindhive/gablab/u/daeda"

alias adhda="cd /gablab/p/ADHDER/data/adhder"
alias adhdcode="cd /gablab/p/ADHDER/data/adhder/code"
alias adhdsource="cd /storage/gablab001/data/dicoms/adhder"

# Personal BASH Features
alias mkdir='mkdir -p' # Make dir but create intermediary dirs

# If not running interactively, we're done
[ -z "$PS1" ] && return

##TEST FOR SRUN
#export DISPLAY=:0.0
