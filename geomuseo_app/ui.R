library(shiny)
library(shinythemes)
library(markdown)
library(ggplot2)
library(leaflet)

# tags$head(
#   tags$link(href="www/font-awesome/css/font-awesome.min.css", rel="stylesheet", type="text/css"),
#   tags$link(href="www/css/nivo-lightbox.css", rel="stylesheet"),
#   tags$link(href="www/css/nivo-lightbox-theme/default/default.css", rel="stylesheet", type="text/css"),
#   tags$link(href="www/css/animate.css", rel="stylesheet"),
#   tags$link(href="www/css/style.css", rel="stylesheet"),
#   tags$link(href="www/color/default.css", rel="stylesheet")
# )

navbarPage("GEOMUSEO",
           selected = "Muestras", 
           tabPanel("Inicio",
                    fluidRow(
                      fluidRow(
                        # tags$ul(id="gn-menu", class="gn-menu-main",
                        #         tags$li(class="gn-trigger",
                        #                 a(class="gn-icon gn-icon-menu", "Menu"),
                        #                 tags$nav(class="gn-menu-wrapper",
                        #                          div(class="gn-scroller",
                        #                              tags$ul(class="gn-menu",
                        #                                      tags$li(a(href="#about", class="gn-icon gn-icon-user", "Sobre el proyecto")),
                        #                                      tags$li(a(href="#service", class="gn-icon gn-icon-service", "Servicios")),
                        #                                      tags$li(a(href="#works", class="gn-icon gn-icon-expert", "Galería")),
                        #                                      tags$li(a(href="#contact", class="gn-icon gn-icon-earth", "Contacto"))
                        #                              )
                        #                          )
                        #                 )
                        #         )
                        # )
                        column(12, includeHTML("www/index.html"))
                        
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

