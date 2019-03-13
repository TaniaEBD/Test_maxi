#5. De los datos de la población. Nota: Explica tu procedimiento/modelo para cada respuesta. Cada pregunta deberá tener un grá???co y la explicación del modelo 
#    (a)	¿En qué año la población mundial puede que supere los 11 mil millones de personas? 
library(readxl)
Poblacion <- read_excel("C:/Users/Casa/Desktop/BI_new_test_maxi/2do intento/BI_new_test_maxi/Población/Población.xlsx")
View(Poblacion)
Mundo <- as.data.frame(Poblacion$World)
Mundo
Años <- as.numeric(Poblacion$Año)
Años
Años_Mundo <- cbind(Años,Mundo)

names(Años_Mundo)
colnames(Años_Mundo)[2] <- 'Mundo'
names(Años_Mundo)
plot(Años_Mundo$Años,Años_Mundo$Mundo, xlab="Años", ylab="PIB Mundo")

RegresionMundo <-lm(Mundo ~ Años, data=Años_Mundo)
RegresionMundo
summary(RegresionMundo)

F = 11000000000
F
i <- data.frame(Años = 2018)
i
PMundo <- predict(RegresionMundo,i)

while(PMundo <= F)
{PMundo <- predict(RegresionMundo,i)
  i <- data.frame(Años = i+1)
}
print(paste("La población mundial superara los 11 mil millones de habitantes en el año",i, "con una población aproximada de",PMundo))
