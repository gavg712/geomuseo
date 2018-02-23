library(tidyverse)
library(DT)
library(leaflet)
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

  output$map <- renderLeaflet({
    splayer <- all_fichas
    coordinates(splayer) <- ~x+y
    proj4string(splayer) <- CRS("+init=epsg:32718")
    splayer <- spTransform(splayer, CRS("+init=epsg:4326"))
    leaflet(data = splayer) %>%
      addProviderTiles(providers$Stamen.Terrain) %>%
      setView(-77.81, -0.98, zoom = 10) %>%
      addCircleMarkers(label = ~htmlEscape(codigo), popup = ~htmlEscape(nombre)) %>%
      addMeasure(
        position = "topleft",
        primaryLengthUnit = "meters",
        primaryAreaUnit = "sqmeters",
        activeColor = "#3D535D",
        completedColor = "#7D4479"
      ) %>%
      addScaleBar()
  })
}

