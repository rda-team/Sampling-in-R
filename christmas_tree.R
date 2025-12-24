# load libraries
library(ggplot2)
library(dplyr)
library(gganimate)

#create data 
set.seed(123)
n <- 2000

tree <- data.frame(
  x = runif(n, -3,3),
  y = runif (n, 0,10)) %>%
  filter (abs(x) < (10-y)/3) %>%
  mutate(
    color = sample(c("darkgreen", "forestgreen", "seagreen"), n(), replace = TRUE),
    frame = sample (1:3, n(), replace = TRUE)
)

#add ornaments
ornaments <- data.frame(
  x = runif(90, -3, 3),
  y = runif(90, 0,10)) %>%
  filter (abs(x) < (10-y)/3) %>%
  mutate(
    color = sample(c("red", "gold", "blue", "purple", "orange"), n(), replace = TRUE),
    frame = sample (1:3, n(), replace = TRUE)
)

# add tree trunk
trunk <- data.frame(
  x = c(-0.5, -0.5, 0.5, 0.5),
  y = c(-1, 0, 0, -1)
)

# create plot

p <- ggplot() +
  geom_point(data = tree, aes(x = x, y = y, color = color, frame = frame), size = 2, alpha = 0.8) +
  geom_point(data = ornaments, aes(x = x, y = y, color = color, frame = frame), size = 5) +
  geom_polygon(data = trunk, aes(x,y), fill = "saddlebrown") +
  scale_color_identity() +
  theme_void() +
  ggtitle("Merry Christmas 2025",
          subtitle = "Research & Data Analytics") +
  theme(
    plot.title = element_text(hjust = 0.5, size = 20, face = "bold", color = "darkred"),
    plot.subtitle = element_text(hjust = 0.5, size = 14, face = "italic", color = "darkgreen")
  )

# animate the plot
anim <- p + transition_states(frame, transition_length = 1, state_length = 1) +
  ease_aes('sine-in-out')
animate(anim, nframes = 60, fps = 10, width = 600, height = 800)

#save it 
anim_save("3christmas_tree.gif")

#Thank You ....... 
