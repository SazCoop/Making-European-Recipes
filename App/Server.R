library(shiny)


shinyServer(function(input, output) {
  
  
  sliderValues <- reactive({
    grams <- input$integer
    ml <- input$integer1
    outputi <- as.vector(input$checkGroup)
    
    if(is.na(outputi[1])){
      cups <- "Not asked for"
    }
    else{
      cups <- (grams/236.5882375)
    }
    
    if(is.na(outputi[2])){
      ounces <- "Not asked for"
    }
    else{
      ounces <- (grams/28.3495)
    }
    
    if(is.na(outputi[3])){
      cupsliq <- "Not asked for"
    }
    else{
      cupsliq <- (ml/236.5882375)
    }
    
    
    
  
    data.frame(
      Name = c("Input Grams","Input ML","Output Cups","Output Ounces","Output Cups(Liquid)"),
      Value = as.character(c(grams,ml,cups,ounces,cupsliq))
    )
  })
  
  # Show the values using an HTML table
  output$table <- renderDataTable({
    sliderValues()
  })
  
  output$downloadData <- downloadHandler(
    filename = "recipe",
    content = function(file) {
      table <- sliderValues()
      write.csv(table, file)
    }
  )
  
  
  
})