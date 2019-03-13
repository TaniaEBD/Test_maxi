#8. ¿Nos faltan o sobran coches? ¿Cuándo? ¿Cómo? 
library(readxl)
testmaxiV7 <- read_excel("C:/Users/Casa/Desktop/BI_new_test_maxi/2do intento/BI_new_test_maxi/testmaxiV7.xlsx")
testmaxiV7

#Con esto obtenemos total de Choferes
Driver <- as.data.frame(testmaxiV7$driver_id)
Driver
class(Driver)
Choferes <- nrow(unique(Driver))
Choferes
class(Choferes)

#Con esto obtenemos total de Coches
Taxi <- as.data.frame(testmaxiV7$taxi_id)
Taxi
class(Taxi)
Coches <- nrow(unique(Taxi))
Coches
class(Coches)

#Comparamos los valores para saber si hacen falta o sobran coches
if (Choferes>Coches) {
  Diferencia <- Choferes-Coches
  print(paste("Hacen falta",Diferencia,"coches"))
} else {
  Diferencia <- Coches-Choferes
  print(paste("Sobran",Diferencia,"coches"))
}


