div(class = "container-global",
    # Menu ----
      tags$ul(id = "gn-menu",
              class = "gn-menu-main",
              tags$li(class = "gn-trigger",
                      a(class = "gn-icon gn-icon-menu", ""),
                      tags$nav(class = "gn-menu-wrapper",
                               div(class = "gn-scroller",
                                   tags$ul(class = "gn-menu",
                                           tags$li(a(href = "#intro", 
                                                     class = "gn-icon gn-icon-earth", 
                                                     "Inicio"),
                                                   tags$li(a(href = "#about", 
                                                             class = "gn-icon gn-icon-user", 
                                                             "Sobre el proyecto")
                                                   ),
                                                   # tags$li(a(href = "#service", 
                                                   #           class = "gn-icon gn-icon-service", 
                                                   #           "Servicios")
                                                   # ),
                                                   tags$li(a(href = "#works", 
                                                             class = "gn-icon gn-icon-expert", 
                                                             "Galería")
                                                   ),
                                                   tags$li(a(href = "#contact", 
                                                             class = "gn-icon gn-icon-earth", 
                                                             "Contacto")
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
            p(strong("Un proyecto de estudiantes de la carrera de Ingeniería en 
            Geociencias de",  br(), "la Universidad Regional Amazónica Ikiam")
            )
        ),
        div(class = "row",
            align = "center",
            a(href = "#about", 
              class = "btn btn-skin scroll", 
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
                        h2("El proyecto"),
                        div(class = "section-heading text-justify",
                            align = "justify",
                            includeMarkdown("md/home_project.md")
                        )
                    )
                )
            )
        ),
        div(class = "row",
            a(href = "#service",
              class = "btn btn-skin scroll", 
              "más...")
        )
      ),
    #trabajos ----
    tags$section(
      id = "service",
      class = "home-section text-center",
      div(class = "heading-about marginbot-50",
          div(class = "container",
              div(class = "row",
                  div(class = "col-lg-8 col-lg-offset-2",
                      div(class = "section-heading",
                          h2("Trabajos"),
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
                        a(href = "img/jobs/01.jpg",
                          title = "Salida de Campo geológica y muestreo en la provincia del Napo",
                          a(href = "img/jobs/01.pdf", target = "_blank", "Descargar documento"),
                          `data-lightbox-gallery` = "gallery2",
                          `data-lightbox-hidpi` = "img/jobs/1@2x.png",
                          img(src = "img/jobs/01.jpg",
                              class = "img-responsive",
                              alt = "img")
                        )
                    )
                )
            )
        )
    ),
    div(class = "container",
        div(class = "col",
            div(class = "col-sm-12 col-md-12 col-lg-12",
                div(class = "col-md-4",
                    a(href = "img/jobs/02.png",
                      title = "Reconocimiento geológico al Noreste del Ecuador",
                      a(href = "img/jobs/01.pdf", target = "_blank", "Descargar documento"),
                      `data-lightbox-gallery` = "gallery2",
                      `data-lightbox-hidpi` = "img/jobs/1@2x.png",
                      img(src = "img/jobs/02.png",
                          class = "img-responsive",
                          alt = "img")
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
                          h2("Galería")#, p("Fotografía e imágenes que describan el proyecto...")
                      )
                  )
              )
          )
      ),
      div(class = "container",
          div(class = "row",
              div(class = "col-sm-12 col-md-12 col-lg-12",
                  div(class = "row gallery-item",
                      lapply(list.files("www/img/works", "jpg$"),
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
          ),
          div(class = "row",
              a(href = "#contact", 
                class = "btn btn-skin scroll", 
                "más...")
          )
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
                            h2("Contacto"),
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