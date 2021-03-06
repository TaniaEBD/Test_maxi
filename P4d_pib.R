#4. De los datos del PIB mundial, los valores est�n solo hasta 2017.
#(d)Si combinamos los PIB de M�xico, Canad� y Estados Unidos � Cu�l ser� su comportamiento para 2060? �Ser�n competencia para China?
library(readxl)
PIBmundial <- read_excel("C:/Users/Casa/Desktop/BI_new_test_maxi/2do intento/BI_new_test_maxi/PIB/PIB1.xlsx")
View(PIBmundial)

#Obtenemos el promedio de M�xico,Canada y EU
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
PromMCE2$A�os <- as.numeric(PIBmundial$A�os) 
View(PromMCE2) 
names(PromMCE2)
plot(PromMCE2$A�os,PromMCE2$PromMCE, xlab="A�os",ylab="Mean Mex,Can,EUA")

# sacamos regresi�n de MCE y calculamos con 2060
RegresionMCE <-lm( PromMCE ~ A�os, data=PromMCE2)
RegresionMCE
summary(RegresionMCE)

i <- data.frame(A�os = 2060)
i
PIB_MCE <- predict(RegresionMCE,i)
PIB_MCE

# sacamos regresi�n de China y calculamos con 2060
RegresionChina <- lm( China ~ A�os, data=PIBmundial)
RegresionChina
summary(RegresionChina)
                      
j<- data.frame(A�os = 2060)
j
PIB_China <- predict(RegresionChina,j)
PIB_China                        
#Comparamos PIB_MCE vs PIB_China

  if (PIB_MCE>PIB_China) {
    print("Combinando por promedio el PIB de M�xico, Canad� y Estados Unidos s� podr�an ser competencia para China")
  } else {
    print("A�n combinando por promedio el PIB de M�xico, Canad� y Estados Unidos no podr�an ser competencia para China")
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

#Obtenemos la suma de M�xico,Canada y EU
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
SumMCE2$A�os <- as.numeric(PIBmundial$A�os) 
View(SumMCE2) 
names(SumMCE2)
plot(SumMCE2$A�os,SumMCE2$SumMCE, xlab="A�os",ylab="Sum Mex,Can,EUA")

# sacamos regresi�n de MCE y calculamos con 2060
RegresionMCE <-lm( SumMCE ~ A�os, data=SumMCE2)
RegresionMCE
summary(RegresionMCE)

i <- data.frame(A�os = 2060)
i
PIB_MCE <- predict(RegresionMCE,i)
PIB_MCE

# sacamos regresi�n de China y calculamos con 2060
RegresionChina <- lm( China ~ A�os, data=PIBmundial)
RegresionChina
summary(RegresionChina)

j<- data.frame(A�os = 2060)
j
PIB_China <- predict(RegresionChina,j)
PIB_China                        

#Comparamos PIB_MCE vs PIB_China
if (PIB_MCE>PIB_China) {
  print("Combinando por suma el PIB de M�xico, Canad� y Estados Unidos s� podr�an ser competencia para China")
} else {
  print("A�n combinando por suma el PIB de M�xico, Canad� y Estados Unidos no podr�an ser competencia para China")
}  

#Observamos el comportamiento de MCE
PIBsumaMCE <- PIB_MCE
PIBChina <-PIB_China
PIBsumaMCE
PIBpromedioMCE
PIBChina
