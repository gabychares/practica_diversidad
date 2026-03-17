## Cargar librerias
library(vegan)

## Matrices de disimilitud

# Matriz con índice de Jaccard
matriz <- abundancias_Hoja_1 [,-1] # quita la columna de "sitios", necesario porque solo es un identificador (no es especie ni abundancia) 
matriz

m_d_j <- vegdist (matriz, method = "jaccard", binary = TRUE) # vegdist es una función de la libreria vegan, calcula qué tan diferentes son los sitios. binary = TRUE: para que ignore las abundancias y solo convierta a 1 y 0
as.matrix (m_d_j) # as.matrix para visualizar la matriz completa

# Matriz con índice de Bray-curtis
m_d_bc <- vegdist (matriz, method = "bray")
as.matrix (m_d_bc) # visualizar matriz completa


# Gráfico de heatmap
library(reshape2)



