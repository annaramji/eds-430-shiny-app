#
# dashboard header ----

header <- dashboardHeader(
  
  # title ----
  title = "Fish Creek Watershed Lake Monitoring", # everything to the left of the sidebar menu button (3 lines)
  titleWidth = 400
  
) # END dashboardHeader


# dashboard sidebar ----

sidebar <- dashboardSidebar(
  
  # sidebarMenu ----
  sidebarMenu(
    
    menuItem(text = "Welcome", tabName = "welcome", icon = icon("star")),
    menuItem(text = "Dahboard", tabName = "dashboard", icon = icon("gauge"))
    
  ) # END sidebarMenu
  
  
) # END dashboardSidebar

# dashboard body ----

body <- dashboardBody(
  
  # tabItems ----
  
  # welcome tabItem ----
  tabItems(
    tabItem(tabName = "welcome",
            
            # columns need to add to 12
            
            # left-hand column ----
            column(width = 6,
                   
                   # background info box ----
                   box(width = NULL,
                       
                       title = tagList(icon("water"),
                                       strong("Monitoring Fish Creek Watershed")), 
                       includeMarkdown("text/intro.md")
                       
                       ) # END background info box
              
            ), # END left-hand column
            
            # right-hand column ----
            column(width = 6,
                   
                   # first fluidRow ----
                   fluidRow(
                     
                     # citation box ----
                     box(width = NULL,
                         
                         title = tagList(icon("table"),
                                         strong("Data Source")),
                         includeMarkdown("text/citation.md")
                         
                     ) # END citation box
                     
                   ), # END first fluidRow
                   
                   # second fluidRow ----
                   fluidRow(
                     
                     # disclaimer box ----
                     box(width = NULL,
                         
                         title = tagList(icon("triangle-exclamation"),
                                         strong("Disclaimer")),
                         includeMarkdown("text/disclaimer.md")
                         
                     ) # END disclaimer box
                     
                   ) # END second fluidRow
                   
            ) # END right-hand column
            
            
            
            
            
    ), # END welcome tabItem 
    
    # dashboard tabItem ----
    tabItem(tabName = "dashboard",
            
            # fluidRow ----
            fluidRow(
              # all boxes need to add to 12
              
              # input box ----
              box(width = 4,
                  
                  title = tags$strong("Adjust lake parameter ranges:"),
                  
                  # sliderInputs ----
                  # elevation slider
                  sliderInput(inputId = "elevation_slider_input",
                              label = "Elevation (meters above SL):",
                              min = min(lake_data$Elevation),
                              max = max(lake_data$Elevation),
                              value = c(min(lake_data$Elevation),
                                        max(lake_data$Elevation))
                              ), # END elevation slider
                  
                  # depth slider
                  sliderInput(inputId = "depth_slider_input",
                              label = "Average Depth (meters):",
                              min = min(lake_data$AvgDepth),
                              max = max(lake_data$AvgDepth),
                              value = c(min(lake_data$AvgDepth),
                                        max(lake_data$AvgDepth))
                              ) , # END depth slider
                  
                  # temperature slider
                  sliderInput(inputId = "temp_slider_input",
                              label = "Average Temperature (ºC):",
                              min = min(lake_data$AvgTemp),
                              max = max(lake_data$AvgTemp),
                              value = c(min(lake_data$AvgTemp),
                                         max(lake_data$AvgTemp))
                              ) # END temperature slider


              ), # END input box
              
              # leaflet box
              box(width = 8,
                
                title = tags$strong("Monitored lakes within Fish Creek Watershed:"),
                
                # leaflet output ----
                leafletOutput(outputId = "lake_map_output") |> 
                  withSpinner(type = 1, color = "#4287f5")
                
              ) # END leaflet box
              
              
            ) # END fluidRow
            
            
            
    ) # END dashboard tabItem 
    
  ) # END tabItems
  
) # END dashboardBody


# combine all in a dashboard page ----
dashboardPage(header, sidebar, body)
