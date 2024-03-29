# user interface ----
ui <- navbarPage(
  
  # add css file ----
  header = tags$head(
    tags$link(rel = "stylesheet",
              type = "text/css",
              href = "sass-styles.css")
  ),
  
  # add title
  title = "LTER Animal Data Explorer",
  
  # (page 1) intro tabPanel ----
  tabPanel(title = "About this page",
           
           # introtext fluidRow ----
           fluidRow(
             
             column(1), # buffer
             # full width = 12 (always needs to add to 12)
             column(10, includeMarkdown("text/about.md")),
             column(1) # gives buffer room alongside text
             
           ), # END introtext fluidRow
           
           # adds row 
           hr(),
           
           includeMarkdown("text/footer.md")
           
  ), # END (page 1) intro tabPanel
  
  # (Page 2) data viz tabPanel ----
  tabPanel(title = "Explore the Data",
           
           # tabsetPanel to contain tabs for data viz ----
           tabsetPanel(
             
             # trout tabPanel ----
             tabPanel(title = "Trout",
                      
                      # trout sidebarLayout ----
                      sidebarLayout(
                        
                        # trout sidebarPanel ----
                        sidebarPanel(
                          
                          # channel type pickerInput ----
                          pickerInput(inputId = "channel_type_input",
                                      label = "Select channel type(s):",
                                      choices = unique(clean_trout$channel_type), # produces a vector, all the same data type. alternatively: choices = c("rapid", "cascade" ...)
                                      selected = c("cascade", "pool"),
                                      options = pickerOptions(actionsBox = TRUE), # lets you select all or deselect all 
                                      multiple = TRUE # you can select multiple channel type options
                          ), # END channel type pickerInput
                          
                          # section checkboxGroupButtons ----
                          checkboxGroupButtons(inputId = "section_input",
                                               label = "Select a sampling section(s):",
                                               choices = c("clear cut forest", "old growth forest"),
                                               selected = c("clear cut forest", "old growth forest"),
                                               individual = FALSE,
                                               justified = TRUE, # width of buttons take up full width of parent div (width of sidebar panel in this case)
                                               size = "sm", # small buttons
                                               # add icons to buttons that change as they're toggled on and off
                                               checkIcon = list(yes = icon(name = "square-check"),
                                                                no = icon(name = "xmark"))
                                               
                          ) # END section checkboxGroupButtons
                          
                        ), # END trout sidebarPanel
                        
                        # trout main panel ----
                        mainPanel(
                          
                          # trout scatterplot output ----
                          plotOutput(outputId = "trout_scatterplot_output") |> 
                            shinycssloaders::withSpinner(color = "#9F4A96",
                                                         type = 5)
                          
                        ) # END trout mainPanel
                        
                      ) # END trout sidebarLayout
                      
             ), # END trout tabPanel
             
             # penguins tabPanel ----
             tabPanel(title = "Penguins",
                      
                      # penguin sidebarLayout ----
                      sidebarLayout(
                        
                        # penguin sidebarPanel ----
                        sidebarPanel(
                          
                          # island pickerInput ----
                          pickerInput(inputId = "island_input",
                                      label = "Select Island(s):",
                                      choices = unique(penguins$island),
                                      selected = c("Dream", "Torgersen"),
                                      options = pickerOptions(actionsBox = TRUE),
                                      multiple = TRUE # select multiple islands
                          ), # END island pickerInput
                          
                          # bin number (bins) sliderInput ----
                          sliderInput(inputId = "bins_input",
                                      label = "Select number of bins:",
                                      min = 0,
                                      max = 100,
                                      value = 25
                          ) # END bin number sliderInput
                          
                        ), # END penguin sidebarPanel
                        
                        # penguin mainPanel ----
                        mainPanel(
                          
                          # penguins scatterplot output ----
                          plotOutput(outputId = "penguins_scatterplot_output") |> 
                            shinycssloaders::withSpinner(color = "cyan4",
                                                         type = 5,
                                                         size = 2)
                          
                        ) # END mainPanel 
                        
                      ) # END penguin sidebarLayout
                      
             ) #END penguins tabPanel
             
           ) # END tabsetPanel
           
  ) # END Page 2) data viz tabPanel
  
) # END navbarPage

