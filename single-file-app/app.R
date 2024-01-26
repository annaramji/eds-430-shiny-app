# load packages
library(shiny)
library(palmerpenguins)
library(tidyverse)

# user interface ----
# standard naming convention
# fluidPage creates the user interface that allows people to view it in the browser, does stuff under the hood. If we want to see stuff rendered in our UI, we'll need to add it in fluidPage
ui <- fluidPage(
  
  # app title ----
  # update styling with parallel common HTML tags
  # style our text by adding static HTML elements using tags – a list of functions that parallel common HTML tags (e.g. <h1> == tags$h1()) The most common tags also have wrapper functions (e.g. h1()).
  tags$h1("My App Title") ,
  
  # app subtitle ----
  h4(strong("Exploring Antarctic Penguin Data")), # alternatively, `tags$h4(tags$strong("text"))
  
  # body mass slider input ----
  sliderInput(inputId = "body_mass_input", 
              label = "Select a range of body masses (g):",
              min = 2700,
              max = 6300,
              # value = initial value(s) of the slider
              value = c(3000, 4000)),
  
  # body mass slider output ----
  plotOutput(outputId = "bodyMass_scatterplot_output"),
  
  # add year check box ----
  checkboxGroupInput(inputId = "year_input", label = "Selected year(s): ",
                     choices = c("This is the year 2007"= 2007, 2008, 2009),
                     selected = c("2007", "2008")),
  
  # add data table output ----
  DT::dataTableOutput(outputId = "year_datatable_output")
  
  
)


# server instructions ----
# standard naming convention
# function takes inputs and outputs, we'll define these later
server <- function(input, output) {
  # filter body masses
  # reactive dataframe - based on inputs taht are supplied
  body_mass_df <- reactive({
    
    penguins |> 
      filter(body_mass_g %in% c(input$body_mass_input[1]:input$body_mass_input[2])) # first value of slider, second value of slider
    
    
  })
  
  
  # render penguin body mass scatter plot ----
  output$bodyMass_scatterplot_output <- renderPlot({
    
    # code to generate scatterplot here
           # our reactive df  followed by ()
    ggplot(na.omit(body_mass_df()),
           aes(x = flipper_length_mm,
               y = bill_length_mm,
               color = species,
               shape = species)) +
      geom_point() +
    # add Allison's colors
    # adding Species name assignment to colors and shapes to avoid auto-assigning at selective ranges (i.e., Gentoo becomes orange circle at 5-6000 range, which is confusing/bad for user)
      scale_color_manual(values = c("Adelie" = "darkorange",
                                    "Chinstrap" = "purple",
                                    "Gentoo" = "cyan4")) +
      scale_shape_manual(values = c("Adelie" = 19,
                                    "Chinstrap" = 17,
                                    "Gentoo" = 15)) +
      labs(x = "Flipper length (mm)",
           y = "Bill length (mm)",
           color = "Penguin species",
           shape = "Penguin species") +
      theme_minimal() +
      # move legend and update background color
      
      theme(legend.position = c(0.85, 0.2), # x,y coordinate to move the legend (can also say top, bottom, corner, etc.)
            legend.background = element_rect(color = "white")
      )
    
  })
  
  
  # filter data frame for years from checkbox input to feed into data table output ----
  years_df <- reactive({
    
    penguins |> 
    filter(year %in% c(input$year_input))
    
  })
  
  
  # build data table output ----
  output$year_datatable_output <- DT::renderDataTable({
    
    DT::datatable(years_df(),
                  options = list(pagelength = 10),
                  rownames = FALSE)
    
  })
  
  
}


# combine UI & server into an app ----
# takes 2 arguments typically, ui and server.
shinyApp(ui = ui, server = server)