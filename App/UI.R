library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Cooking European Recipes in the US"),
  
  sidebarLayout(
    sidebarPanel("Recipe Measurement Conversions",
     
      sliderInput("integer", "Solid Grams:", min=0, max=1000, value=500),
      
      sliderInput("integer1", "Liquid Millilitres:",  min=0, max=1000, value=500),
      
      checkboxGroupInput("checkGroup", label = h3("Output in what Measurement"), 
                         choices = list("Ounces" = 1, "Cups for dry" = 2, "Cups for Liquid" = 3),
                         selected = 1),
      downloadButton('downloadData', 'Download')
    ),
    
    # Show a table summarizing the values entered
    mainPanel(
      h3("These are the measurements you can use to make your perfect recipe:"),
      h4("Author: Sarah Cooper"), 
      dataTableOutput('table'),
      img(src='myImage.jpg', align = "right")
    )
  )
))