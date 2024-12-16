# Levantar el docker
# docker run -e PASSWORD=bioc -p 8787:8787 -v C:/Users/veros/OneDrive/Escritorio:/home/rstudio/Desktop bioconductor/bioconductor_docker:latest
# Abrir R en localhost:8787
# user: rstudio
# pass: bioc
# Archivos de la clase
# https://mega.nz/folder/uxITCIpb#E5IHgaAtf0lQg8JYMnvn7A
# https://bioinfogp.cnb.csic.es/courses/quedateencasa/23_03_2020/

install.packages("R.utils")
install.packages("BiocManager")
library("BiocManager")
BiocManager::install(version = "3.20")
BiocManager::install("Rsamtools")
BiocManager::install("Rbowtie2")
BiocManager::install("rtracklayer") #1.6.6

library("BiocManager")
library("Rsamtools")
library("Rbowtie2")
library("R.utils")

bowtie2_build("/home/rstudio/Desktop/bioinfogp/chromosomes/Saccharomyces_cerevisiae.R64-1-1.dna.toplevel.fa",
        bt2Index = "/home/rstudio/Desktop/bioinfogp/chromosomes/indexed",
        overwrite = TRUE)

bowtie2(bt2Index = "/home/rstudio/Desktop/bioinfogp/chromosomes/indexed",
        samOutput = "1M_SRR9336468.sam",
        seq1 = "/home/rstudio/Desktop/bioinfogp/fastq/1M_SRR9336468_1.fastq",
        seq2 = "/home/rstudio/Desktop/bioinfogp/fastq/1M_SRR9336468_2.fastq")

asBam("/home/rstudio/1M_SRR9336468.sam")

sortBam("/home/rstudio/1M_SRR9336468.bam",
        "/home/rstudio/1M_SRR9336468_sort.bam")

indexBam("/home/rstudio/1M_SRR9336468_sort.bam.bam")
