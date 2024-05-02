
# Sampling data 
valores <- c(0,1,2,3) 
probabilidades <- c(0.3,0.2,0.4,0.5)
n <- 100
sample(valores,n,T,probabilidades)[1:3]


# ----------- Valores y vectores propios ------------------------------

#
C <- matrix(sample(seq(1,20), size=9), nrow = 3, byrow = FALSE)

matrix(eigen(C)$vectors[2,],nrow=3,byrow=TRUE)

diag(c(1,2,3))

creador_matrices <- function(num){
  return(diag(1:num))
}

c(creador_matrices(7),creador_matrices(7))

c1 <- matrix(sample(seq(1,20), size=6), nrow = 2, byrow = FALSE)
c1
c2 <- matrix(sample(seq(1,20), size=6), nrow = 2, byrow = FALSE)
c2

my_array <- array(c(c1,c2),c(2,3,2))
my_array
my_array[, , 1]

vec_y <- sample(seq(1,20), size=12)
array(vec_y,c(2,3,2))

# El dolar es equivalente al doble corchete

lista <- list(c(2L, 5L, 8L), diag(4), c("a", "b", "c", "d", "e"))
attr(lista,"names") <- c("lista1","matriz1","lista2")
lista
attributes(lista)


