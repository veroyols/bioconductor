# Bioinformática En Casa #2 - Análisis diferencial de la expresión génica (RNA-seq) con R

library("BiocManager")
BiocManager::install("Rsubread") 

library("Rsubread")

# lista de los *.bam
bamFiles <- list.files(path = "bam", pattern = "*.bam$")

file.show("/home/rstudio/Desktop/bioinfogp/genes/Saccharomyces_cerevisiae.R64-1-1.99.ggf3")

data <- featureCounts(
        files = bamFiles,
        annot.ext = "/home/rstudio/Desktop/bioinfogp/genes/Saccharomyces_cerevisiae.R64-1-1.99.ggf3",
        isGTFAnnotation = TRUE,
        GTF.featureType = "gene",
        GTF.attrType = "ID",
        isPairedEnd = TRUE, #son parejas
        requireBothEndsMapped = TRUE, #ambos extremos mapeados
        minMQS = 20, #calidad min
        strandSpecific = 2
)

# bowtie2_build("/home/rstudio/Desktop/bioinfogp/chromosomes/Saccharomyces_cerevisiae.R64-1-1.dna.toplevel.fa",
#         bt2Index = "/home/rstudio/Desktop/bioinfogp/chromosomes/indexed",
#         overwrite = TRUE)

# bowtie2(bt2Index = "/home/rstudio/Desktop/bioinfogp/chromosomes/indexed",
#         samOutput = "1M_SRR9336468.sam",
#         seq1 = "/home/rstudio/Desktop/bioinfogp/fastq/1M_SRR9336468_1.fastq",
#         seq2 = "/home/rstudio/Desktop/bioinfogp/fastq/1M_SRR9336468_2.fastq")

# asBam("/home/rstudio/1M_SRR9336468.sam")

# sortBam("/home/rstudio/1M_SRR9336468.bam",
#         "/home/rstudio/1M_SRR9336468_sort.bam")

# indexBam("/home/rstudio/1M_SRR9336468_sort.bam.bam")
