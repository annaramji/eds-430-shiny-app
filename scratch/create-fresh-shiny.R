# you can build on pre-made themes with this too
fresh::create_theme(
  
  theme = "default", # standard shiny app theme
  # you can supply a bootstrap theme to begin with
  
  # global styling
  bs_vars_global(
    
    body_bg = "maroon",
    text_color = "white",
    link_color = "seagreen"
    
    
  ),
  
  bs_vars_navbar(
    
    default_bg = "cornflowerblue",
    default_color = "grey",
    
  ),
  
  bs_vars_tabs(
    
    border_color = "darkorange"
    
  ),
  
  
  output_file = "two-file-app/www/shiny-fresh-theme.css"
  
  
  
) # END create_theme
