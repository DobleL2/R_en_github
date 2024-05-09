
library(data.table)
# Establecemos los valores iniciales del modelo
set.seed(123)
d <- 10
N <- 15*2
mu <- 2
std <- 1
n <- d*N*2

# Funciòn que genera una trayectoria dando los parametros 
data_avion <- function(d,mu,std){
  return(sort(rnorm(d*2,mu,std)))
}

# Generar N trayectorias y almacenarlas en un data.table
trayectorias <- lapply(1:N, function(i) data_avion(d, mu, std))
dt_trayectorias <- data.table(matrix(unlist(trayectorias), nrow = N, byrow = TRUE))

# Renombrar las columnas
setnames(dt_trayectorias, paste0(rep(c("X", "Y"), times = d), rep(1:d,each=2)))

# Crear dos columnas auxiliares que hagan referencia al ID del avion y el # trayectoria
dt_trayectorias$ID = rep(c('A','B'),times=N/2)
dt_trayectorias$Trayectoria = rep(c(1:(N/2)),each=2)

# Mostrar el resultado
print(dt_trayectorias)

# Separamos dos tablas correspondientes 
A_table = dt_trayectorias[ID=="A"]
B_table = dt_trayectorias[ID=="B"]

# Funcion que calcula la distancia 
calcular_distancia <- function(x1, y1, x2, y2) {
  distancia <- sqrt((x2 - x1)^2 + (y2 - y1)^2)
  return(distancia)
}

# Crear un data table combinado con todas las combinaciones de puntos para cada trayectoria
combined_dt <- merge(A_table, B_table, by = "Trayectoria")

# Calcular la distancia para cada par de puntos en cada trayectoria

# Generate column names for X and Y coordinates of origin and destination
cols_origen_x <- paste0("X", 1:d, ".x")
cols_origen_y <- paste0("Y", 1:d, ".x")
cols_destino_x <- paste0("X", 1:d, ".y")
cols_destino_y <- paste0("Y", 1:d, ".y")

# Define a function to calculate distance without using a for loop
calcular_distancias <- function(origen_x, origen_y, destino_x, destino_y) {
  distancia <- sqrt((destino_x - origen_x)^2 + (destino_y - origen_y)^2)
  return(distancia)
}

# Calculate distances for each pair of points in each trajectory
combined_dt[, paste0("d", 1:d) := lapply(1:d, function(i) calcular_distancias(.SD[[cols_origen_x[i]]], .SD[[cols_origen_y[i]]], .SD[[cols_destino_x[i]]], .SD[[cols_destino_y[i]]])), .SDcols = c(cols_origen_x, cols_origen_y, cols_destino_x, cols_destino_y)]

i <- 1
paste0("A.X",i)

distances_matrix <- combined_dt[, c("d1", "d2", "d3", "d4", "d5", "d6", "d7", "d8", "d9", "d10"), with = FALSE]

# Función para calcular la proporción de elementos mayores que ro en una columna de la matriz de distancias
prop_mayores_que_ro <- function(columna, ro) {
  total_elementos <- length(columna)
  sum(columna < ro, na.rm = TRUE) / total_elementos
}

# Calcular ro
ro <- mean(unlist(distances_matrix))

PASWR::EDA(unlist(distances_matrix))

# Utilizar lapply para calcular las proporciones para cada columna d de d1 a d10
proporciones <- lapply(distances_matrix, prop_mayores_que_ro, ro)


# Convertir la lista de proporciones en un vector
proporciones_vector <- unlist(proporciones)

# Imprimir o utilizar el vector de proporciones según sea necesario
print(proporciones_vector)

mean(proporciones_vector)


# Convertimos todas las filas de la matriz de distancias en una matriz numérica
distances <- as.matrix(distances_matrix)

# Creamos el gráfico de dispersión
plot(1:d, distances[1,], 
     type = "o", # Tipo de gráfico: puntos y líneas
     xlab = "Puntos de la trayectoria", ylab = "Distancia",
     main = "Distancias vs Puntos de trayectoria",
     col = "blue", pch = 16, # Color y forma de los puntos
     ylim = c(0, max(distances) * 1.1), # Límite del eje y
     xaxt = "n") # Eliminamos los valores del eje x

# Agregamos etiquetas a los puntos en el eje x
axis(1, at = 1:d, labels = colnames(distances_matrix)[1:d])

# Añadimos líneas y etiquetas para las otras filas
for (i in 2:nrow(distances)) {
  lines(1:d, distances[i,], type = "o", col = "blue")
}

# Creamos una leyenda
legend("topright", legend = paste("Trayectoria", 1:nrow(distances)), col = "blue", pch = 16, lty = 1, cex = 0.8)

# Agregamos una línea horizontal roja de referencia
valor_referencia <- ro  # Aquí debes definir tu valor de referencia
abline(h = valor_referencia, col = "red")