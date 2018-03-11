library(shiny)
library(shinythemes)
library(markdown)
library(ggplot2)
library(leaflet)
library(lubridate)

navbarPage(position = "fixed-top", 
           header = tags$head(
             tags$meta(name="viewport", content="width=device-width, initial-scale=1.0"),
             tags$meta(name="description", content=""),
             tags$link(href="font-awesome/css/font-awesome.min.css", rel="stylesheet", type="text/css"),
             tags$link(href="css/nivo-lightbox.css", rel="stylesheet"),
             tags$link(href="css/nivo-lightbox-theme/default/default.css", rel="stylesheet", type="text/css"),
             tags$link(href="css/animate.css", rel="stylesheet"),
             tags$link(href="css/style.css", rel="stylesheet"),
             tags$link(href="color/default.css", rel="stylesheet")
           ),
           title = "GeoMuseo Ikiam",
           selected = "Inicio",
           tabPanel("Inicio",
                    style="width: 100%; height: 100%;",
                    fluidRow(source("R/home.R"))
           ),
           tabPanel(title = "Muestras",
                        fluidRow(class = "well", 
                                 column(width=3,
                                        selectInput("filtrotipo", 
                                                    label =  "Tipo de muestra",
                                                    choices =  unique(data$TIPO_MUESTRA),
                                                    multiple = TRUE,
                                                    selected = character())
                                        ),
                                 column(width=3,
                                        selectInput("filtroformacion", 
                                                    label =  "Formación",
                                                    "",
                                                    multiple = TRUE
                                                    )
                                        ),
                                 column(width=3,
                                        dateRangeInput("filtrofecha", 
                                                       label =  "Fecha",
                                                       start = min(data$FECHA - days(1), na.rm = T),
                                                       separator = " - ")
                                        )
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
                      fluidRow(hr()),
                      fluidRow(
                        column(2, style="padding: 10px;", offset = 1, 
                               includeMarkdown("md/logos.md")
                        ),
                        column(7, class="text-justify", style="padding: 10px;",
                               includeMarkdown("md/about.md")
                        )
                      ),
                      fluidRow(hr())
                    )
           ),
           footer = tags$footer(
             tags$script(src = "js/jquery.easing.min.js"),
             tags$script(src = "js/classie.js"),
             tags$script(src = "js/gnmenu.js"),
             tags$script(src = "js/jquery.scrollTo.js"),
             tags$script(src = "js/nivo-lightbox.min.js"),
             tags$script(src = "js/stellar.js"),
             tags$script(src = "js/custom.js")
           )
)

