library(tidyverse)
library(DT)
function(input, output, session) {
  output$plot <- renderPlot({
    p <- ggplot(cars, aes(speed, dist))
    if (input$plotType == "p"){
      p + geom_point()
    } else if (input$plotType == "l") {
      p + geom_line()
    } else {
      p
    }
  })
  
  output$summary <- renderPrint({
    summary(cars)
  })
  
  output$table <- DT::renderDataTable({
    DT::datatable(serv_input, escape = F)
  })
}

