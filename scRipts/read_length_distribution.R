library(ggplot2)
library(ggthemes)

my_theme <- theme(
    panel.border = element_blank(),
    axis.ticks.y = element_blank(),
    axis.ticks.x = element_blank(),
    # margin is defined as top, right, bottom, left
    axis.text.y = element_text(size = 8, margin=margin(-5,0,0,0)),
    axis.text.x = element_text(size = 8, margin=margin(-5,0,0,0)),
    axis.title.x = element_blank(),
    axis.title.y =element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.background = element_blank(),
    # Negative values move text to the left
    plot.title = element_text(hjust = 0.5)
    )

ont_colours <- geom_bar(colour = "#5dbcd2", stat = "identity")
pacbio_colours <- geom_bar(colour = "#908f8f", stat = "identity")

set_scale_x <- scale_x_continuous(breaks = seq(0, 30000, 5000), limits=c(0, 30001))
set_scale_y <- scale_y_continuous(breaks = seq(0, 10000, 2000), limits=c(0, 10001))
pb_scale_y <- scale_y_continuous(breaks = seq(0, 3000, 600), limits=c(0, 3001))
set_coord <- coord_cartesian(xlim = c(0, 30001))

ont = read.csv("ont_reads.txt", sep="", header=FALSE)
ont_plot <- ggplot(ont, aes(x=V2, y=V1)) + ont_colours + set_scale_x + set_scale_y + set_coord + ggtitle("ONT: Read Length Distribution") + my_theme

pacbio = read.csv("pacbio_reads.txt", sep="", header=FALSE)
pacbio_plot <- ggplot(pacbio, aes(x=V2, y=V1)) + pacbio_colours + set_scale_x + pb_scale_y + set_coord + ggtitle("PacBio: Read Length Distribution") + my_theme

library(cowplot)
library(grid)
library(gridExtra)

# rl refers to read length
rl_plots <- plot_grid(pacbio, ont, ncol=2, labels = "AUTO", label_size = 10, align = 'hv')

#create common x and y labels
y.grob <- textGrob("Read Count", gp=gpar(fontface="bold", col="black", fontsize=12), rot=90)
x.grob <- textGrob("Read Length (basepairs)", gp=gpar(fontface="bold", col="black", fontsize=12))

#add to plot
fp <- grid.arrange(arrangeGrob(rl_plots, left = y.grob, bottom = x.grob))

# save a final image of all plots
ggsave(fp, file="read_length_plots.png", dpi=300, width=14, height=14, scale=1, type="cairo-png")
```
