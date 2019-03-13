#4. De los datos del PIB mundial, los valores están solo hasta 2017.
#b) ¿En qué año China superará a Estados Unidos como el país con mayor PIB?
library(readxl)
PIBmundial <- read_excel("C:/Users/Casa/Desktop/BI_new_test_maxi/2do intento/BI_new_test_maxi/PIB/PIB1.xlsx")
View(PIBmundial)
Años <- PIBmundial$Años
China <- as.data.frame(PIBmundial$China)
EstadosUnidos <- as.data.frame(PIBmundial$`United States`)

PIB_ChinavsEU <- cbind(Años,China,EstadosUnidos)
View(PIB_ChinavsEU)
class(PIB_ChinavsEU)

names(PIB_ChinavsEU)
colnames(PIB_ChinavsEU)[2] <- 'China'  
colnames(PIB_ChinavsEU)[3] <- 'EstadosUnidos'
names(PIB_ChinavsEU)
plot(PIB_ChinavsEU$Años,PIB_ChinavsEU$China, xlab="Años", ylab="PIB China")
plot(PIB_ChinavsEU$Años,PIB_ChinavsEU$EstadosUnidos, xlab="Años", ylab="PIB EU")


RegresionChina <-lm(China ~ Años, data= PIB_ChinavsEU)
RegresionChina
summary(RegresionChina)

RegresionEU <-lm(EstadosUnidos ~ Años, data= PIB_ChinavsEU)
RegresionEU
summary(RegresionEU)

i <- data.frame(Años = 2018)
i
j <- data.frame(Años = 2018)
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
print(paste("El año en que el PIB de China superará a la de EU será en el",i))


