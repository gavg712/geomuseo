library(shiny)
library(shinythemes)
library(markdown)
library(ggplot2)
library(leaflet)

navbarPage("GEOMUSEO", 
           theme = "css/style.css",
           selected = "Muestras", 
           tabPanel("Inicio",
                    fluidRow(
                      column(12,
                             includeMarkdown("Intro.Rmd")
                      )
                    )
           ),
           tabPanel(title = "Muestras",
                    fluidRow(class = "well",
                        column(width=3,
                               selectInput("tipo", label =  "Tipo",
                                           choices =  unique(serv_input$muestra)),
                                           selected = character())
                    ),
                    fluidRow(column(width=6,
                                    DT::dataTableOutput("table")),
                             column(width=6,
                                    leafletOutput("map",  height=400)
                                    )
                    )
           ),
           tabPanel("Acerca de",
                    fluidRow(
                      column(6,
                             includeMarkdown("about.md")
                      ),
                      column(3,
                             img(class="img-polaroid",
                                 src="Ikiam.png",
                                 style = "width: 50%")
                      )
                    )
           )
)

