#!/usr/bin/env bash

# VARIABLES
##### ##### ##### ##### ##### ##### ##### ##### ##### ##### 

RED="\e[31;1m"
GREEN="\e[32;1m"
YELLOW="\e[33;1m"
BLUE="\e[34;1m"
RESET="\e[0m"

APT_UPDATE_LIST=(
    'update --fix-missing'
    'upgrade -y'
    'autoclean'
    'autoremove'
)

# APT_INSTALL_LIST=(
#     "git"
#     "vim"
#     "curl"
#     "zsh"
#     "speedtest"
#     "snapd"
#     "flatpak"
#     # "gnome-software-plugin-flatpak" # Nao roda no kde XP
# )

SNAP_LIST=(
    "rpi-imager"
    "multipass"
)

# ACTION
##### ##### ##### ##### ##### ##### ##### ##### ##### ##### 

apt_install_updates(){ #updates ?
    for update in "${APT_UPDATE_LIST[@]}"; do
        sudo apt "$update" > /dev/null 2>&1
    done
    echo -e "${GREEN}[INFO] - Sistema atualizado...${RESET}"
}

##### ##### ##### ##### ##### ##### ##### ##### ##### ##### 

# sudo apt upgrade
# sudo apt update

# #Instalação das aplicações
# sudo apt install -y nmap neofetch snmp speedtest-cli ipcalc traceroute mtr whois
# #Dependências para ASN
# sudo apt -y install curl whois bind9-host mtr-tiny jq ipcalc grepcidr nmap ncat aha

# #Instalação Blacklist check
# git clone https://github.com/adionditsak/blacklist-check-unix-linux-utility.git
# cd blacklist-check-unix-linux-utility
# sudo chmod +x ./bl
# sudo mv ./bl /usr/local/bin
# cd ~

# #Personalização NeoFetch
# cp /home/$USER/.bashrc .bashrc-bak
# echo neofetch >> /home/$USER/.bashrc

# #Instalação ASN
# curl "https://raw.githubusercontent.com/nitefood/asn/master/asn" > asn && chmod 0755 asn 
# sudo cp asn /usr/bin/asn

# #Validação
# echo "Tudo certo meu patrão!!!"

# echo "Foram instaladas um conjunto de ferramentas de rede, incluindo o Nmap, uma Calculadora de IP, e uma ferramenta para checar IP em Blacklists."
# echo "Para usar as ferramentas, seguem os comandos e sintaxes:"
# echo "Nmap: nmap <ip> -p <porta>"
# echo "Calculadora IP: ipcalc <ip/mask>"
# echo "Verificação de Blacklist: bl <ip>"
