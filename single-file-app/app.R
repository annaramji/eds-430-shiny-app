# load packages
library(shiny)

# user interface ----
# standard naming convention
# fluidPage creates the user interface that allows people to view it in the browser, does stuff under the hood. If we want to see stuff rendered in our UI, we'll need to add it in fluidPage
ui <- fluidPage()


# server instructions ----
# standard naming convention
# function takes inputs and outputs, we'll define these later
server <- function(input, output) {}


# combine UI & server into an app ----
# takes 2 arguments typically, ui and server.
shinyApp(ui = ui, server = server)