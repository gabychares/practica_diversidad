
## Cargar los datos
datos1 <- read.csv("02_rawdata/abundancias - Hoja 1.csv") # son los datos de abundancias 
datos1

## Cargar librerias
install.packages("tidyverse")
library(tidyverse)
library(vegan)
install.packages("iNEXT")
library(iNEXT)


## 4.2 Diversidad alfa

sp_matrix <- datos1 %>% column_to_rownames("sitios") # convierte la tabla en matriz, para que los sitios pasen a ser nombres de las filas
sp_matrix




