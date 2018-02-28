library("tidyverse")
library("DBI")
library("DT")
library("leaflet")
library("RColorBrewer")
library(sp)
library(htmltools)
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
  mutate(Imagen = paste0("<img src='",
                         file.path("fotos", foto),
                         "' style='width:80px'>"), 
         Imagen2 = paste0("<img src='",
                         file.path("fotos", foto),
                         "' style='width: 100%'>"))

#Generating the interactive choices


