library(shiny)
library(shinythemes)
library(markdown)
library(ggplot2)

navbarPage("GEOMUSEO", theme = "css/style.css",
           tabPanel("Introducción",
                    fluidRow(
                      column(12,
                             includeMarkdown("Intro.Rmd")
                      )#,
                      #column(2,
                      #       img(class="img-polaroid",
                      #           src = "Ikiam.png",
                      #           width = 100))
                    )
           ),
           tabPanel("Fichas",
                    DT::dataTableOutput("table")
           ),
           tabPanel("Mapa",
                    leafletOutput("map", width="100%", height="100%")
           ),
           tabPanel("Muestras",
                               fluidRow(
                                 column(6,
                                        includeMarkdown("about.md")
                                 ),
                                 column(3,
                                        img(class="img-polaroid",
                                            src=paste0("http://upload.wikimedia.org/",
                                                       "wikipedia/commons/9/92/",
                                                       "1919_Ford_Model_T_Highboy_Coupe.jpg")),
                                        tags$small(
                                          "Source: Photographed at the Bay State Antique ",
                                          "Automobile Club's July 10, 2005 show at the ",
                                          "Endicott Estate in Dedham, MA by ",
                                          a(href="http://commons.wikimedia.org/wiki/User:Sfoskett",
                                            "User:Sfoskett")
                                        )
                                 )
                               )
                      )
           )

