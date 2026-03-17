
## Cargar los datos
# son los datos de abundancias (tabla de abundancias )
abundancias <- read.csv("02_rawdata/abundancias - Hoja 2.csv")

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
  H <- -(sum)(p*log(p)) #Calcula el índice de Shannon
  iS <- function(abun, riqueza){
    (abun / riqueza)^2 ->suma
    sum(suma)-> simp
    } # Calcula el índice de Simpson
  simp <- iS (abun, riqueza) #Investigué y tenía que como "llamar la función" con los argumentos que ocupaba
  
  ins <- function(simp){
    1/simp -> invs 
  } #Calcula el inverso de Simpson
  invs <- ins(simp)
  pielou <- (1/log(riqueza)) #Calcula el índice de Pielou
  
  Chao1 <- function(x){
    which(x==1) -> singleton
    which(x==2) -> doubleton
    sum(singleton) -> sumsin
    (sumsin)^2 -> f1
    sum(doubleton)*2 -> f2
    riqueza + (f1/f2) -> CHAO1
  }
  CHAO1 <- Chao1(x)
return (c(riqueza,H, simp, invs, pielou, CHAO1))
}

# Calcular los diferentes índices para cada sitio
sitio1 <-divalf (abundancias$Sitio.1)
sitio2 <-divalf (abundancias$Sitio.2)
sitio3 <-divalf (abundancias$Sitio.3)
sitio4 <-divalf (abundancias$Sitio.4)
sitio5 <-divalf (abundancias$Sitio.5)
sitio6 <-divalf (abundancias$Sitio.6)
sitio7 <-divalf (abundancias$Sitio.7)

#Crear una tabla en donde se muestren los diferentes sirios con sus respectivos índices

Diversidad_alfa <- rbind(sitio1,sitio2,sitio3, sitio4,sitio5,sitio6,sitio7)
columnas <- c("Riqueza","Shannon", "Simpson", "Inv. Simpson", "Pielou", "CHAO1")
colnames(Diversidad_alfa) <- columnas

#Guardar esta tabla en la carpeta de resultados 

write.csv (Diversidad_alfa, "03_results/Diversidad_alfa.csv")

