# load packages ----
library(fresh)

# create theme ----

create_theme(
  
  # change "light-blue" / primary color
  adminlte_color(
    
    light_blue = "darkblue" # dark blue #150B5A
    
  ),
  
  # dashboardBody styling (includes boxes)
  adminlte_global(
    
    content_bg = "cornflowerblue"
    
  ),
  # dashboardSidebar styling
  adminlte_sidebar(
    
    width = "400px",
    dark_bg = "lightblue",
    dark_hover_bg = "seagreen",
    dark_color = "grey"
    
  ),
  
  
  output_file = "shinydashboard/www/dashboard-fresh-theme.css"
  
  
  
)