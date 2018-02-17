library("tidyverse")
library("DBI")
library("DT")

dir_fichas <- list.files(path = 'archivos/',
                         pattern = '*.csv',
                         full.names = T,
                         recursive = T,
                         include.dirs = T)
all_fichas <- lapply(dir_fichas,
                    read.csv,
                    header = T,
                    sep = ",",
                    col.names = c("foto",
                                  "x",
                                  "y",
                                  "muestra",
                                  "fecha",
                                  "nombre",
                                  "codigo",
                                  "descripcion",
                                  "formacion",
                                  "responsable")) %>% bind_rows()
serv_input <- all_fichas %>%
  mutate(dir_img = paste(dirname(dir_fichas),
                                         "fotos",
                                         foto,
                                         sep = "/")) %>%
  mutate(Imagen = dbQuoteString(ANSI(),
                                paste("<img src=",
                                      "\"",
                                      dir_img,
                                      "\"",
                                      " height=\"75\"></img>",
                                      sep = ""))) %>%
  select(Imagen, nombre, codigo, muestra,
         formacion, descripcion, responsable, fecha) %>%
  rename(Muestra = nombre,
         Imagen = Imagen,
         Código = codigo,
         Tipo = muestra,
         Formación = formacion,
         Descripción = descripcion,
         Responsable = responsable,
         Fecha = fecha) %>%
  bind_rows(data.frame(Imagen = "www/archivos/fotos/RS-001.jpg"))

  '<img src="test.png" height="52"></img>'
  "www/img/img1.png"