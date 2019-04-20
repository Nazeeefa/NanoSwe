# How to create a pairwise venn diagram using ggplot2
###################################

# Set sizes (define values)
uniqA <- 600
intersect <- 700
uniqB <- 800

# Set A and B names:
nameA <- "Waffles"
nameB <- "Pancakes"

# Data frame to draw circles
draw_circle <- data.frame(
	x = c(-1, 1),
	y = c(1, 1),
	set = c(nameA, nameB))

# Data frame for annotation
set.sizes <- data.frame(
	x = c(-2, 0, 2),
	y = 1,
	num_elements = c(uniqA, intersect, uniqB))

# Estimate percentage for intervals and non-intervals
set.sizes$total <- sum(set.sizes$num_elements)
set.sizes$percent_elements <- set.sizes$num_elements/set.sizes$total * 100

# Load packages
library(ggplot2)
library(ggforce)

# Plot a venn diagram
ggplot() +

	# Drawing venn circles; coord_fixed is used for true circularity i.e. ensures a ratio (1 is default) 
	geom_circle(aes(x0=x, y0=y , r = 1.5, fill = set), draw_circle = draw_circle, size = 0.3, alpha = 0.3, radius = 0.05, colour = 'grey') +
  coord_fixed() +
	
	# Labelling venn diagram
  ## nudge_y defines y position of label, it is a brief version of writing e.g. position = position_nudge(y = -0.1)).
  ## Make sure nudge_y/position_nudge is out of aesthetics!
	geom_text(data = set.sizes, aes(x = x, y = y, label = num_elements)) +
	geom_text(data = set.sizes, aes(x = x, y = y, label = paste0(round(percent_elements, 	digits = 1), "%")), nudge_y = -0.1) +
	
	# Theme details
	theme_void() +
	theme(legend.position="bottom") +
  scale_fill_manual(values = c('steelblue', 'grey')) +
  scale_colour_manual(values = c('steelblue', 'grey'), guide = FALSE) +
  labs(fill = NULL)
