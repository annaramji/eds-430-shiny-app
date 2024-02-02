# load packages ----
library(shiny)
library(shinyWidgets)
library(palmerpenguins)
library(tidyverse)


# import functions (if necessary) ----
# we have separate files for each function. some people also put a bunch of small functions in one file called utils.R
source("R/penguinSpp-pickerInput.R") # will source automatically with Shiny v1.5.0
