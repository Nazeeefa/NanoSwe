Following commands can be used as a guide. Note, paramater selection depends on your hypothesis.

#### Aligning ONT reads: Minimap2
```
minimap2 -ax map-ont -L -t 8 human-ref.mmi swedish_genome.fastq | samtools sort -@8 -o swedish_genome.bam
```
#### Aligning PacBio reads: Minimap2
```
minimap2 -ax map-pb -L -t 8 human-ref.mmi swedish_genome.fastq | samtools sort -@8 -o swedish_genome.bam
```
#### Alignment Statistics: QualiMap v2.2.1
```
qualimap bamqc -bam swedish_genome.bam -nw 400 -hm 3
```
#### Subsampling of PacBio data: Sambamba v0.7.1
```
sambamba view -h -t 10 -s 0.5 -f bam --subsampling-seed=16 file.bam -o subsampled_file.bam 
```
