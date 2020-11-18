## NanoSwe: Analysing PromethION Sequencing Data of Swedish Genomes 🇸🇪

### Introduction

NanoSwe is a preliminary analysis toolkit for experiments that involve data analyses of whole genomes sequenced on ONT's PromethION device. It has also been used for other long-read SweGen data (e.g. PacBio).

### ToolKit

|Purpose |Programs|
|---------|-----|
|Quality Control| [NanoPlot for QC](https://github.com/wdecoster/NanoPlot) & [NanoComp](https://github.com/wdecoster/nanocomp)|
|Mapping to the reference|[Minimap2-2.14](https://github.com/lh3/minimap2)|
|Sorting, Indexing, and calculating statistics | [Samtools v1.9](https://github.com/samtools/samtools)|
|Subsampling | [Sambamba v0.7.1](https://github.com/biod/sambamba)|
| BAM QC Statistics | [Qualimap v2.2.1](https://github.com/scchess/Qualimap)|
|Variant Calling|[Sniffles v1.0.10](https://github.com/fritzsedlazeck/Sniffles)|
|Data Extraction (VCF Files only)|[bcftools v1.9](https://samtools.github.io/bcftools/bcftools.html)|
|Finding intersection in genomic regions| [Survivor 1.0.7](https://github.com/fritzsedlazeck/SURVIVOR) |
|Evaluation of SVs | Survivor 1.0.7 and [surpyvor: 0.5.0](https://github.com/wdecoster/surpyvor)|
|Removing control DNA sequences | [NanoLyse](https://github.com/wdecoster/nanolyse)|
|Trimming Short Reads | [BBMap/BBTools](https://github.com/BioInfoTools/BBMap)
|Homology Detection| [Blast v2.7.1+](https://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastDocs&DOC_TYPE=Download) |
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

`./scRipts` - R scripts created for visulisation of variant calling results

## Data Sources
- [SweGen: a whole-genome data resource of genetic variability in a cross-section of the Swedish population](https://www.nature.com/articles/ejhg2017130)
- [*De novo* Assembly of Two Swedish Genomes Reveals Missing Segments from the Human GRCh38 Reference and Improves Variant Calling of Population-Scale Sequencing Data.](https://www.mdpi.com/2073-4425/9/10/486)
- [Multi-platform discovery of haplotype-resolved structural variation in human genomes](https://www.nature.com/articles/s41467-018-08148-z)

## Recommended Readings
- [Which human reference genome to use?](https://lh3.github.io/2017/11/13/which-human-reference-genome-to-use)
- [Structural variants identified by Oxford Nanopore PromethION sequencing of the human genome](https://genome.cshlp.org/content/early/2019/06/26/gr.244939.118.abstract)

## Citation
If you plan to use it as a guide and would like to acknowledge, simply and kindly mention the link https://github.com/Nazeeefa/NanoSwe.
