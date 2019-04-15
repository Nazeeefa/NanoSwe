## NanoSwe: Analysing nanopore (PromethION) Sequencing Data of Swedish Genomes

### Introduction

NanoSwe is a pipeline built for the pilot study that involves data analyses of whole-genomes sequenced on ONT's PromethION alpha-beta device.

### Pipeline

|Purpose |Program(s)|
|---------|-----|
|Basecalling| Guppy version 1.8.1 |
|Quality Control| [NanoPlot for QC](https://github.com/wdecoster/NanoPlot), and [NanoComp](https://github.com/wdecoster/nanocomp) for nanopore data comparison |
|Mapping to the reference|[Minimap2-2.14](https://github.com/lh3/minimap2)|
|Sorting, Indexing, and calculating statistics | [Samtools v1.9](https://github.com/samtools/samtools)|
|Variant Calling|[Sniffles v1.0.10](https://github.com/fritzsedlazeck/Sniffles)|
|Data Extraction|[bcftools v1.9](https://samtools.github.io/bcftools/bcftools.html)|
|Finding intersection in variant callsets| [bedtools v2.27.1](https://github.com/arq5x/bedtools2)|
|Data Visualisation|[ggplot2](https://ggplot2.tidyverse.org/) and [cyvcf2](https://github.com/brentp/cyvcf2)*. See *nf_promethION_vc.Rmd* for information on libraries/packages used for data visualisation.|

For cyvcf2, make sure latest version of pip, matplotlib, and Cython are installed.

#### Nanopore Data: Post-Sequencing 

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

## Citation
If you plan to use it as a guide and would like to acknowledge, simply mention author's name and a link to Github repository.
