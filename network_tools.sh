#!/usr/bin/env bash

##### ##### ##### ##### ##### ##### ### ##### ##### ##### ##### ##### 
#####                         VARIABLES                         ##### 
##### ##### ##### ##### ##### ##### ### ##### ##### ##### ##### ##### 

# RED="\e[31;1m"
GREEN="\e[32;1m"
YELLOW="\e[33;1m"
# BLUE="\e[34;1m"
RESET="\e[0m"

SLEEP="sleep 2"

APT_UPDATE_LIST=(
    "update"
    "upgrade"
    "autoclean"
    "autoremove"
)

APT_INSTALL_PACKAGES=(
    aha
    bind9-host
    curl
    flatpak
    git
    grepcidr
    ipcalc
    jq
    mtr
    mtr
    ncat
    neofetch
    nmap
    snmp
    speedtest-cli
    traceroute
    vim
    whois
    zsh  
)

##### ##### ##### ##### ##### ##### ### ##### ##### ##### ##### ##### 
#####                         ACTION                            ##### 
##### ##### ##### ##### ##### ##### ### ##### ##### ##### ##### ##### 

apt_install_updates(){ #updates ?
    echo -e "${GREEN}[INFO] - Updating...\n${RESET}"
    for update in "${APT_UPDATE_LIST[@]}"; do
        sudo apt "$update" -y > /dev/null 2>&1
        $SLEEP
    done
}

apt_install_packages(){ # install apps?
    for package in "${APT_INSTALL_PACKAGES[@]}"; do
        if ! dpkg -l | grep -qw "^ii\s\+$package" > /dev/null 2>&1; then # instaled?
           
            echo -e "${YELLOW}[INFO] - Instalando $package${RESET}"
            sudo apt install "$package" -y > /dev/null 2>&1

        else
            echo -e "${GREEN}[INFO] - $package já instalado${RESET}"
        fi

        $SLEEP
    done
}

##### ##### ##### ##### ##### ##### ### ##### ##### ##### ##### ##### 
#####                         CALL TO ACTION                    ##### 
##### ##### ##### ##### ##### ##### ### ##### ##### ##### ##### ##### 

apt_install_updates
apt_install_packages

##### ##### ##### ##### ##### ##### ### ##### ##### ##### ##### ##### 
#####                         OTHERS                            ##### 
##### ##### ##### ##### ##### ##### ### ##### ##### ##### ##### ##### 

#Neofetch
echo 'alias neo="neofetch"' >> "$HOME"/.bashrc
source "$HOME"/.bashrc
echo neofetch >> "$HOME"/.bashrc

#Instalação ASN
curl "https://raw.githubusercontent.com/nitefood/asn/master/asn" > asn && \
sudo chmod 0755 asn 
sudo mv -f asn /usr/bin/asn

#Blacklist
git clone https://github.com/adionditsak/blacklist-check-unix-linux-utility.git
sudo cp blacklist-check-unix-linux-utility/bl /usr/bin/bl


##### ##### ##### ##### ##### ##### ### ##### ##### ##### ##### ##### 
#####                         END                               ##### 
##### ##### ##### ##### ##### ##### ### ##### ##### ##### ##### ##### 

# #Validação
# echo "Tudo certo meu patrão!!!"

# echo "Foram instaladas um conjunto de ferramentas de rede, incluindo o Nmap, uma Calculadora de IP, e uma ferramenta para checar IP em Blacklists."
# echo "Para usar as ferramentas, seguem os comandos e sintaxes:"
# echo "Nmap: nmap <ip> -p <porta>"
# echo "Calculadora IP: ipcalc <ip/mask>"
# echo "Verificação de Blacklist: bl <ip>"
