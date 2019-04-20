## How to create euler (more accurate than venn!) diagram

# Set directory to save 
setwd("/full/path/")

# Load packages
library(eulerr)
library(gridExtra)

## Creating two euler diagrams here and displaying them in a grid-based layout

# Define values for unique and interval data
waffles <- euler(c("British Waffles" = 5569, "Swedish Waffles" = 7052, "British Waffles&Swedish Waffles" = 5256))

plot(waffles, key = TRUE, quantities = TRUE, counts = TRUE, legend = FALSE, type = c("regionError"), edges = FALSE)

# percentage values are optional
plot_waffles <- plot(waffles, fills = list(fill = c("red","steelblue"), alpha = 0.7),
            lty=0,
            legend = list(labels = c("British_Waffles", "Swedish_Waffles")),
            fontsize = 10,
            quantities = c("5569\n32.3%", "6052\n37.6%", "7256\n30.1%"), 
            fontsize = 10)
make_waffles

# Define values for unique and interval data
pancakes <- euler(c("British Waffles" = 5820, "Swedish Waffles" = 7101, "British Waffles&Swedish Waffles" = 6287))

plot(pancakes, key = TRUE, quantities = TRUE, counts = TRUE, legend = FALSE, type = c("regionError"), edges = FALSE)

# percentage values are optional
plot_pancakes <- plot(pancakes fills = list(fill = c("red","steelblue"), alpha = 0.7),
            lty=0,
            legend = list(labels = c("British_Pancakes", "Swedish_Pancakes")),
            fontsize = 10,
            quantities = c("5820\n31%", "7101\n36.1%", "6287\n32.9%"), 
            fontsize = 10)
plot_pancakes

grid.arrange(plot_waffles, plot_pancakes, nrow = 2)
grid.text("LABEL")
