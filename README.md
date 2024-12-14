# 🧬 Bioconductor Docker Environment
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
  -e PASSWORD=bioc \
  -p 8787:8787 \
  -v C:/repos/bioconductor:/home/rstudio/Desktop \
  bioconductor/bioconductor_docker:latest
```
### Parámetros:
  * `-e PASSWORD=bioc`: Establece la contraseña para el usuario rstudio.
  * `-p 8787:8787`: Expone el puerto 8787 para acceder a RStudio.
  * `-v C:/repos/bioconductor:/home/rstudio/Desktop`: Monta el volumen del host al contenedor para persistencia de datos.

## 🌐 Acceso a RStudio
  * URL: http://localhost:8787
  * Usuario: rstudio
  * Contraseña: bioc

## 🧩 Versiones Compatibles
Ver version de R
```
R.version.string
```
❗ Bioconductor 3.19 → R 4.3.x

❗ Bioconductor 3.20 → R 4.4.x

## 📦 Instalación de librerías
```
install.packages("BiocManager")
install.packages("R.utils")
library("BiocManager")
```
Instalar la version compatible con R 4.4.x
```
BiocManager::install(version = "3.20")
BiocManager::install("Rsamtools")
BiocManager::install("Rbowtie2")
BiocManager::install("rtracklayer")
```

## Ver Versiones Instaladas
```
BiocManager::version() #biocmanager
packageVersion("BiocManager") #bioconductor
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

---

## 🧬 Ejemplo 1

Este ejemplo está basado en el material proporcionado por el [CNB-CSIC Bioinformatics Platform](https://bioinfogp.cnb.csic.es/).

Se utilizó el tutorial en YouTube:  
[Aprende Bioinformática En Casa - BioinfoGP](https://youtube.com/playlist?list=PLC4evXANleuMhmU0GI9BGnq2SLJ8TqvBm&si=QMeLaxHU5NUxzrIC)

### 📂 Directorios

  * `/home/rstudio/Desktop/bioinfogp`
    * `/genes/`: Anotaciones. Contiene archivos GFF3 (General Feature Format) para anotar características genómicas, como genes, exones y regiones codificantes (CDS).
      * `Saccharomyces_cerevisiae.R64-1-1.99.gff3`
    * `/chromosomes/`: Secuencias de bases de datos. Contiene secuencias genómicas descargadas desde [ENA](https://www.ebi.ac.uk/ena/browser/view/PRJEB39010).
      * `Saccharomyces_cerevisiae.R64-1-1.dna.toplevel.fa`
      * `Saccharomyces_cerevisiae.R64-1-1.dna.toplevel.fa.fai`
    * `/fastq/`. Lecturas. Contiene archivos de lecturas FASTQ.
      * `1M_SRR9336457.fastq`
      * `1M_SRR9336468_1.fastq`
      * `1M_SRR9336468_2.fastq`
    * `/index/`: Índices. Contiene archivos indexados.
      * `*.1.bt2`
    * `/output/`: Salidas. Contiene archivos procesados.

### Flujo de trabajo
![Flujo de trabajo con bioconductor](https://github.com/veroyols/bioconductor/blob/main/img/flujo.png)

1. 📦 Descomprimir Archivos
2. 🗂️ Indexar secuencia fasta (en /chromosomes/)
3. 🔗 Alinear indexados (en /index/) con lecturas (en /fastq/)
4. 🔄 Convertir sam a bam
5. 🗃️ Ordenar el archivo BAM
6. 🔍 Indexar el archivo BAM
7. 🧬 Cruzar con el GFF3

---

## 📝 Documentación
[Docker containers for Bioconductor](https://www.bioconductor.org/help/docker/)

