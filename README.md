# snps-overlapping-exons

To find out which exon contains the most number of SNPs on a chromosome.
This script can also be used to find out several other overlapping features on a chromosome. 


# Workflow:

## 1) Open UCSC Table Browser and download Exon and SNP data for any chromosome

### 1.1) Parameters to download exon file:
i) Genome: Human (hg38)
ii) Group: Genes and gene predictions
iii) Track: GENCODE V50
iv) Table: knownGene
v) Region: Position + Chromosome number
vi) Output format: BED
vii) Output filed separator: CSV
viii) Choose 'Get output' (to download the file) OR 'Send output to' (to open it using Galaxy or GREAT)
ix) Create one BED record per: Coding exons
x) getBED

### 1.2) Parameters to download snp file:
i) Genome: Human (hg38)
ii) Group: Variation
iii) Track: Common SNPs (151)
iv) Table: snp151Common
v) Region: Position + Chromosome number
vi) Output format: BED
vii) Output filed separator: CSV
viii) Choose 'Get output' (to download the file) OR 'Send output to' (to open it using Galaxy or GREAT)
ix) Create one BED record per: Whole gene
x) getBED


## 2) Open both files in Excel
i) Check both files have the following columns in order: 
- Chromosome number
- Start position 
- End position
- Exon name
- Score
- Strand
ii) Add 'exon' and 'snp' in column names of both exon and snp files respectively 
iii) Save in CSV (comma separated) format


## 3) Setting up an R script
i) Download and install 'R' & 'R Studio'
ii) Open R Studio and create a new R Script
iii) Check working directory using > getwd() in the terminal
iv) In case the working directory is not set to the folder which contains exon and snp files:
- Copy the path to the folder which contains both files
- Go to R and type > setwd("file-path")

## 4) Install the following libraries:
i) dplyr
ii) readxl
iii) BiocManager
iv) GenomicRanges






















