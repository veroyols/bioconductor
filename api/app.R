# api.R
library(plumber)

#* @get /hello
#* @param name Nombre del usuario
#* @response 200 Saludo personalizado
function(name = "Mundo") {
  list(message = paste("¡Hola,", name, "!"))
}

#* @get /sum
#* @param a Primer número
#* @param b Segundo número
#* @response 200 Resultado de la suma
function(a, b) {
  list(result = as.numeric(a) + as.numeric(b))
}
