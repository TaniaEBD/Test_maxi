#4. De los datos del PIB mundial, los valores est�n solo hasta 2017.
#a)�Cu�l ser� el PIB (GBP) para M�xico en el a�o 2050?
library(readxl)
PIBmundial <- read_excel("C:/Users/Casa/Desktop/BI_new_test_maxi/2do intento/BI_new_test_maxi/PIB/PIB1.xlsx")
View(PIBmundial)
A�os <- PIBmundial$A�os
Mexico <- as.data.frame(PIBmundial$Mexico)

A�os_Mexico <- cbind(A�os,Mexico)
plot(A�os_Mexico)
View(A�os_Mexico)

names(A�os_Mexico)
colnames(A�os_Mexico)[2] <- 'Mexico'  
names(A�os_Mexico)

RegresionMexico <-lm(Mexico ~ A�os, data= A�os_Mexico)
RegresionMexico
summary(A�os_Mexico)

i <- data.frame(A�os = 2050)
i
PIB_Mexico <- predict(RegresionMexico,i)
PIB_Mexico

print(paste("El PIB para M�xico en el a�o 2050 ser� de", PIB_Mexico))
            