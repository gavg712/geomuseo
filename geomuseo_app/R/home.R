div(
  div(class = "container",
      tags$ul(id = "gn-menu",
              class = "gn-menu-main",
              tags$li(class = "gn-trigger",
                      a(class = "gn-icon gn-icon-menu", "Menu"),
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
                                                   tags$li(a(href = "#service", 
                                                             class = "gn-icon gn-icon-service", 
                                                             "Servicios")
                                                   ),
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
      tags$section(
        id = "intro",
        class = "intro",
        div(class = "slogan",
            h1(color = "white", "Geomuseo"),
            p(strong("Un proyecto de estudiantes de la carrera de Ingeniería en 
            Geociencias de la Universidad Regional Amazónica Ikiam")
            )
        ),
        div(class = "row",
            align = "center",
            a(href = "#about", 
              class = "btn btn-skin scroll", 
              "Leer más...")
        )
      ),
      tags$section(
        id = "about",
        class = "home-section text-center bg-gray",
        div(class = "heading-about marginbot-50",
            div(class = "container",
                div(class = "row",
                    div(class = "col-lg-3",
                        div(class = "inner",
                            div(class = "avatar",
                                img(src = "img/team/RS-001.jpg",
                                    alt = "",
                                    class = "img-responsive")
                            ),
                            div(class = "row",
                                align = "left",
                                div(class = "col-md-3", tags$b("Dirección:")),
                                div(class = "col-md-9", "Ing. Glenda Loayza")
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
                        div(class = "section-heading",
                            align = "left",
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
      tags$section(
        id = "service",
        class = "home-section text-center",
        div(class = "heading-about marginbot-50",
            div(class = "container",
                div(class = "row",
                    div(class = "col-lg-8 col-lg-offset-2",
                        div(class = "section-heading",
                            h2("Servicios"),
                            p("Sistemas de información geográfica y análisis 
                          espacial de información meteorológica")
                        )
                    )
                )
            )
        ),
        div(class = "container",
            div(class = "row",
                div(class = "col-sm-3 col-md-3",
                    div(class = "service-box",
                        div(class = "service-icon",
                            tags$i(class = "fa fa-globe fa-3x")),
                        div(class = "service-desc",
                            h5("Cartografía"),
                            p("Estudios y levantamiento de cartografía temática 
                    en el área de las ciencias del medio ambiente.")
                        )
                    )
                ),
                div(class = "col-sm-3 col-md-3",
                    div(class = "service-box",
                        div(class = "service-icon",
                            tags$i(class = "fa fa-cube fa-3x")
                        ),
                        div(class = "service-desc",
                            h5("Análisis espacial"),
                            p("Investigación y cálculos espaciales mediante modelos 
                      numéricos de variables ambientales."
                            )
                        )
                    )
                ),
                div(class = "col-sm-3 col-md-3",
                    div(class = "service-box",
                        div(class = "service-icon",
                            tags$i(class = "fa fa-database fa-3x"),
                            div(class = "service-desc",
                                h5("IDE's"),
                                p("Desarrollo e Implementación de infraestructuras 
                              de datos espaciales.")
                            )
                        )
                    )
                ),
                div(class = "col-sm-3 col-md-3",
                    div(class = "service-box",
                        div(class = "service-icon",
                            tags$i(class = "fa fa-graduation-cap fa-3x")
                        ),
                        div(class = "service-desc",
                            h5("Educación e Interpretación ambiental"),
                            p("Diseño de planes de educación ambiental e 
                          interpretación del paisaje."
                            )
                        )
                    )
                )
            )
        ),
        div(class = "row",
            a(href = "#works",
              class = "btn btn-skin scroll", 
              "más..."
            )
        )
      ),
      tags$section(
        id = "works",
        class = "home-section text-center bg-gray",
        div(class = "heading-works marginbot-50",
            div(class = "container",
                div(class = "row",
                    div(class = "col-lg-8 col-lg-offset-2",
                        div(class = "section-heading",
                            h2("Galería"),
                            p("Fotografía e imágenes que describan el proyecto...")
                        )
                    )
                )
            )
        ),
        div(class = "container",
            div(class = "row",
                div(class = "col-sm-12 col-md-12 col-lg-12",
                    div(class = "row gallery-item",
                        div(class = "col-md-3",
                            a(href = "img/works/1.png",
                              title = "Mapa de cobertura vegetal del Cantón Catamayo, Loja, Ec.",
                              `data-lightbox-gallery` = "gallery1",
                              `data-lightbox-hidpi` = "img/works/1@2x.png",
                              img(src = "img/works/1.png",
                                  class = "img-responsive",
                                  alt = "img"),
                              "Mas info:",
                              a(href = "http://app.sni.gob.ec/sni-link/sni/PDOT/ZONA7/NIVEL_DEL_PDOT_CANTONAL/LOJA/CATAMAYO/IEE/1.%20Documentos/Pdf/3.%20Sistemas%20productivos/MEMORIA%20CATAMAYO_IE_20120327.pdf",
                                "Memoria Técnica")
                            )
                        ),
                        div(class = "col-md-3",
                            a(href = "img/works/2.png",
                              title = "Mapa de ruido de la ciudadela universitaria Guillermo Falconí Espinosa, UNL, Loja, Ec.",
                              `data-lightbox-gallery` = "gallery1",
                              `data-lightbox-hidpi` = "img/works/1@2x.png",
                              img(src = "img/works/2.png", 
                                  class = "img-responsive", 
                                  alt = "img")
                            )
                        ),
                        div(class = "col-md-3",
                            a(href = "img/works/3.png",
                              title = "Estación meteorológica instalada en El Tiro, Loja, Ec.",
                              `data-lightbox-gallery` = "gallery1",
                              `data-lightbox-hidpi` = "img/works/1@2x.png",
                              img(src = "img/works/3.png", 
                                  class = "img-responsive", 
                                  alt = "img")
                            )
                        )
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
                                div(class = "col-lg-6",
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
                                ),
                                div(class = "col-lg-6",
                                    tags$address(strong("Marco Simbaña"),
                                                 br(),
                                                 "marcosimabna@ikiam.edu.ec",
                                                 br(),
                                                 "Profesor de Ingeniería en Geociencias",
                                                 br(), 
                                                 "Campus Universitario Ikiam"
                                    ),
                                    tags$address(strong("Bruno Conicelli"),
                                                 br(),
                                                 "bruno.conicelli@ikiam.edu.ec ",
                                                 br(),
                                                 "Director de Ingeniería en Geociencias",
                                                 br(), 
                                                 "Campus Universitario Ikiam"
                                    )
                                )
                            )
                        )
                    )
                )
            )
        )
      ),
      tags$footer(
        div(class = "container",
            div(class = "row",
                div(class = "col-md-6",
                      p("Volver al ",
                        a(href = "#intro", 
                          class = "btn btn-skin scroll", 
                          "Inicio"
                        )
                      )
                )
            )
        )
      )
  )
)
