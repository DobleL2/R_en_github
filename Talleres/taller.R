source("C:/Users/lelap/Documents/Projectox/R_en_github/Talleres/functions.R")
my_EDA(muestra_exponencial)

# Semilla
set.seed(123)

generar_matriz <- function(E){
  rate = 1/E
  n = 1000
  return(matrix(rexp(n,rate),c(100,10)))
}

# Vector
n <- 10000000
rate <- 4
vector <- rexp(n,rate) 

# Matriz
n_aux <- 1000 
matriz <-matrix(rexp(n_aux,rate),c(100,10))

# Array
array1 <- array(c(generar_matriz(2),generar_matriz(1.5),generar_matriz(3)),dim = c(100,10,3))

# Lista
lista1 <- list(m=100,n=10,lambda=c(1/4,2,1.5,3),mean_vector= mean(vector),means_rows=rowMeans(matriz),matriz_medias=matrix(c(rowMeans(array1[,,1]),rowMeans(array1[,,2]),rowMeans(array1[,,3])),c(100,3)))

# Lista Final

lista_f <- list(vec= vector, matr = matriz, arr = array1, list_f =lista1)

lista_f$list_f$matriz_medias[50,c(2,3)]    





matrix(LETTERS[1:8],c(4,2))
