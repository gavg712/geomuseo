library(tidyverse)
library(DT)
library(leaflet)
function(input, output, session) {
  serv_input <- reactive({
    x <- data %>%
      filter(FECHA >= input$filtrofecha[1],
             FECHA <= input$filtrofecha[2])
  
    if(length(input$filtrotipo)) {
      x <- x %>%
        filter(TIPO_MUESTRA %in% input$filtrotipo)
    } 
    
    if(length(input$filtroformacion)){
      x <- x %>%
        filter(FORMACION %in% input$filtroformacion)
    }
    x
  })
  
  formChoices <- reactive({
    d <- data
    if(length(input$filtrotipo)) {
      d <- d %>%
        filter(TIPO_MUESTRA %in% input$filtrotipo)
    } 
    return(c("Choose one" = "", unique(as.character(d$FORMACION))))
  })

  observe({
    updateSelectInput(session, 
                      inputId = "filtroformacion",
                      choices = formChoices())
  })
  
  output$table <- DT::renderDataTable(
    serv_input() %>%
      select(Foto = htmlImagen, 
             Muestra = NOMBRE_ROCA, 
             Código = CODIGO, 
             Tipo = TIPO_MUESTRA,
             Formación = FORMACION,
             Localidad = LOCALIDAD) %>%
      DT::datatable(escape = F, 
                    selection = "single", 
                    options = list(pageLength = 4, scrollX = TRUE)), 
    server = TRUE
  )
  
  observeEvent(input$table_rows_selected,
               {
                 showModal(modalDialog(
                   title = paste("Muestra:", serv_input()$NOMBRE_ROCA[input$table_rows_selected],
                                 "Código:", serv_input()$CODIGO[input$table_rows_selected]),
                   tabsetPanel(
                     tabPanel("Ficha", 
                              fluidRow(class="container-fluid",
                                fluidRow(
                                  column(width = 6,
                                         img(style="float: left; margin-left: 25%", src="Ikiam.png", width="50%")
                                  ),
                                  column(width = 6,
                                         img(style="float: right; margin-right: 25%", src="Logo.jpg", width="50%")
                                  )
                                ),
                                fluidRow(class="text-center",
                                         h3("Laboratorio de Petrografía")
                                ),
                                fluidRow(class="container-fluid",
                                          fluidRow(
                                            column(width = 6,
                                                   fluidRow(
                                                     column(width = 4,strong("Autor:")),
                                                     column(width = 8,serv_input()$AUTOR[input$table_rows_selected])
                                                   ),
                                                   fluidRow(
                                                     column(width = 4,strong("Fecha:")),
                                                     column(width = 8,serv_input()$FECHA[input$table_rows_selected])
                                                   ),
                                                   fluidRow(
                                                     column(width = 4,strong(" Coordenadas:")),
                                                     column(width = 8,
                                                            "epsg:32718", br(),
                                                            serv_input()$X[input$table_rows_selected], "E", br(),
                                                            serv_input()$Y[input$table_rows_selected], "N")
                                                   ),
                                                   fluidRow(
                                                     column(width = 4,strong("Localidad:")),
                                                     column(width = 8,serv_input()$LOCALIDAD[input$table_rows_selected])
                                                   ),
                                                   fluidRow(
                                                     column(width = 4,strong("Formación:")),
                                                     column(width = 8,serv_input()$FORMACION[input$table_rows_selected])
                                                   )
                                            ),
                                            column(width = 6,
                                                   fluidRow(img(class = "img-rounded", 
                                                                src = file.path("fotos",serv_input()$FOTOS[input$table_rows_selected]),
                                                                style='width:80%;')),
                                                   fluidRow(
                                                     column(width = 4,strong("Nombre de roca:")),
                                                     column(width = 8,serv_input()$NOMBRE_ROCA[input$table_rows_selected])
                                                   ),
                                                   fluidRow(
                                                     column(width = 4,strong("Código de roca:")),
                                                     column(width = 8,serv_input()$CODIGO[input$table_rows_selected])
                                                   )
                                            )
                                          ),
                                         fluidRow(class="container-fluid",
                                                  strong("Descripción Macroscópica:"), 
                                                  br(),
                                                  serv_input()$DESC_MACRO[input$table_rows_selected]
                                         ),
                                         fluidRow(class="container-fluid",
                                                  strong("Descripción Microscópica:"), 
                                                  br(),
                                                  serv_input()$DESC_MICRO[input$table_rows_selected]
                                         ),
                                         fluidRow(class="container-fluid text-center",
                                                  column(6, 
                                                         img(class = "img-circle", alt = "Foto: Nícoles paralelos", src="ND.png", width="80%"),
                                                         p(strong("Foto:"), "Nícoles paralelos")
                                                  ),
                                                  column(6, 
                                                         img(class = "img-circle", alt = "Foto: Nícoles cruzados", src="ND.png", width="80%"),
                                                         p(strong("Foto:"), "Nícoles cruzados")
                                                  )
                                         )
                                )
                              ),
                              helpText("NOTA: Un marcador ha sido agregado en el mapa,
                                puede consultar más información haciendo clic sobre él")
                              ),
                     tabPanel("Foto ampliada", 
                              HTML(serv_input()$htmlImagen2[input$table_rows_selected]), 
                              helpText("NOTA: Un marcador ha sido agregado en el mapa,
                                puede consultar más información haciendo clic sobre él")
                              )
                     ),
                   easyClose = TRUE,
                   footer = modalButton("Cerrar"), 
                   size = "l")
                 )
               })
  
  output$map <- renderLeaflet({
    splayer <- serv_input() %>% 
      mutate(x = X, y = Y) %>% 
      as.data.frame()
    if(nrow(splayer)){
      coordinates(splayer) <- ~x+y
      proj4string(splayer) <- CRS("+init=epsg:32718")
      splayer <- spTransform(splayer, CRS("+init=epsg:4326"))
      
      selected = input$table_rows_selected
      filtered = input$table_rows_all
      
      m <- leaflet() %>%
        addProviderTiles(providers$Stamen.Terrain, group = "Stamen: Terrain") %>%
        addProviderTiles(providers$OpenStreetMap, group = "OSM: Base") %>%
        addProviderTiles(providers$Esri.WorldImagery , group = "ESRI: Satellite")
      
      if(length(filtered)){
        m <- m %>% 
          addCircleMarkers(data = splayer[filtered,],
                           label = ~htmlEscape(CODIGO))     
      } else {
        m <- m %>% 
          addCircleMarkers(data = splayer) 
      }
      
      if (length(selected)) {
        m <- m %>% 
          addMarkers(data = splayer[selected,], 
                     popup = ~paste("<strong>Nombre:</strong>", NOMBRE_ROCA,
                                    "<br><strong>Localidad:</strong>", LOCALIDAD, 
                                    "<br><strong>Formación:</strong>", FORMACION, 
                                    "<br><strong>UTM 18S X:</strong>", X,
                                    "<br><strong>UTM 18S Y:</strong>", Y)
                     )
      }
      m <- m  %>%
        #setView(-77.81, -0.98, zoom = 10) %>%
        addLayersControl(
          baseGroups = c("Stamen: Terrain", "OSM: Base","ESRI: Satellite"),
          options = layersControlOptions(collapsed = TRUE)) %>%
        addMeasure(position = "topleft",
                   primaryLengthUnit = "meters",
                   primaryAreaUnit = "sqmeters",
                   activeColor = "#3D535D",
                   completedColor = "#7D4479"
        ) %>%
        addScaleBar()
      m
    } else {
      leaflet() %>%
        addProviderTiles(providers$OpenStreetMap, group = "OSM:Base") %>%
        addProviderTiles(providers$Esri.WorldImagery , group = "ESRI:Satallite") %>%
        setView(-77.81, -0.98, zoom = 8)
    }
  })
}