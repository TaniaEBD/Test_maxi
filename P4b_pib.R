#4. De los datos del PIB mundial, los valores est�n solo hasta 2017.
#b) �En qu� a�o China superar� a Estados Unidos como el pa�s con mayor PIB?
library(readxl)
PIBmundial <- read_excel("C:/Users/Casa/Desktop/BI_new_test_maxi/2do intento/BI_new_test_maxi/PIB/PIB1.xlsx")
View(PIBmundial)
A�os <- PIBmundial$A�os
China <- as.data.frame(PIBmundial$China)
EstadosUnidos <- as.data.frame(PIBmundial$`United States`)

PIB_ChinavsEU <- cbind(A�os,China,EstadosUnidos)
View(PIB_ChinavsEU)
class(PIB_ChinavsEU)

names(PIB_ChinavsEU)
colnames(PIB_ChinavsEU)[2] <- 'China'  
colnames(PIB_ChinavsEU)[3] <- 'EstadosUnidos'
names(PIB_ChinavsEU)
plot(PIB_ChinavsEU$A�os,PIB_ChinavsEU$China, xlab="A�os", ylab="PIB China")
plot(PIB_ChinavsEU$A�os,PIB_ChinavsEU$EstadosUnidos, xlab="A�os", ylab="PIB EU")


RegresionChina <-lm(China ~ A�os, data= PIB_ChinavsEU)
RegresionChina
summary(RegresionChina)

RegresionEU <-lm(EstadosUnidos ~ A�os, data= PIB_ChinavsEU)
RegresionEU
summary(RegresionEU)

i <- data.frame(A�os = 2018)
i
j <- data.frame(A�os = 2018)
PIB_China <- predict(RegresionChina,i)
PIB_EU <- predict(RegresionEU,j)
PIB_China
PIB_EU
while(PIB_China < PIB_EU)
{ PIB_China <- predict(RegresionChina,i)
  i <- i+1
  PIB_EU <- predict(RegresionEU,j)
  j <- j+1
}
print(paste("El a�o en que el PIB de China superar� a la de EU ser� en el",i))


