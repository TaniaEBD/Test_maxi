#5. De los datos de la poblaci�n. Nota: Explica tu procedimiento/modelo para cada respuesta. Cada pregunta deber� tener un gr�???co y la explicaci�n del modelo 
#    (a)	�En qu� a�o la poblaci�n mundial puede que supere los 11 mil millones de personas? 
library(readxl)
Poblacion <- read_excel("C:/Users/Casa/Desktop/BI_new_test_maxi/2do intento/BI_new_test_maxi/Poblaci�n/Poblaci�n.xlsx")
View(Poblacion)
Mundo <- as.data.frame(Poblacion$World)
Mundo
A�os <- as.numeric(Poblacion$A�o)
A�os
A�os_Mundo <- cbind(A�os,Mundo)

names(A�os_Mundo)
colnames(A�os_Mundo)[2] <- 'Mundo'
names(A�os_Mundo)
plot(A�os_Mundo$A�os,A�os_Mundo$Mundo, xlab="A�os", ylab="PIB Mundo")

RegresionMundo <-lm(Mundo ~ A�os, data=A�os_Mundo)
RegresionMundo
summary(RegresionMundo)

F = 11000000000
F
i <- data.frame(A�os = 2018)
i
PMundo <- predict(RegresionMundo,i)

while(PMundo <= F)
{PMundo <- predict(RegresionMundo,i)
  i <- data.frame(A�os = i+1)
}
print(paste("La poblaci�n mundial superara los 11 mil millones de habitantes en el a�o",i, "con una poblaci�n aproximada de",PMundo))
