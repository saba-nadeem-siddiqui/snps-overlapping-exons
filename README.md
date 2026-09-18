# snps-overlapping-exons

To find out which exon contains the most number of SNPs on a chromosome.
This script can also be used to find out several other overlapping features on a chromosome. 


# Workflow:

## 1. Open UCSC Table Browser and download Exon and SNP data for any chromosome

### 1.1 Parameters to download exon file: <br>
(i) Genome: Human (hg38) <br>
(ii) Group: Genes and gene predictions <br>
(iii) Track: GENCODE V50 <br>
(iv) Table: knownGene <br>
(v) Region: Position + Chromosome number <br>
(vi) Output format: BED <br>
(vii) Output filed separator: CSV <br>
(viii) Choose 'Get output' (to download the file) OR 'Send output to' (to open it using Galaxy or GREAT) <br>
(ix) Create one BED record per: Coding exons <br>
(x) getBED <br>

### 1.2 Parameters to download snp file: <br>
(i) Genome: Human (hg38) <br>
(ii) Group: Variation <br>
(iii) Track: Common SNPs (151) <br>
(iv) Table: snp151Common <br>
(v) Region: Position + Chromosome number <br>
(vi) Output format: BED <br>
(vii) Output filed separator: CSV <br>
(viii) Choose 'Get output' (to download the file) OR 'Send output to' (to open it using Galaxy or GREAT) <br>
(ix) Create one BED record per: Whole gene <br>
(x) getBED <br>


## 2. Open both files in Excel
(i) Check both files have the following columns in order: <br>
- Chromosome number
- Start position 
- End position
- Exon name
- Score
- Strand <br>
(ii) Add 'exon' and 'snp' in column names of both exon and snp files respectively <br>
(iii) Save in CSV (comma separated) format <br>


## 3. Set up an R script
(i) Download and install 'R' & 'R Studio' <br>
(ii) Open R Studio and create a new R Script <br>
(iii) Check working directory using > getwd() in the terminal <br>
(iv) In case the working directory is not set to the folder which contains exon and snp files: <br>
- Copy the path to the folder which contains both files 
- Go to R and type > setwd("file-path") 

## 4. Install the following libraries:
(i) dplyr <br>
(ii) readxl <br>
(iii) BiocManager <br>
(iv) GenomicRanges <br>


