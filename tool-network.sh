#!/usr/bin/env bash
#Atualização de repositórios e pacotes
sudo apt upgrade
sudo apt update

#Instalação das aplicações
sudo apt install nmap neofetch snmp speedtest-cli ipcalc traceroute

#Instalação Blacklist check
git clone https://github.com/adionditsak/blacklist-check-unix-linux-utility.git
cd blacklist-check-unix-linux-utility
sudo chmod +x ./bl
sudo mv ./bl /usr/local/bin
cd ~

#Personalização NeoFetch
cp /home/$USER/.bashrc
echo neofetch >> /home/$USER/.bashrc

#Validação
echo "Tudo certo meu patrão!!!"
