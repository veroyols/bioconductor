# bioconductor
## 📦 Bioconductor Docker Environment
Este repositorio contiene configuraciones y guías para crear un entorno de análisis bioinformático utilizando Bioconductor dentro de un contenedor Docker con RStudio.

## 🛠️ Entorno
Configuración
   * Plantilla: Imagen Docker oficial de Bioconductor, disponibles en Docker Hub [Docker Hub](https://hub.docker.com/u/bioconductor/).
   * Instancia: Contenedor generado a partir de la imagen.
   * Persistencia: Volumen montado para guardar datos y scripts en el host.

Dockerfile → Image → Container → Volume

## 🚀 Levantar el Contenedor

Comando en la terminal (cmd):
```
docker run 
  -e PASSWORD=bioc 
  -p 8787:8787 
  -v C:/repos/bioconductor:/home/rstudio/Desktop 
  bioconductor/bioconductor_docker:latest
```
### Parámetros:
  * `-e PASSWORD=bioc`: Establece la contraseña para el usuario rstudio.
  * `-p 8787:8787`: Expone el puerto 8787 para acceder a RStudio.
  * `-v C:/repos/bioconductor:/home/rstudio/Desktop`: Monta el volumen del host al contenedor para persistencia de datos.

## 📝 Documentación
Docker containers for Bioconductor[ver link](https://)

## 🌐 Acceso a RStudio
  * URL: http://localhost:8787
  * Usuario: rstudio
  * Contraseña: bioc

## 🧩 Versiones Compatibles
❗ Bioconductor 3.19 → R 4.3.x

❗ Bioconductor 3.20 → R 4.4.x

## 📦 Instalación 
### Instalar Bioconductor
```install.packages("BiocManager")
library("BiocManager")
BiocManager::install(version = "3.20")
```

### Rsamtools
`BiocManager::install("Rsamtools")`

### Rbowtie2
`BiocManager::install("Rbowtie2")`

### rtracklayer
`BiocManager::install("rtracklayer")`

### R.utils 
descomprimir archivos.
`install.packages("R.utils")`

## Ver Versiones Instaladas
```
R.version.string
BiocManager::version()
packageVersion("BiocManager")
packageVersion("Rsamtools")
packageVersion("Rbowtie2")
packageVersion("rtracklayer")
```
## 📚 Cargar Paquetes
```
library("BiocManager")
library("Rsamtools")
library("Rbowtie2")
library("rtracklayer")
library("R.utils")
```
