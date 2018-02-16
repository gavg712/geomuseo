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
    data <- read_csv("www/ficha.csv") %>%
      mutate(FOTO = paste0("<a href='",file.path("fotos", FOTO),
                           "' target='_blank'><img src='",
                           file.path("fotos", FOTO),
                           "' style='width:100px'> </a>"
      ),
             FECHA = dmy(FECHA))
    DT::datatable(data, escape = F)
  })
}

