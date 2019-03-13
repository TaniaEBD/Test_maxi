#10. ¿A qué conductores darías bonos? ¿A cuáles les darías las gracias? 
library(readxl)
testmaxiV8 <- read_excel("C:/Users/Casa/Desktop/BI_new_test_maxi/2do intento/BI_new_test_maxi/testmaxiV8.xlsx")
View(testmaxiV8)
Driver <- data.frame(testmaxiV8$driver_id)
Driver
Dscore <- data.frame(testmaxiV8$driver_score)
Dscore
Driver_Score <- cbind(Driver,Dscore)
colnames(Driver_Score)[1] <- 'Driver'
colnames(Driver_Score)[2] <- 'Score'
names(Driver_Score)
View(Driver_Score)

Driver_Score2 <- Driver_Score[!is.na(Driver_Score$Driver),]
View(Driver_Score2)
Driver_Score3 <- Driver_Score[!is.na(Driver_Score$Score),]
View(Driver_Score3)

ChoferScore <- Driver_Score3 %>%
  group_by(Driver,Score) %>%
  summarise(x = sum(Score, no.rm=TRUE),
            count = n())
ChoferScore
class(ChoferScore)

#Para obtener los choferes a quien se les deberia de dar bonificación
ChoferesScore2 <- ChoferScore[ChoferScore$Score > 4, ]
ChoferesScore2


CScore_5 <- ChoferesScore2[order(ChoferesScore2$count, decreasing = TRUE),]
CScore_5
ChoferBonificacion <- CScore_5[1:3,]
ChoferBonificacion
print(paste("Se le debería de dar bonificación al chofer:",ChoferBonificacion$Driver,"por haber conseguido un total de",ChoferBonificacion$count, "viajes de score 5"))


#Para obtener los choferes a quien se les deberia de dar las gracias
ChoferesScore3 <- ChoferScore[ChoferScore$Score == 0, ]
ChoferesScore3


CScore_0 <- ChoferesScore3[order(ChoferesScore3$count, decreasing = TRUE),]
CScore_0
#se contemplan 3 mas en los más altos por si los anteriores de bonificación aparecen
ChoferDespido <- CScore_0[1:6,]
ChoferDespido
ChoferDespido2 <- ChoferDespido[c(3,5:6),]
ChoferDespido2
print(paste("Se le debería de dar las gracias al chofer:",ChoferDespido2$Driver,"por haber conseguido un total de",ChoferDespido2$count, "viajes de score 0"))
