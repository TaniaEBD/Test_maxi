#6. ¿Dónde deberíamos poner los coches? 
testmaxiV8 <- read_excel("C:/Users/Casa/Desktop/BI_new_test_maxi/2do intento/BI_new_test_maxi/testmaxiV8.xlsx")
View(testmaxiV8)
Latitud <- data.frame(testmaxiV8$start_lat)
Latitud
Longitud <- data.frame(testmaxiV8$start_lon)
Longitud
Coches <- data.frame(testmaxiV8$taxi_id)
Minutos <- testmaxiV8$Minutos
LatLonCoche <- cbind(Latitud,Longitud,Coches,Minutos)
names(LatLonCoche)
colnames(LatLonCoche)[1] <- 'Latitud'
colnames(LatLonCoche)[2] <- 'Longitud'
colnames(LatLonCoche)[3] <- 'Coches'
names(LatLonCoche)
View(LatLonCoche)

LatLonCoche2 <- LatLonCoche[!is.na(LatLonCoche$Coches),]
View(LatLonCoche2)

LatLonCoche3 <- LatLonCoche2 %>%
  group_by(Latitud,Longitud,Coches) %>%
  summarise(x = sum(Minutos, no.rm=TRUE),
            count = n())
View(LatLonCoche3)

LatLonCoche4 <- LatLonCoche3 %>%
  group_by(Latitud,Longitud) %>%
  summarise(x = sum(count, no.rm=TRUE),
            count = n())
View(LatLonCoche4)

colnames(LatLonCoche4)[3] <- 'ViajesxZona'
colnames(LatLonCoche4)[4] <- 'CochesxZona'

LatLonCoche4$ViajesxCoche <- LatLonCoche4$ViajesxZona/LatLonCoche4$CochesxZona
View(LatLonCoche4)

LatLonCoche5 <- LatLonCoche4[order(LatLonCoche4$ViajesxCoche, decreasing = TRUE),]
View(LatLonCoche5)

#se muestran las zonas en las que se deberia de poner mayor número de coches al haber mayor cantidad de viajes por cche en esa zonamas coches
ViajesxCocheZona <- LatLonCoche5[1:3,]
ViajesxCocheZona
print(paste("Debemos de poner más coches en la zona: Latitud",ViajesxCocheZona$Latitud,"Longitud",ViajesxCocheZona$Longitud,"ya que hay una alta demanda de",ViajesxCocheZona$ViajesxCoche,"viajes por coche"))
