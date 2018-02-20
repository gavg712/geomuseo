library("tidyverse")
library("DBI")
library("DT")
library("leaflet")
library("RColorBrewer")
#Inputitng data and generating table for server
dir_fichas <- list.files(path = 'www/',
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
  #In this code line you can change the image resolution; (default 100px)
  mutate(Imagen = paste0("<a href='",file.path("fotos", foto),
                                        "' target='_blank'><img src='",
                                        file.path("fotos", foto),
                                        "' style='width:100px'> </a>")) %>%
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
  arrange(Muestra)

#Generating the interactive map
sampling_map <- leaflet() %>%
  addTiles(
    urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png",
    attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
  ) %>%
  setView(-0.98, -77.81, zoom = 10)



