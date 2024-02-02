# Load Packages ----
library(shiny)
library(shinydashboard)
library(tidyverse)
library(leaflet)
library(shinycssloaders)
library(markdown)


# Read in Data ----
# don't use here() in app files

# you cannot run different elements of your shiny app within your shiny app files
# (so don't try to run this line separately)

lake_data <- read_csv("data/lake_data_processed.csv")





