
## Cargar librerias
install.packages("iNEXT")
library(iNEXT)
install.packages("ggplot2")
library(ggplot2)

## Cargar los datos
cr_matriz <- read.csv("02_rawdata/abundancias - Hoja 2.csv", row.names = 1)
# Usamos row.names = 1 para que los colores sean los nombres

#Convertir la matriz a una lista (formato para iNEXT)
cr_lista <- as.list(cr_matriz)

##Calcular iNEXT
resultados_cr <- iNEXT(cr_lista, q = 0, datatype = "abundance")
# q = 0 calcula la riqueza de especies
# datatype = "abundance" porque tienes conteos de individuos

## Graficar
# type = 1 es la gráfica de Rarefacción (Individuos vs Riqueza)
Grafica_curva_rarefacción <- ggiNEXT(resultados_cr, type = 1) +
  scale_color_brewer(palette = "Accent")+
  labs(title = "Curvas de rarefacción e interpolación",
       x = "Número de individuos muestreados",
       y = "Riqueza de especies (q = 0)") +
  theme_classic(base_size = 12)
Grafica_curva_rarefacción

#Guardar grafica en la carpeta de resultados 
ggsave(filename = "03_results/curva_rarefaccion.png", 
       plot = Grafica_curva_rarefacción, 
       width = 8, 
       height = 6, 
       dpi = 300)