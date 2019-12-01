source ~/.zshrc || exit

tb_conda

upgrade_oh_my_zsh

cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting || exit
git pull --rebase --stat origin master

cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions || exit
git pull --rebase --stat origin master

cd ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions || exit
git pull --rebase --stat origin master

cd ~ || exit

echo "current tmux:"
tmux -V
echo "update via https://gist.github.com/ryin/3106801"

conda update -n base -c defaults conda
conda update -n base -c defaults python

conda update -n omlab -c anaconda anaconda
conda update -n omlab -c anaconda python

pip install --upgrade pip
pip install -U tmuxp

env_wppl
conda update -c anaconda anaconda
npm install -g npm
npm update -g webppl