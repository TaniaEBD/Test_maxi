#11. ¿Hay pasajeros leales? ¿ Hay pasajeros que debemos quitar?
library(readxl)
testmaxiV8 <- read_excel("C:/Users/Casa/Desktop/BI_new_test_maxi/2do intento/BI_new_test_maxi/testmaxiV8.xlsx")
View(testmaxiV8)
Rider <- data.frame(testmaxiV8$user_id)
Rider
Rscore <- data.frame(testmaxiV8$rider_score)
Rscore
Rider_Score <- cbind(Rider,Rscore)
colnames(Rider_Score)[1] <- 'Rider'
colnames(Rider_Score)[2] <- 'Score'
names(Rider_Score)
View(Rider_Score)

Rider_Score2 <- Rider_Score[!is.na(Rider_Score$Rider),]
View(Rider_Score2)
Rider_Score3 <- Rider_Score[!is.na(Rider_Score$Score),]
View(Rider_Score3)

PasajeroScore <- Rider_Score3 %>%
  group_by(Rider,Score) %>%
  summarise(x = sum(Score, no.rm=TRUE),
            count = n())
PasajeroScore
class(PasajeroScore)

#Para obtener los Pasajeroes más leales
PasajeroScore2 <- PasajeroScore[PasajeroScore$Score > 4, ]
PasajeroScore2


RScore_5 <- PasajeroScore2[order(PasajeroScore2$count, decreasing = TRUE),]
RScore_5
PasajeroBonificacion <- RScore_5[1:3,]
PasajeroBonificacion
print(paste("Entre los más leales es el Pasajero:",PasajeroBonificacion$Rider,"por haber tenido un total de",PasajeroBonificacion$count, "viajes de score 5"))


#Para obtener los Pasajeroes a quien se les deberia de dar de baja
PasajeroScore3 <- PasajeroScore[PasajeroScore$Score == 0, ]
PasajeroScore3


RScore_0 <- PasajeroScore3[order(PasajeroScore3$count, decreasing = TRUE),]
RScore_0
#se contemplan 3 mas en los más altos por si los anteriores de bonificación aparecen
PasajeroDespido <- RScore_0[1:6,]
PasajeroDespido
PasajeroDespido2 <- PasajeroDespido[c(1:2,4),]
PasajeroDespido2
print(paste("Se debería contemplar quitar al Pasajero:",PasajeroDespido2$Rider,"por haber tenido un total de",PasajeroDespido2$count, "viajes de score 0"))
