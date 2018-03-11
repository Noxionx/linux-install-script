#!/bin/bash
ZSH_PATH=/opt/oh-my-zsh
ZSH_CONFIG=/opt/zsh-config

USER_NAME=noxionx

apt update

# Install base packages
apt install -y \
  build-essential \
  git \
  wget \
  curl \
  zsh \
  nginx \
  gparted

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
mv /root/.oh-my-zsh $ZSH_PATH
mkdir -p $ZSH_CONFIG

cp zshrc $ZSH_CONFIG/zshrc
cp profile $ZSH_CONFIG/default.profile
cp slawek.zsh-theme $ZSH_CONFIG/slawek.zsh-theme

cd $ZSH_CONFIG

ln -s $ZSH_CONFIG/slawek.zsh-theme $ZSH_PATH/themes/

rm /root/.zshrc
ln -s $ZSH_CONFIG/zshrc /root/.zshrc
cp $ZSH_CONFIG/default.profile /root/.profile

ln -s $ZSH_CONFIG/zshrc /home/$USER_NAME/.zshrc
cp $ZSH_CONFIG/default.profile /home/$USER_NAME/.profile
chown $USER_NAME:$USER_NAME /home/$USER_NAME/.profile

cd ~

# Install chrome
wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i chrome.deb
rm chrome.deb

# Install nodejs
curl -sL https://deb.nodesource.com/setup_9.x | bash -
apt-get install -y nodejs

# Install vscode
wget -O code.deb https://go.microsoft.com/fwlink/?LinkID=760868
dpkg -i code.deb
rm code.deb

# Install missing deps
apt -f -y install
