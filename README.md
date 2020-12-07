## NanoSwe: Analysing PromethION Sequencing Data of Swedish Genomes 🇸🇪

### Introduction

NanoSwe is a preliminary analysis toolkit for experiments that involve sequencing data from ONT's PromethION device. It has also been used for other long-read SweGen data (e.g. PacBio).

### Bioinformatics ToolKit

|Purpose |Programs|
|---------|-----|
|Quality Control| [NanoPlot for QC](https://github.com/wdecoster/NanoPlot) & [NanoComp](https://github.com/wdecoster/nanocomp)|
|Mapping to the reference|[Minimap2-2.14](https://github.com/lh3/minimap2)|
|Sorting, Indexing, and calculating statistics | [Samtools 1.9](https://github.com/samtools/samtools)|
|Subsampling | [Sambamba 0.7.1](https://github.com/biod/sambamba)|
| BAM QC Statistics | [Qualimap 2.2.1](https://github.com/scchess/Qualimap)|
|Structural Variant Calling|[Sniffles 1.0.10](https://github.com/fritzsedlazeck/Sniffles)|
|Data Extraction (VCF Files only)|[bcftools 1.9](https://samtools.github.io/bcftools/bcftools.html)|
|Finding intersection in genomic regions| [Survivor 1.0.7](https://github.com/fritzsedlazeck/SURVIVOR) |
|Evaluation of SVs | Survivor 1.0.7 and [surpyvor: 0.5.0](https://github.com/wdecoster/surpyvor)|
|Removing control DNA sequences | [NanoLyse](https://github.com/wdecoster/nanolyse)|
|Trimming Short Reads | [BBMap/BBTools](https://github.com/BioInfoTools/BBMap)
|Homology Detection| [Blast 2.7.1+](https://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastDocs&DOC_TYPE=Download) |
|Data Visualisation| R version 3.5.3. See the *scripts* directory for information on libraries/packages used for data visualisation.|

#### Nanopore Data: Post-Sequencing 
Example tree structure of nanopore sequencing output files
```
├── /basecalled/<sample>/<flowcell>/
│   ├── fastq_0.fastq
│   ├── fastq_850.fastq
│   ├── sequencing_summary_0.txt
│   ├── sequencing_summary_850.txt
│   └── reads (1)
│       ├── 0 (2)
│       │   ├── file_read_1_ch_90_strand.fast5
│       │   ├── file_read_41_ch_40_strand2.fast5
│       │   └── file_read_300_ch_40_strand2.fast5
│       └── 850
│           ├── file_read_1000_ch_200_strand.fast5
│           ├── file_read_9000_ch_100_strand.fast5
│           └── file_read_95000_ch_1000_strand2.fast5
└── /bin/
```

(1) Each folder contains ~8000 fast5 files <br>
(2) fast5 file named e.g. ```PCT0001_YYYYMMDD_0001A20B002222C_{flowcell}_sequencing_run_{library_full_name}__read_{number}_ch_{number}_strand.fast5)```

#### Nanopore Data: Post-Tidying 
Example tree structure of data organisation
```
├── /basecalled/<sample>/<flowcell>/
│   ├── FASTQ_files
│   │   ├── fastq_0.fastq
│   │   └── fastq_850.fastq
│   ├── sequencing_summary
│   │   ├── sequencing_summary_0.txt
│   │   └── sequencing_summary_850.txt
│   ├── reads *
│   │   ├── 0 *
│   │   │   ├── file_read_1_ch_90_strand.fast5
│   │   │   ├── file_read_41_ch_40_strand2.fast5
│   │   │   └── file_read_300_ch_40_strand2.fast5
│   │   └── 850
│   │       ├── file_read_1000_ch_200_strand.fast5
│   │       ├── file_read_9000_ch_100_strand.fast5
│   │       └── file_read_95000_ch_1000_strand2.fast5
│   └── <sample>_analysis
│       ├── reference_genome.fna
|       ├── reference_genome.fna.fai
│       ├── Snakefile
│       ├── /bam_files/
│       ├── /vcf_files/
│       └── /logs/
└── /bin/
```

### Sub-folder content

`./scRipts` - R scripts created for visulisation of long read data. <br>
`commands.md` - Tool commands used for different analyses.

## Data Sources
- [SweGen: a whole-genome data resource of genetic variability in a cross-section of the Swedish population](https://www.nature.com/articles/ejhg2017130)
- [*De novo* Assembly of Two Swedish Genomes Reveals Missing Segments from the Human GRCh38 Reference and Improves Variant Calling of Population-Scale Sequencing Data.](https://www.mdpi.com/2073-4425/9/10/486)
- [Multi-platform discovery of haplotype-resolved structural variation in human genomes](https://www.nature.com/articles/s41467-018-08148-z)

## Recommended Readings
- [Which human reference genome to use?](https://lh3.github.io/2017/11/13/which-human-reference-genome-to-use)
- [Structural variants identified by Oxford Nanopore PromethION sequencing of the human genome](https://genome.cshlp.org/content/early/2019/06/26/gr.244939.118.abstract)
- [The thesis](https://lup.lub.lu.se/student-papers/search/publication/8978951)
- [Evaluating nanopore sequencing data processing pipelines for structural variation identification](https://pubmed.ncbi.nlm.nih.gov/31727126/)

## Recommended Pipeline(s)
- [nfcore/nanoseq](https://github.com/nf-core/nanoseq)
- [Nano-snakemake](https://github.com/wdecoster/nano-snakemake)
- [Long-Read Data Analysis Tutorial](https://timkahlke.github.io/LongRead_tutorials/)

## Citation
If you plan to use repository as a guide, simply and kindly mention the link https://github.com/Nazeeefa/NanoSwe for acknowledgment. Also, you can cite our [publication](https://doi.org/10.3390/genes11121444) as shown below. Thank you.

> #### AMA Style
> Fatima N, Petri A, Gyllensten U, Feuk L, Ameur A. Evaluation of Single-Molecule Sequencing Technologies for Structural Variant Detection in Two Swedish Human Genomes. Genes. 2020; 11(12):1444.

> #### Chicago Style
> Fatima, Nazeefa; Petri, Anna; Gyllensten, Ulf; Feuk, Lars; Ameur, Adam. 2020. "Evaluation of Single-Molecule Sequencing Technologies for Structural Variant Detection in Two Swedish Human Genomes." Genes 11, no. 12: 1444.
