# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# OM features
module add openmind/gcc/5.3.0 # needed to lauch sbatch jobs
module add slurm

# Setup a fancy shell command prompt:
project_name="base"
prompt1="\[\e[0;33m\][\A]\[\e[0m\]" # Display the time in the bash prompt
prompt2="\[\e[1;39m\]\h:\[\e[0;34m\]\W\[\e[0m\]" # Add host:dir$
PROMPT_COMMAND='PS1="\[\e[1;37m\e[44m\]${project_name}\[\e[0;0m\]${prompt1}${prompt2}🐹  "' # includes emoji in prompt

# Project specific environments
source "${HOME}"/.functions
source "${HOME}"/.projects
# source "${HOME}"/.custom_env

# Command aliases
alias interact="srun --x11 --mem=25000 --time=0-12:00:00 --pty bash"
alias interactmin="srun --x11 --mem=8000 --time=0-4:00:00 --pty bash"
alias interactmid="srun --x11 --cpus-per-task=10 --mem=40GB --time=1-12:00:00 --pty bash"
alias interactmax="srun --x11 --cpus-per-task=15 --mem=100GB --time=1-12:00:00 --pty bash"
alias interactquick="srun --x11 --mem=8000 --time=0-3:00:00 --pty bash"

# Project specific aliases
alias omhome="cd /om/user/daeda"
alias mhhome="cd /mindhive/gablab/u/daeda"
alias adhda="cd /gablab/p/ADHDER/data/ADHDER"
alias adhdd="cd /gablab/p/ADHDER/dicom_storage/ADHDER"

# Personal BASH Features 
alias ls="ls --color=auto"
alias mkdir='mkdir -p' # Make dir but create intermediary dirs
bind "set completion-ignore-case on" # ignore file case
