
## Cargar los datos
diveridad <- read.csv("02_rawdata/abundancias - Hoja 1.csv") # son los datos de abundancias (tabla de abundancias )


## Cargar librerias
install.packages("tidyverse")
library(tidyverse)
library(vegan)
install.packages("iNEXT")
library(iNEXT)

# Diversidad alfa 
Results <- c()
divalf <- function (x){
  x -> abun
  as.numeric(abun) -> abun
  sum(abun) -> riqueza
  p <- (abun/riqueza)
  p <- p[p>0]
  H <- -(sum)(p*log(p))
  iS <- function(abun, riqueza){
    (abun / riqueza)^2 ->suma
    sum(suma)-> simp
    }
  simp <- iS (abun, riqueza)
  
  ins <- function(simp){
    1/simp -> gini
  }
  invs <- igs(simp)
  pielou <- (1/log(riqueza)) 
  
return (c(riqueza,H, simp, invs, pielou))
}

# Calcular los diferentes índices para cada sitio
sitio1 <- divalf (diveridad [1,])
sitio2 <- divalf (diveridad [2,])
sitio3 <-divalf (diveridad [3,])
sitio4 <-divalf (diveridad [4,])
sitio5 <-divalf (diveridad [5,])
sitio6 <-divalf (diveridad [6,])
sitio7 <-divalf (diveridad [7,])
#Crear una tabla en donde se muestren los diferentes sirios con sus respectivos índices
Diversidad_alfa <- rbind(sitio1,sitio2,sitio3, sitio4,sitio5,sitio6,sitio7)
columnas <- c("riqueza","H", "simp", "invs", "pielou")
colnames(Diversidad_alfa) <- columnas

#Guardar esta tabla en la carpeta de resultados 
write.csv (Diversidad_alfa, "03_results/Diversidad_alfa.csv")


