

# Ejercicio 1   
i_12 <- function(i){
  return (i^(1/12))
}

cuota_mensual <- function(C,i,n){
  return(C/((1-(1+i_12(1))^(-n))/i_12(i)))
}


# Ejercicio 2
fn2 <- function(k){
  return(k/(3^k*(k+1)))
}

sumatoria1 <- function(n){
  fn1 <- function(j){
    return(factorial(n)/(factorial(j)*factorial(n-j)))
  }
  return(sum(fn1(0:n)))
}

sumatoria2 <- function(n){
  fn2 <- function(k){
    return(k/(3^k*(k+1)))
  }
  return(sum(fn2(1:n)))
}

imprimir_resultados <- function(n){
  print("++++++++++++++++++++++++")
  print(paste("     Sumatorio 1:  ", sumatoria1(n)," "))
  print(paste("     Sumatorio 2:  ", sumatoria2(n)," "))
  print("++++++++++++++++++++++++")
}

imprimir_resultados(9)


# Ejercicio 3
sumatoria3 <- function(x,n){
  fn3 <- function(n){
    return(((-1)^(n-1)/n)*x^n)
  }
  return(sum(fn3(1:n)))
}
sumatoria3(0.5,10)


# Ejercicio 4

# Función para encontrar todos los números primos menores que n usando la Criba de Eratóstenes
numeros_primos <- function(n) {
  # Inicializar un vector de booleanos para marcar si un número es primo
  es_primo <- rep(TRUE, n)
  es_primo[1] <- FALSE  # 1 no es primo
  
  # Iterar sobre todos los números hasta la raíz cuadrada de n
  for (i in 2:sqrt(n)) {
    # Si el número actual es primo, marcar todos sus múltiplos como no primos
    if (es_primo[i]) {
      es_primo[i^2:n] <- FALSE
    }
  }
  
  # Devolver los números primos encontrados
  return(which(es_primo))
}

# Ejemplo de uso
numero_maximo <- 50  # Definir el número máximo
primos <- numeros_primos(numero_maximo)  # Encontrar todos los números primos menores que el número máximo
print(primos)

n <- 10
numeros_primos(n^2)




es_primo[2^2:100]

