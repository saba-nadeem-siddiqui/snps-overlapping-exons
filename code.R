
library(BiocManager)
library(GenomicRanges)
library(readxl)

# Read the files
exons <- read.csv("C:/Users/saba1/Documents/PROJECTS/Learning/snps-on-exon/Exons.csv")
snps <- read.csv("C:/Users/saba1/Documents/PROJECTS/Learning/snps-on-exon/SNP.csv")



# Store the value of each column in a vector (exons)
exonChrValue <- exons$Chromosome

exonStartValue <- as.numeric(exons$exonStart)

exonEndValue <- as.numeric(exons$exonEnd)

# Calculate genomic ranges (exons)
GRexon <- GRanges(seqnames = exonChrValue,
                   ranges = IRanges(start = exonStartValue,
                                    end = exonEndValue))



# Store the value of each column in a vector (snps)
snpChrValue <- snps$Chromosome

snpStartValue <- as.numeric(snps$snpStart)

snpEndValue <- as.numeric(snps$snpEnd)

# Calculate genomic ranges (snps)
GRsnp <- GRanges(seqnames = snpChrValue,
                 ranges = IRanges(start = snpStartValue,
                                  end = snpEndValue))

#Find SNPs which overlap Exons
OverlappingRegions <- as.data.frame(findOverlaps(GRexon, GRsnp))

exonRows <- OverlappingRegions$queryHits
snpRows <- OverlappingRegions$subjectHits

OverlappedDF <- cbind(exons[exonRows,], snps[snpRows,])



