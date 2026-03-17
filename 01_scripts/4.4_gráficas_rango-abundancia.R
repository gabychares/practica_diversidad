
## Cargar librerias
install.packages("tidyverse")
library(tidyverse)
install.packages("ggplot2")
library(ggplot2)

## Cargar los datos
datos_ra <- read.csv("02_rawdata/abundancias - Hoja 1.csv")

##Ajustar los datos para que R los pueda leer.
#  %>% para continuar y pasar al siguiente paso
rank_data <- datos_ra %>%
  # Pasa de tabla ancha a tabla larga, pone todas las columnas una debajo de otra.
  pivot_longer(cols = -sitios, names_to = "especie", values_to = "n") %>%
  # Quita las especies que tienen cero en ese sitio
  filter(n > 0) %>%
  # Agrupa por sitio para calcular rangos por separado
  group_by(sitios) %>%
  # Calculamos proporción y posición en el ranking
  #mutate()-Crea columnas nuevas
  mutate(prop = n / sum(n), # Divide la abundancia de cada especie entre el total del sitio (abundancia relativa)
         rango = rank(-prop, ties.method = "first")) %>% #Ordena las especies de mayor a menor abundancia, el #1 es la más abundante.
  ungroup() # Rompe los grupos para que R pueda volver a trabajar con la tabla completa

##Graficar
grafica_rango_abundancia <- ggplot(rank_data, aes(x = rango, y = log10(prop), color = as.factor(sitios))) +
  #as.factor - convierte los números de los sitios en "etiquetas" para que R les asigne colores distintos.
  geom_line(linewidth = 0.9) + geom_point(size = 2) +
  scale_color_brewer(palette = "Accent") +
  labs(title = "Gráficas de rango-abundancia",
       x = "Rango de especie",
       y = "log10 (Abundancia relativa)") +
  theme_classic(base_size = 12) +
  facet_wrap(~sitios, scales = "free_x") # Divide la gráfica en 7, uno para cada sitio
#scales = "free_x" permite que si un sitio tiene 10 especies y otro solo 5, el eje X se ajuste al tamaño de cada uno.

#Guardar grafica en la carpeta de resultados 
ggsave("03_results/grafica_rango_abundancia.png", grafica_rango_abundancia, width = 10, height = 7)