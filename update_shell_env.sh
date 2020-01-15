source ~/.zshrc || exit

tb_conda

zsh --version
echo "current tmux:"
tmux -V
echo "update via https://gist.github.com/ryin/3106801"

upgrade_oh_my_zsh

cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || exit
git pull --rebase --stat origin master

cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || exit
git pull --rebase --stat origin master

cd ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions || exit
git pull --rebase --stat origin master

cd ~ || exit

conda update -n base -c defaults conda
conda update -n base -c defaults python

conda update -n omlab -c anaconda anaconda
conda update -n omlab -c anaconda python
conda update -n omlab --all -c anaconda

pip install --upgrade pip
pip install -U tmuxp

env_iaa
conda update -c anaconda anaconda
conda update -c anaconda python
conda update --all -c pytorch -c anaconda
pip install --upgrade pip
pip install -U tmuxp

node -v
##### https://johnpapa.net/node-and-npm-without-sudo/
# Install Node.js from https://nodejs.org/en/download/
#####

npm install -g npm
npm update -g jshint
npm update -g webppl
npm install --prefix ~/.webppl webppl-json --force
