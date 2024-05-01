

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

vector_complex <- vector("character") # ""
vector_complex 

# ---------------- Revisar NAs ------------------------------------

x_vec <- c(2,3,NA,8)

# Filtrar dada una condicion en un nuevo vector
new_x_vec <- x_vec[which(!is.na(x_vec))]


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
