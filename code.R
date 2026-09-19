
library(GenomicRanges)
library(readxl)
library(dplyr)

# Read the files
exons <- read.csv("Exons.csv")
snps <- read.csv("SNP.csv")


# Store the value of each column in a vector (exons)
exonChrValue <- exons$exonChromosome

exonStartValue <- as.numeric(exons$exonStart)

exonEndValue <- as.numeric(exons$exonEnd)

# Calculate genomic ranges (exons)
GRexon <- GRanges(seqnames = exonChrValue,
                   ranges = IRanges(start = exonStartValue,
                                    end = exonEndValue))



# Store the value of each column in a vector (snps)
snpChrValue <- snps$snpChromosome

snpStartValue <- as.numeric(snps$snpStart)

snpEndValue <- as.numeric(snps$snpEnd)

# Calculate genomic ranges (snps)
GRsnp <- GRanges(seqnames = snpChrValue,
                 ranges = IRanges(start = snpStartValue,
                                  end = snpEndValue))


#Find SNPs which overlap exons
OverlappingRegions <- as.data.frame(findOverlaps(GRexon, GRsnp))

exonRows <- OverlappingRegions$queryHits
snpRows <- OverlappingRegions$subjectHits

OverlappedDF <- cbind(exons[exonRows,], snps[snpRows,])


# Group and count every occurrence of an exon
groupedDF <- OverlappedDF |>
  group_by(exonID) |>  #Group every exon
  summarise(Repeats = n()) |>  #Count occurrence of each exon
  arrange(-Repeats)  #Arrange in exon occurrence in decreasing order

mostsnps <- head(groupedDF, 5)


# Join the main exons file with top 5 rows
joinedDF <- exons |>
  inner_join(mostsnps, by = "exonID")


# Rearrange columns to fit BED6 format
RearrangedDF <- joinedDF |> 
  select(1:4, exonScore = Repeats, exonStrand)



# Remove column names to fit UCSC BED format
names(RearrangedDF) <- NULL

# Save output in a tab delimited file
output <- "Topexons.txt"
write.table(RearrangedDF, file = output, sep = "\t",
            row.names = FALSE, quote = FALSE)

