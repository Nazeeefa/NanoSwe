library(cowplot)
library(grid)
library(gridExtra)

# Combine using cowplot
# p1,p2,p3,p4 are variables assigned to plot scripts
lr <- cowplot::plot_grid(p1, p2, p3, p4, nrow=4)

#Create common x and y labels to avoid repetition
y.grob <- textGrob("Count of SVs", gp=gpar(fontface="bold", col="black", fontsize=12), rot=90)

x.grob <- textGrob("Length in basepairs (bp)", gp=gpar(fontface="bold", col="black", fontsize=12))

#Add to plot
fp <- grid.arrange(arrangeGrob(lr, left = y.grob, bottom = x.grob))

#Save a final image that displays all plots
ggsave(fp, file="length_profiles.png", dpi=300, width=10, height=10, scale=1, type="cairo-png")

#Resulting figure is shown as figure 2.
