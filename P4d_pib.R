#4. De los datos del PIB mundial, los valores están solo hasta 2017.
#(d)Si combinamos los PIB de México, Canadá y Estados Unidos ¿ Cuál será su comportamiento para 2060? ¿Serán competencia para China?
library(readxl)
PIBmundial <- read_excel("C:/Users/Casa/Desktop/BI_new_test_maxi/2do intento/BI_new_test_maxi/PIB/PIB1.xlsx")
View(PIBmundial)

#Obtenemos el promedio de México,Canada y EU
M <- as.numeric(PIBmundial$Mexico)   
C <- as.numeric(PIBmundial$Canada)
U <- as.numeric(PIBmundial$`United States`)

MCE <- as.array(cbind(M,C,U))
View(MCE)
PromMCE <- apply(MCE,1,mean)
View(PromMCE)
class(PromMCE)
PromMCE2 <- as.data.frame(PromMCE)
View(PromMCE2)
PromMCE2$Años <- as.numeric(PIBmundial$Años) 
View(PromMCE2) 
names(PromMCE2)
plot(PromMCE2$Años,PromMCE2$PromMCE, xlab="Años",ylab="Mean Mex,Can,EUA")

# sacamos regresión de MCE y calculamos con 2060
RegresionMCE <-lm( PromMCE ~ Años, data=PromMCE2)
RegresionMCE
summary(RegresionMCE)

i <- data.frame(Años = 2060)
i
PIB_MCE <- predict(RegresionMCE,i)
PIB_MCE

# sacamos regresión de China y calculamos con 2060
RegresionChina <- lm( China ~ Años, data=PIBmundial)
RegresionChina
summary(RegresionChina)
                      
j<- data.frame(Años = 2060)
j
PIB_China <- predict(RegresionChina,j)
PIB_China                        
#Comparamos PIB_MCE vs PIB_China

  if (PIB_MCE>PIB_China) {
    print("Combinando por promedio el PIB de México, Canadá y Estados Unidos sí podrían ser competencia para China")
  } else {
    print("Aún combinando por promedio el PIB de México, Canadá y Estados Unidos no podrían ser competencia para China")
  }  
                        
#Observamos el comportamiento de MCE
PIBpromedioMCE <- PIB_MCE
PIBChina <- PIB_China
PIBpromedioMCE
PIBChina
#-----------------------Combiado por Suma--------------------------
library(readxl)
PIBmundial <- read_excel("C:/Users/Casa/Desktop/BI_new_test_maxi/2do intento/BI_new_test_maxi/PIB/PIB1.xlsx")
View(PIBmundial)

#Obtenemos la suma de México,Canada y EU
M <- as.numeric(PIBmundial$Mexico)    
C <- as.numeric(PIBmundial$Canada)
U <- as.numeric(PIBmundial$`United States`)

MCE <- as.array(cbind(M,C,U))
View(MCE)
SumMCE <- apply(MCE,1,sum)
View(SumMCE)
class(SumMCE)
SumMCE2 <- as.data.frame(SumMCE)
View(SumMCE2)
SumMCE2$Años <- as.numeric(PIBmundial$Años) 
View(SumMCE2) 
names(SumMCE2)
plot(SumMCE2$Años,SumMCE2$SumMCE, xlab="Años",ylab="Sum Mex,Can,EUA")

# sacamos regresión de MCE y calculamos con 2060
RegresionMCE <-lm( SumMCE ~ Años, data=SumMCE2)
RegresionMCE
summary(RegresionMCE)

i <- data.frame(Años = 2060)
i
PIB_MCE <- predict(RegresionMCE,i)
PIB_MCE

# sacamos regresión de China y calculamos con 2060
RegresionChina <- lm( China ~ Años, data=PIBmundial)
RegresionChina
summary(RegresionChina)

j<- data.frame(Años = 2060)
j
PIB_China <- predict(RegresionChina,j)
PIB_China                        

#Comparamos PIB_MCE vs PIB_China
if (PIB_MCE>PIB_China) {
  print("Combinando por suma el PIB de México, Canadá y Estados Unidos sí podrían ser competencia para China")
} else {
  print("Aún combinando por suma el PIB de México, Canadá y Estados Unidos no podrían ser competencia para China")
}  

#Observamos el comportamiento de MCE
PIBsumaMCE <- PIB_MCE
PIBChina <-PIB_China
PIBsumaMCE
PIBpromedioMCE
PIBChina
