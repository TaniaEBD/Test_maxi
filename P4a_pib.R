#4. De los datos del PIB mundial, los valores están solo hasta 2017.
#a)¿Cuál será el PIB (GBP) para México en el año 2050?
library(readxl)
PIBmundial <- read_excel("C:/Users/Casa/Desktop/BI_new_test_maxi/2do intento/BI_new_test_maxi/PIB/PIB1.xlsx")
View(PIBmundial)
Años <- PIBmundial$Años
Mexico <- as.data.frame(PIBmundial$Mexico)

Años_Mexico <- cbind(Años,Mexico)
plot(Años_Mexico)
View(Años_Mexico)

names(Años_Mexico)
colnames(Años_Mexico)[2] <- 'Mexico'  
names(Años_Mexico)

RegresionMexico <-lm(Mexico ~ Años, data= Años_Mexico)
RegresionMexico
summary(Años_Mexico)

i <- data.frame(Años = 2050)
i
PIB_Mexico <- predict(RegresionMexico,i)
PIB_Mexico

print(paste("El PIB para México en el año 2050 será de", PIB_Mexico))
            