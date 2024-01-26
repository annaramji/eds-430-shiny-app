# drafting objects for single-file-app 


# load packages ----
library(palmerpenguins)
library(tidyverse)

# practice filtering data outside before bringing it into shiny

# filter penguins df for obs where body mass is >= 3000 & <= 4000 ----
body_mass_df <- penguins |> 
  filter(body_mass_g %in% c(3000:4000)) # this is what you'd want to be update-able


# create scatterplot ----
# for outputId bodyMass_scatter_plot, renderPlot ({ this code })
ggplot(na.omit(body_mass_df), 
       aes(x = flipper_length_mm, y = bill_length_mm, 
           color = species, shape = species)) +
  geom_point() +
  # adding Species name assignment to colors and shapes to avoid auto-assigning at selective ranges (i.e., Gentoo becomes orange circle at 5-6000 range, which is confusing/bad for user)
  scale_color_manual(values = c("Adelie" = "darkorange", "Chinstrap" = "purple", "Gentoo" = "cyan4")) +
  scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15)) +
  labs(x = "Flipper length (mm)", y = "Bill length (mm)", 
       color = "Penguin species", shape = "Penguin species") +
  theme_minimal() +
  theme(legend.position = c(0.85, 0.2),
        legend.background = element_rect(color = "white"))


# live-coding

ggplot(na.omit(penguins),
       aes(x = flipper_length_mm,
           y = bill_length_mm,
           color = species,
           shape = species)) +
  geom_point() +
  # add Allison's colors
  scale_color_manual(values = c("darkorange", "purple", "cyan4")) +
  scale_shape_manual(values = c(19, 17, 15)) +
  labs(x = "Flipper length (mm)", y = "Bill length (mm)",
       color = "Penguin species", shape = "Penguin species") +
  theme_minimal() +
  # move legend and update background color
  
  theme(legend.position = c(0.85, 0.2), # x,y coordinate to move the legend (can also say top, bottom, corner, etc.)
        legend.background = element_rect(color = "white")
        )


# building filtered year datatable

year_df <- penguins |> 
  filter(year %in% c(2007, 2008, 2009))
