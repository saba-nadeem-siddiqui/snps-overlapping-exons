# Method

# Requirements
1. R & R-Studio <br>
2. R packages: 
```R
library(dplyr)
library(readxl)
library(GenomicRanges)
```

# Input files
## 1. Download Exon and SNP annotation for any chromosome

### 1.1 Exon file: <br>
(i).....Genome: Human (hg38) <br>
(ii)....Group: Genes and gene predictions <br>
(iii)...Track: GENCODE V50 <br>
(iv)....Table: knownGene <br>
(v).....Region: Position + Chromosome number <br>
(vi)....Output format: BED <br>
(vii)...Output filed separator: CSV <br>
(viii)..Choose 'Get output' (to download the file) OR 'Send output to' (to open it using Galaxy) <br>
(ix)....Create one BED record per: Coding exons <br>
(x).....getBED <br>

### 1.2 SNP file: <br>
(i).....Genome: Human (hg38) <br>
(ii)....Group: Variation <br>
(iii)...Track: Common SNPs (151) <br>
(iv)....Table: snp151Common <br>
(v).....Region: Position + Chromosome number <br>
(vi)....Output format: BED <br>
(vii)...Output filed separator: CSV <br>
(viii)..Choose 'Get output' (to download the file) OR 'Send output to' (to open it using Galaxy or GREAT) <br>
(ix)....Create one BED record per: Whole gene <br>
(x).....getBED <br>


## 2. Open both files in Excel
(i).....Both the files should have these columns in order: <br>
- Chromosome number
- Start position 
- End position
- Exon name
- Score
- Strand 
<br>

(ii)....To avoid duplicate column names, add 'exon' and 'snp' in column names of both exon and snp files respectively <br>
(iii)...Save in CSV (comma separated) format <br>


# Workflow
1. Open a new R script and install the packages <br>
2. [code.R](https://github.com/saba-nadeem-siddiqui/snps-overlapping-exons/blob/ec087c900e3809f5ea5e3a7ed646070c2defc516/code.R) <br>
3. Add a custom track in UCSC Genome Browser and visualize the output <br>
