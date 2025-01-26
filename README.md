# 🧬 Bioconductor Docker Environment
Este repositorio contiene configuraciones y guías para crear un entorno de análisis bioinformático utilizando Bioconductor dentro de un contenedor Docker con RStudio.

## 📥 Descargar imagen de DockerHub
```
docker pull veroyols/myapp_bioc
```

digest: `sha256:6ae1ae06cdf622bf64eee82d30fa6b872fd886294cb201e40a78e40f49c4ccf8 size: 4509`


## 🛠️ Entorno
   * Base: Imagen Docker oficial de Bioconductor, disponibles en Docker Hub [Docker Hub](https://hub.docker.com/u/bioconductor/).
   * Contenedor: generado a partir de la imagen.
   * Persistencia: Volumen montado para guardar datos.

📂 Dockerfile → 🖼️ Imagen → 📦 Contenedor → 💾 Volumen

## 🚀 Levantar el Contenedor

Comando en la terminal (cmd):
```
docker run 
  -e PASSWORD=bioc \
  -p 8787:8787 \
  -p 8000:8000 \
  -v C:/repos/bioconductor:/home/rstudio/Desktop \
  veroyols/myapp_bioc:latest
```
### Parámetros:
  * `-e PASSWORD=bioc`: contraseña para el usuario rstudio.
  * `-p 8787:8787`: acceso a RStudio en el puerto 8787.
  * `-p 8000:8000`: exponer una API con plumber en el puerto 8000.
  * `-v C:/repos/bioconductor:/home/rstudio/Desktop`: volumen para persistencia de datos.

## 🌐 Acceso a RStudio
  📌 URL: http://localhost:8787
  👤 Usuario: rstudio
  🔑 Contraseña: bioc

## 🧩 Versiones Compatibles
Ver version de R
```
R.version.string
```
❗ R 4.3.x → Bioconductor 3.19

❗ R 4.4.x → Bioconductor 3.20

## 📦 Instalación de paquetes (compatibles con R 4.4.x)
```
install.packages("BiocManager")
install.packages("R.utils")
BiocManager::install(version = "3.20")
BiocManager::install(c("Rsamtools", "Rbowtie2", "rtracklayer"))
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

