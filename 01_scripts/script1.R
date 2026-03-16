
## Cargar los datos
datos1 <- read.csv("02_rawdata/abundancias - Hoja 1.csv") # son los datos de abundancias 
datos1

## Cargar librerias
install.packages("tidyverse")
library(tidyverse)
library(vegan)
install.packages("iNEXT")
library(iNEXT)

# Diversidad alfa 
divalf <- function (x){
  x -> abun
  as.numeric(abun) -> abun
  sum(abun) -> total
  iS <- function(abun, total){
    (abun / total)^2 ->suma
    sum(suma)->simp
    
  }
  simp <- iS (abun, total)
  return(simp)
}
sitio1 <- divalf (diversidad [1:10,2])
sitio2 <- divalf (diversidad [1:9,4])
sitio3 <-divalf (diversidad [1:8,6])
sitio4 <-divalf (diversidad [1,8])
sitio5 <-divalf (diversidad [1:12,10])
sitio6 <-divalf (diversidad [1:13,12])
sitio7 <-divalf (diversidad [1:10,14])

#Divalfa <- data.frame()





