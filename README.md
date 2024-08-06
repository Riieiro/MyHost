# MyHost
![image](https://github.com/user-attachments/assets/0c4823a5-6387-4b55-89ad-db77c582306a)
### Descripción

Este script se utiliza para detectar dispositivos en una red local y, potencialmente, deshabilitarlos mediante un ataque de ARP spoofing. ​​

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

### Ejemplo de Uso

A continuación, un ejemplo de cómo se podría utilizar el script :

```bash
# Clona el repositorio
git clone https://github.com/tu_usuario/pentesting-scripts.git

# Navega al directorio del repositorio
cd pentesting-scripts

# Da permisos de ejecución al script
chmod +x MyHost.sh

# Ejecuta el script
sudo ./MyHost.sh
