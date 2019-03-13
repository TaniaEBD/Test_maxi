#7. ¿En qué horas deberíamos poner los coches?
library(readxl)
testmaxiV8 <- read_excel("C:/Users/Casa/Desktop/BI_new_test_maxi/2do intento/BI_new_test_maxi/testmaxiV8.xlsx")
View(testmaxiV8)
Horas <- data.frame(testmaxiV8$Horario)
Horas
Coches <- data.frame(testmaxiV8$taxi_id)
Coches
Coches_Horas <- cbind(Horas,Coches)
names(Coches_Horas)
colnames(Coches_Horas)[1] <- 'Horario'
colnames(Coches_Horas)[2] <- 'Coches'
names(Coches_Horas)
View(Coches_Horas)

Coches_Horas2 <- Coches_Horas[!is.na(Coches_Horas$Coches),]
View(Coches_Horas2)

Viajes_Coche_Horas <- Coches_Horas2 %>%
  group_by(Horario,Coches) %>%
  summarise(x = sum(Horario, no.rm=TRUE),
            count = n())
View(Viajes_Coche_Horas)

Viajes_Coche_Horas2 <- Viajes_Coche_Horas %>%
  group_by(Horario) %>%
  summarise(x = sum(count, no.rm=TRUE),
            count = n())
View(Viajes_Coche_Horas2)
 
colnames(Viajes_Coche_Horas2)[2] <- 'Viajes'
colnames(Viajes_Coche_Horas2)[3] <- 'Coches'

View(Viajes_Coche_Horas2)

Viajes_Coche_Horas2$ViajexCoche <- Viajes_Coche_Horas2$Viajes / Viajes_Coche_Horas2$Coches
View(Viajes_Coche_Horas2)

Viajes_Coche_Horas3 <- Viajes_Coche_Horas2[order(Viajes_Coche_Horas2$ViajexCoche, decreasing = TRUE),]
View(Viajes_Coche_Horas3)

#se muestran los que tienen mayor demanda en horario por lo que se deberian de poner mas coches
HorariosCoches <- Viajes_Coche_Horas3[1:3,]
HorariosCoches
print(paste("Debemos de poner más coches en el horario de las",HorariosCoches$Horario,"Hrs. ya que hay una alta demanda de",HorariosCoches$ViajexCoche,"viajes por coche"))
