# ----------------------- Setup --------------------------- #
# load packages ----
library(tidyverse)
library(leaflet)

# read in data ----
lake_data <- read_csv(here::here("shinydashboard", "data", "lake_data_processed.csv"))


# ------------------ Practice Filtering ----------------- 
# these will be replaced with our sliders for our user interface widgets

filtered_lakes <- lake_data |> 
  # elevation between 8 and 20
  filter(Elevation >= 8 & Elevation <= 20) |> 
  
  # avg depth between 2 and 3 meters
  filter(AvgDepth >= 2 & AvgDepth <= 3) |>
  
  # avg temp between 4 and 6 ºC
  filter(AvgTemp >= 4 & AvgTemp <= 6)





# ------------------- Practice Viz ---------------------- 

leaflet() |> 
  
  # add tiles
  addProviderTiles(providers$Esri.WorldImagery
                 #  ,
                  # options = providerTileOptions(maxNativeZoom = 19, maxZoom = 100)
                   ) |> # make note of using appropriate tiles
  
  # set view over Alaska (AK)
  setView(lng = -152.048442, lat = 70.249234, zoom = 6) |> 
  
  # add mini map
  addMiniMap(toggleDisplay = TRUE, minimized = FALSE) |> 
  
  # add markers
  addMarkers(data = filtered_lakes,
             lng = filtered_lakes$Longitude,
             lat = filtered_lakes$Latitude,
             popup = paste0("Site Name: ", filtered_lakes$Site, "<br>",
                            "Elevation: ", filtered_lakes$Elevation, " meters (above SL)", "<br>",
                            "Avg Depth: ", filtered_lakes$AvgDepth, " meters", "<br>",
                            "Avg Lake Bed Temperature: ", filtered_lakes$AvgTemp, "\u00B0C" # note: Unicode for degree C symbol icon 
                            )
             )
