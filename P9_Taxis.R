#9. ¿Los conductores están lo su???cientemente ocupados si lo comparamos con una jornada laboral estándar en México (8 horas)?
library(readxl)
testmaxiV8 <- read_excel("C:/Users/Casa/Desktop/BI_new_test_maxi/2do intento/BI_new_test_maxi/testmaxiV8.xlsx")
View(testmaxiV8)
Driver <- data.frame(testmaxiV8$driver_id)
Driver
Dia <- data.frame(testmaxiV8$`fecha inicio`)
Dia
Tiempo <- testmaxiV8$Minutos
Tiempo
DDT <- cbind(Driver,Dia,Tiempo)
colnames(DDT)[1] <- 'Driver'
colnames(DDT)[2] <- 'Dia'
names(DDT)
View(DDT)

DDT2 <- DDT[!is.na(DDT$Driver),]
View(DDT2)

ChoferxDia <- DDT2 %>%
  group_by(Driver,Dia) %>%
  summarise(sum_chofer = sum(Tiempo, no.rm=TRUE),
            count = n())


ChoferxDia

PromedioxDia <- mean(ChoferxDia$sum_chofer)

PromedioxDia
HorasPromedioxDia <- PromedioxDia/60
HorasPromedioxDia

