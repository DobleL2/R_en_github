

# ----------------- Entorno de trabajo ---------------------------

# Te indica el nombre de las variables que se encuentran en el espacio de trabajo
ls()
typeof(ls())

# Eliminar algun dato guardado en memoria
remove(x)

# Eliminar todos los objetos existentes
rm(list=ls())

# Eliminar todos los objetos existentes dado algun patron
rm(list=ls(pattern="new"))

# Asignar el valor a una variable
x <- 5
5 -> y
z <- list(a=1,b=2)

# Verificar los objetos almacenados en el workspace
objects()
typeof(objects())

# Verificar la ubicacion donde esta ubicado el archivo
getwd()


# -------------- Creacion de vectores ---------------------------

# Valores logicos
logi_var <- c(TRUE,FALSE,TRUE,TRUE) 
logi_var

# Valores enteros
int_var <- c(2L,4L,7L,5L)
int_var

# Valores decimales
dbl_var <- c(2.3, 6.8, 4.1)
dbl_var

# Valores complejos
cpl_var <- c(3+6i,5-2i,-8i)
cpl_var

# Valores caracteres
chr_var <- c("statistical","model","test")
chr_var


# --------------- Metodos de vectores ------------------------------

mode(logi_var) # Ver el tipo de dato en el vector
length(logi_var) # Ver la longitud del vector
typeof(int_var) # Ver la raiz del tipo de dato por ejemplo en numeric hay (integer o double)

# --------------- Vectores vacios ----------------------------------

vacio_numeric <- vector("numeric",10) # 0
vacio_numeric

vacio_logical <- vector("logical",5) # FALSE
vacio_logical

vector_complex <- vector("complex",4) # 0+0i
vector_complex 

vector_character <- vector("character") # ""
vector_character 

# ---------------- Revisar NAs ------------------------------------

x_vec <- c(2,3,NA,8)

# Devuelve un vector de TRUE y FALSE
is.na(x_vec)

# Devuelve la posicion donde el na
which(is.na(x_vec))

# Devuelve la posicion donde no hay na
which(!is.na(x_vec))

# Filtrar dada una condicion en un nuevo vector
new_x_vec <- x_vec[which(!is.na(x_vec))]


# ------------------- Verificar tipo de datos y cambiar ----------

# Comprobaciòn
is.logical(x_vec)
is.numeric(x_vec)
is.complex(x_vec)
is.double(x_vec)
is.integer(x_vec)
is.character(x_vec)

# Cambio
as.logical(x_vec)
as.numeric(x_vec)
as.complex(x_vec)
as.double(x_vec)
as.integer(x_vec)
as.character(x_vec)

# ------------------- Diferentes tipos de NA ---------------------

NA_real_
NA_integer_
NA_character_
NA_complex_

# ---------------- Generar sequencias -----------------------------

1:5
seq()
seq(1,5)
seq(1,10,2)
seq(1,10,length.out=100)



# ----------------- Dar nombre a los elementos de un vector -------

y <- 1:5
names(y) <- c("uno","dos","tres","cuatro","cinco")
attr(y,"names") <- c("uno","dos","tres","cuatro","cinco")


# ----------------- FACTORES --------------------------------------

vec_gen <- c("m", "f", "f", "m", "m", "f")
class(vec_gen)

table(vec_gen)

# Creacion del factor
genero <- factor(vec_gen,
                 levels = c("m", "f", "o"),
                 labels = c("Masculino", "Femenino", "Otro"), ordered = FALSE)

table(genero)



valores <- c(2, 1, 2, 3, 2, 3, 1, 2, 3)
new_fac <- factor(x = valores)
new_fac
table(new_fac)

levels(new_fac)


valores <- c("m", "b", "m", "a", "m", "a", "b", "m", "a")
new_fac <- factor(x = valores)
levels(new_fac) <- c("b","m","a")
table(new_fac)
