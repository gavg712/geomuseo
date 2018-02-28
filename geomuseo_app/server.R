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
  
  output$table <- DT::renderDataTable(
    serv_input %>%
      select(Imagen, Muestra = nombre, Código = codigo, Tipo = muestra) %>%
      filter(Tipo == input$tipo) %>%
      arrange(Muestra) %>%
    DT::datatable(escape = F, 
                  selection = "single", 
                  options = list(pageLength = 5)), 
    server = FALSE
    )

  observeEvent(input$table_rows_selected,
               {
                 showModal(modalDialog(
                   title = paste("Muestra:", serv_input$nombre[input$table_rows_selected],
                                 "Código:", serv_input$codigo[input$table_rows_selected]),
                   div(helpText("Un marcador ha sido agregado en el mapa,
                                puede consultar más información haciendo clic sobre él"), 
                       HTML(serv_input$Imagen2[input$table_rows_selected])),
                   easyClose = TRUE,
                   footer = modalButton("Cerrar"), 
                   size = "m"
                 ))
               })
  
  output$map <- renderLeaflet({
    splayer <- all_fichas
    coordinates(splayer) <- ~x+y
    proj4string(splayer) <- CRS("+init=epsg:32718")
    splayer <- spTransform(splayer, CRS("+init=epsg:4326"))
    
    selected = input$table_rows_selected
    filtered = input$table_rows_all
    
    m <- leaflet() %>%
      addProviderTiles(providers$OpenStreetMap, group = "OSM:Base") %>%
      addProviderTiles(providers$Esri.WorldImagery , group = "ESRI:Satallite")
    
    m <- if(length(filtered)){
      m %>% 
        addCircleMarkers(data = splayer[filtered,],
                         label = ~htmlEscape(codigo))     
    } else {
      m %>% 
        addCircleMarkers(data = splayer) 
    }
    if (length(selected)) {
      m <- m %>% 
        addMarkers(data = splayer[selected,], 
                   popup = ~paste(paste0("<a href='",file.path("fotos", foto),
                                         "' target='_blank'><img src='",
                                         file.path("fotos", foto),
                                         "' style='width:100px'> </a>"),
                                  "<br><strong>Nombre:</strong>", nombre,
                                             "<br><strong>Codigo:</strong>", codigo),
                   icon=icon("check", "fa-check-circle"))
    }
    m <- m  %>%
      #setView(-77.81, -0.98, zoom = 10) %>%
      addLayersControl(
        baseGroups = c("OSM:Base","ESRI:Satallite"),
        options = layersControlOptions(collapsed = TRUE)) %>%
      addMeasure(position = "topleft",
                 primaryLengthUnit = "meters",
                 primaryAreaUnit = "sqmeters",
                 activeColor = "#3D535D",
                 completedColor = "#7D4479"
      ) %>%
      addScaleBar()
    m
  })
  
  # print the selected indices
  output$selectedRows = renderPrint({
    s = input$table_rows_selected
    if (length(s)) {
      cat('A marker is showed on the map for selected samples:\n\n')
    }
  })
}

