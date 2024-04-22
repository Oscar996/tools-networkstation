#!/usr/bin/env bash

# VARIABLES
##### ##### ##### ##### ##### ##### ##### ##### ##### ##### 

RED="\e[31;1m"
GREEN="\e[32;1m"
YELLOW="\e[33;1m"
BLUE="\e[34;1m"
RESET="\e[0m"

APT_UPDATE_LIST=(
    "update --fix-missing"
    "upgrade -y"
    "autoclean"
    "autoremove"
)

APT_INSTALL_PACKAGES=(
    git
    vim
    curl
    zsh
    flatpak
    nmap
    neofetch
    snmp
    speedtest-cli
    ipcalc
    traceroute
    mtr
    whois
    curl
    bind9-host
    mtr-tiny
    jq
    grepcidr
    ncat 
    aha    
)

# ACTION
##### ##### ##### ##### ##### ##### ##### ##### ##### ##### 

apt_install_updates(){ #updates ?
    for update in "${APT_UPDATE_LIST[@]}"; do
        sudo apt "$update" > /dev/null 2>&1
    done
    echo -e "${GREEN}[INFO] - Sistema atualizado...${RESET}"
}

apt_install_packages(){ # apt install apps?
    for package in "${APT_INSTALL_PACKAGES[@]}"; do
        if ! which "$package" > /dev/null 2>&1; then
            echo -e "${YELLOW}[INFO] - Instalando $package${RESET}"
            sudo apt install "$package" -y > /dev/null 2>&1

        else
            echo -e "${GREEN}[INFO] - $package já instalado${RESET}"
        fi
    done
}

apt_install_updates
apt_install_packages

##### ##### ##### ##### ##### ##### ##### ##### ##### ##### 

#Instalação Blacklist check
# git clone https://github.com/adionditsak/blacklist-check-unix-linux-utility.git
# cd blacklist-check-unix-linux-utility
# sudo chmod +x ./bl
# sudo mv ./bl /usr/local/bin
# cd ~

# #Personalização NeoFetch
# cp /home/$USER/.bashrc .bashrc-bak
# echo neofetch >> $HOME/.bashrc

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
