library(tidyverse)
library(DBI)
library(DT)
library(leaflet)
library(RColorBrewer)
library(sp)
library(htmltools)
library(googlesheets)
library(lubridate)
#Inputitng data and generating table for server
gs_auth(token = "rds/MuestrasPetrografia_TK.rds") #%>% saveRDS(file = "rds/MuestrasPetrografia_TK.rds")
gap <- gs_title("MuestrasPetrografia")

data <- gs_read(gap, 1) %>%
  #In this code line you can change the image resolution; (default 100px)
  mutate(FECHA = ymd(FECHA),
         htmlImagen = paste0("<img src='",
                         file.path("fotos", FOTOS),
                         "' style='width:80px'>"),
         htmlImagen2 = paste0("<img src='",
                         file.path("fotos", FOTOS),
                         "' style='width: 100%'>"))

#Generating the interactive choices


