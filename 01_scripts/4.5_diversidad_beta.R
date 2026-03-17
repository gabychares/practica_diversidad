## Cargar librerias
library(vegan)

## Matrices de disimilitud

# Matriz con índice de Jaccard
matriz <- abundancias_Hoja_1 [,-1] # quita la columna de "sitios", necesario porque solo es un identificador (no es especie ni abundancia) 
matriz

m_d_j <- as.matrix (vegdist (matriz, method = "jaccard", binary = TRUE))# vegdist es una función de la libreria vegan, calcula qué tan diferentes son los sitios. binary = TRUE: para que ignore las abundancias y solo convierta a 1 y 0
m_d_j

# Matriz con índice de Bray-curtis
m_d_bc <- as.matrix (vegdist (matriz, method = "bray")) # el as.matrix para visualizar la matriz completa
m_d_bc

# Gráfico de heatmap
library(reshape2) # paquete de R que facilita la transformación de datos entre los formatos ancho y largo

# melt: coge los datos en formato wide y los convierte al formato long

heatmap_beta<- function (indices, titulo){
  melt(indices) %>% # convierte la matriz de disimilitud a formato largo (con la que entiende ggplot)
    ggplot (aes (x=Var1, y=Var2, fill=value)) + # crea el heatmap. value es el valor de disimilitud y fill es para que le ponga color (dependiendo de las diferencias)
    geom_tile() + # para los cuadros del heatmap (cada cuadro es una comparación entre dos sitios)
    geom_text(aes(label = round (value,2)))+ # pone texto dentro del gráfico. round (value,2): es para redondear los numeros y dejar 2 decimales
    scale_fill_gradientn(colors= terrain.colors(200))+ # para el gradiente de colores (es gradientn para q use varios colores), el 200 son tonos distintos de esa paleta (terrain.colors )
    
    labs (title = titulo, x= "Sitios", y="Sitios")
    
}

heatmap_beta(m_d_j, "Disimilitud de Jaccard")
heatmap_beta(m_d_bc, "Disimilitud de Bray-Curtis")


# Guardar gráfica en carpeta de resultados










