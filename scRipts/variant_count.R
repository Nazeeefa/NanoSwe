## Count of variants per chromosome

# Specifying full path
vcf1 <- read.table("/full/path/file.csv", sep=";", header = TRUE)

vcf1$CHROM <- factor(vcf1$CHROM, levels = paste("chr",c(seq(1,22), "X","Y"), sep = ""))

library(ggplot2)
count_plot <- ggplot() + geom_bar(aes(x = vcf1$CHROM, fill = SV), data=vcf1, position = "stack", stat="count") +
  theme_minimal() + 
  labs(title = "Counts of variants per chromosome", y = "Amount of Variants", x = "Chromosomes") + 
  scale_x_discrete(labels = c(seq(1,22), "X","Y")) + 
  facet_wrap(~Sample,  scales='free') + 
  theme(
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(), 
    panel.background = element_blank())

count_plot
