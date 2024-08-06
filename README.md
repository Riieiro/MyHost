# MyHost
![image](https://github.com/user-attachments/assets/0c4823a5-6387-4b55-89ad-db77c582306a)
### Descripción

Este script se utiliza para detectar dispositivos en una red local y, potencialmente, inhabilitarlos mediante un ataque de ARP spoofing. ​​

### Características

- Escaneo de Red.
- Identificación del Sistema Operativo.
- Ataque de ARP Spoofing.
- Interrupción Controlada.


### Instalación

Para instalar el script `MyHost.sh`, sigue estos pasos:

1. **Clonar el Repositorio**:
    ```bash
    git clone https://github.com/Riieiro/MyHost.git
    cd MyHost
    ```

2. **Dar Permisos de Ejecución al Script**:
    ```bash
    chmod +x MyHost.sh
    ```

3. **Ejecutar el Script**:
    ```bash
    ./MyHost.sh
    ```

### Requisitos

- Sistema operativo Linux.
- Permisos de superusuario (root) para ejecutar ciertas configuraciones del script.
- Máscara de red /24 (255.255.255.0)

### ¿Cómo funciona?

La herramienta comienza instalando las herramientas dsniff y nmap. 

![image](https://github.com/user-attachments/assets/d9a95392-d22e-49a1-9ac5-a5ceb2de0883)

Una vez pasada la instalación, se listan las interfaces de red disponibles, siendo necesario en este punto seleccionar una interfaz. 

![image](https://github.com/user-attachments/assets/4830c71f-349c-4f56-a943-588d1b4e42a1)

Tras seleccionar la interfaz, la herramienta mostrará por pantalla todas las ip conectadas a la red de la interfaz deseada.

![image](https://github.com/user-attachments/assets/7f777b30-0f7c-43df-89a6-06605c270095)

Por úlitmo, `MyHost.sh` da la opción de inhabilitar una ip, mostrando si es posible el Sistena Operativo.

![image](https://github.com/user-attachments/assets/cd2e950a-0782-4a08-a85d-457035d96194)
