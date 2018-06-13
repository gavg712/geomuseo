library(shiny)
library(shinythemes)
library(markdown)
library(ggplot2)
library(leaflet)
library(lubridate)

navbarPage(position = "fixed-top", 
           inverse = T,
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
                    div(class = "container-global",
                        style = "background: white no-repeat;
                        background-size: cover; height: 93.5vh; width: 100%; position: absolute;
	                      top: 40; left: 0;",
                        # Menu ----
                        tags$ul(id = "gn-menu",
                                class = "gn-menu-main",
                                tags$li(class = "gn-trigger",
                                        a(class = "gn-icon gn-icon-menu", ""),
                                        tags$nav(class = "gn-menu-wrapper",
                                                 div(class = "gn-scroller",
                                                     tags$ul(class = "gn-menu",
                                                                     tags$li(a(href = "#about", 
                                                                               class = "gn-icon gn-icon-user", 
                                                                               "Introducción"),
                                                                             tags$li(a(href = "#service", 
                                                                                       class = "gn-icon gn-icon-service", 
                                                                                       "Trabajos")
                                                                             ),
                                                                             tags$li(a(href = "#works", 
                                                                                       class = "gn-icon gn-icon-expert", 
                                                                                       "Galería")
                                                                             ),
                                                                             tags$li(a(href = "#contact", 
                                                                                       class = "gn-icon gn-icon-earth", 
                                                                                       "Contactos")
                                                                             )
                                                                     )
                                                     )
                                                 )
                                        )
                                )
                        ),
                        # Intro ----
                        tags$section(
                          id = "intro",
                          class = "intro",
                          div(class = "slogan",
                              h1(color = "white", "Geomuseo"),
                              p(strong(htmltools::em(' "Sin Presión, no habrían diamantes" ')), br(), "Mary case"
                              )
                              ),
                           div(class = "container",
                               align = "center",
                               a(href = "#about", 
                                 class = "btn btn-skin scroll",
                                 style = "background:rgba(0,0,0,0.7); border: black", 
                                 "Leer más...")
                           )
                          ),
                        # About ----
                        tags$section(
                          id = "about",
                          class = "home-section text-center bg-gray",
                          div(class = "heading-about marginbot-50",
                              div(class = "container",
                                  div(class = "row",
                                      div(class = "col-lg-3",
                                          div(class = "inner",
                                              div(class = "avatar",
                                                  img(src = "img/team/QS.JPG",
                                                      alt = "",
                                                      class = "img-responsive")
                                              ),
                                              div(class = "row",
                                                  align = "left",
                                                  div(class = "col-md-3", tags$b("Dirección:")),
                                                  div(class = "col-md-9", "Glenda Loayza Toro")
                                              ),
                                              div(class = "row",
                                                  align = "left",
                                                  div(class = "col-md-3", tags$b("Desarrollo:")),
                                                  div(class = "col-md-9",
                                                      tags$ul(
                                                        tags$li("Stalin Guamán",
                                                                a(href = "https://www.researchgate.net/profile/Stalin_Guaman", 
                                                                  "Perfil")
                                                        ),
                                                        tags$li("Gabriel Gaona",
                                                                a(href = "https://www.researchgate.net/profile/Gabriel_Gaona", 
                                                                  "Perfil")
                                                        )
                                                      )
                                                  )
                                              )
                                          ),
                                          div(class = "row",
                                              align = "left",
                                              div(class = "col-md-3", tags$b("Trabajo de campo:")),
                                              div(class = "col-md-9",
                                                  includeMarkdown("md/equipo_tecnico.md")
                                              )
                                          )
                                      ),
                                      div(class = "col-lg-8",
                                          h3("Introducción"),
                                          div(class = "section-heading text-justify",
                                              align = "justify",
                                              includeMarkdown("md/home_project.md")
                                          )
                                      )
                                  )
                              )
                          )#,
                          # div(class = "row",
                          #     a(href = "#service",
                          #       class = "btn btn-skin scroll", 
                          #       "más...")
                          # )
                        ),
                        #trabajos ----
                        tags$section(
                          id = "service",
                          class = "home-section text-center", style = "padding-bottom: 0px",
                          div(class = "heading-service marginbot-50",
                              div(class = "container",
                                  div(class = "row", 
                                      div(class = "col-lg-8 col-lg-offset-2",
                                          div(class = "section-heading",
                                              h3("Trabajos"),
                                              p("Trabajos y Publicaciones destacadas")
                                          )
                                      )
                                  )
                              )
                          )
                        ),
                        div(class = "container",
                            div(class = "row",
                                div(class = "col-sm-12 col-md-12 col-lg-12",
                                    div(class = "row gallery-item",
                                        div(class = "col-md-4",
                                            a(href = "img/jobs/Paredes_Quilumba-2017.jpg",
                                              title = "Salida de Campo geológica y muestreo en la provincia del Napo",
                                              a(href = "img/jobs/Paredes_Quilumba-2017.pdf", target = "_blank", "Descargar documento"),
                                              `data-lightbox-gallery` = "gallery2",
                                              `data-lightbox-hidpi` = "img/jobs/1@2x.png",
                                              img(src = "img/jobs/Paredes_Quilumba-2017.jpg",
                                                  class = "img-responsive",
                                                  alt = "img")
                                            )
                                        ),
                                        div(class = "col-md-4",
                                            a(href = "img/jobs/Cargua_Guaman-2018.png",
                                              title = "Reconocimiento geológico al Noreste del Ecuador",
                                              a(href = "img/jobs/Cargua_Guaman-2018.pdf", target = "_blank", "Descargar documento"),
                                              `data-lightbox-gallery` = "gallery2",
                                              `data-lightbox-hidpi` = "img/jobs/1@2x.png",
                                              img(src = "img/jobs/Cargua_Guaman-2018.png",
                                                  class = "img-responsive",
                                                  alt = "img")
                                            )
                                        )
                                    )
                                )
                            )
                        ),
                        #   div(class = "row",
                        #       a(href = "#works",
                        #         class = "btn btn-skin scroll", 
                        #         "más..."
                        #       )
                        #   )
                        # ),
                        # Galery ----
                        tags$section(
                          id = "works",
                          class = "home-section text-center bg-gray",
                          div(class = "heading-works marginbot-50",
                              div(class = "container",
                                  div(class = "row",
                                      div(class = "col-lg-8 col-lg-offset-2",
                                          div(class = "section-heading",
                                              h3("Galería")#, p("Fotografía e imágenes que describan el proyecto...")
                                          )
                                      )
                                  )
                              )
                          ),
                          div(class = "container",
                              div(class = "row",
                                  div(class = "col-sm-12 col-md-12 col-lg-12",
                                      div(class = "row gallery-item",
                                          lapply(list.files("www/img/works", "jpg$",
                                                            full.names = T),
                                                 photoGallery, path = "img/works", ncol = 6) %>%
                                            rowGallery(nc = 6)
                                          # div(class = "col-md-2",
                                          #     a(href = "img/works/1.jpg",
                                          #       title = "Salida de campo al Mirador Pisque, Guayllabamba - Pichincha, Ec.",
                                          #       `data-lightbox-gallery` = "gallery1",
                                          #       `data-lightbox-hidpi` = "img/works/1@2x.png",
                                          #       img(src = "img/works/1.jpg",
                                          #           class = "img-responsive",
                                          #           alt = "img")
                                          #     )
                                          # )
                                      )
                                  )
                              )#,
                              # div(class = "row",
                              #     a(href = "#contact", 
                              #       class = "btn btn-skin scroll", 
                              #       "más...")
                              # )
                          )
                        ),
                        # Contacto ----
                        tags$section(
                          id = "contact",
                          class = "home-section text-center",
                          div(class = "heading-contact marginbot-50",
                              div(class = "container",
                                  div(class = "row",
                                      div(class = "col-lg-8 col-lg-offset-2",
                                          div(class = "section-heading",
                                              h3("Contactos"),
                                              p("Consultas y sugerencias")
                                          )
                                      )
                                  )
                              )
                          ),
                          div(class = "container",
                              div(class = "row",
                                  div(class = "col-lg-8 col-md-offset-2",
                                      div(class = "boxed-grey",
                                          div(class = "boxed-grey",
                                              div(class = "widget-contact row",
                                                  div(class = "row text-center",
                                                      div(class = "col-lg-6",
                                                          tags$address(strong("Bruno Conicelli"),
                                                                       br(),
                                                                       "bruno.conicelli@ikiam.edu.ec ",
                                                                       br(),
                                                                       "Director de Ingeniería en Geociencias",
                                                                       br(), 
                                                                       "Campus Universitario Ikiam"
                                                          )
                                                      ),
                                                      div(class = "col-lg-6",
                                                          tags$address(strong("Marco Simbaña"),
                                                                       br(),
                                                                       "marcosimbana@ikiam.edu.ec",
                                                                       br(),
                                                                       "Profesor de Ingeniería en Geociencias",
                                                                       br(), 
                                                                       "Campus Universitario Ikiam"
                                                          )
                                                      )
                                                  ),
                                                  div(class = "row text-center",
                                                      tags$address(strong("Universidad Regional Amazónica Ikiam"),
                                                                   br(),
                                                                   "Campus Universitario",
                                                                   br(),
                                                                   "Km 7 Vía a Muyuna",
                                                                   tags$abbr(title = "Teléfono", "F:"),
                                                                   " (+593) 63-700-040",
                                                                   br(),
                                                                   "Tena, Napo - Ecuador"
                                                      )
                                                  )
                                              )
                                          )
                                      )
                                  )
                              )
                          )
                        )
           )
           # Finaliza home ----
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

