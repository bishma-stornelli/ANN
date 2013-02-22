# Graficas Proy 1 Inteligencia

#########################
# Multicapa 1000

jpeg('data1000.jpg')
data1000azules <- read.table(file="datos_r6_n1000.txt_0", header= FALSE, sep=",")
data1000rojos <- read.table(file="datos_r6_n1000.txt_1", header= FALSE, sep=",")
plot(data1000azules[,1], data1000azules[,2], main="1000 Patrones", xlab="Eje X", ylab="Eje Y",col = "darkblue", col.main="blue", pch = 20, xlim= c(0, 20), ylim=c(0,20))
points(data1000rojos[,1], data1000rojos[,2], col = "red", pch = 20)

legend("topright", inset=.02, title="Tipos de puntos", c("En circulo","En cuadrado"),fill= c("blue", "red") , horiz=FALSE)

dev.off()

##################

# Multicapa 500

jpeg('data500.jpg')
data500azules <- read.table(file="datos_r6_n500.txt_0", header= FALSE, sep=",")
data500rojos <- read.table(file="datos_r6_n500.txt_1", header= FALSE, sep=",")
plot(data500azules[,1], data500azules[,2], main="500 Patrones", xlab="Eje X", ylab="Eje Y",col = "darkblue", col.main="blue", pch = 20, xlim= c(0, 20), ylim=c(0,20))
points(data500rojos[,1], data500rojos[,2], col = "red", pch = 20)

legend("topright", inset=.02, title="Tipos de puntos", c("En circulo","En cuadrado"),fill= c("blue", "red") , horiz=FALSE)

dev.off()
     
##################

# Multicapa 2000

jpeg('data2000.jpg')
data2000azules <- read.table(file="datos_r6_n2000.txt_0", header= FALSE, sep=",")
data2000rojos <- read.table(file="datos_r6_n2000.txt_1", header= FALSE, sep=",")
plot(data2000azules[,1], data2000azules[,2], main="2000 Patrones", xlab="Eje X", ylab="Eje Y",col = "darkblue", col.main="blue", pch = 20, xlim= c(0, 20), ylim=c(0,20))
points(data2000rojos[,1], data2000rojos[,2], col = "red", pch = 20)

legend("topright", inset=.02, title="Tipos de puntos", c("En circulo","En cuadrado"),fill= c("blue", "red") , horiz=FALSE)

dev.off()

##################

# Multicapa own 500

jpeg('dataown500.jpg')
data2000azules <- read.table(file="own_500_0", header= FALSE, sep=",")
data2000rojos <- read.table(file="own_500_1", header= FALSE, sep=",")
plot(data2000azules[,1], data2000azules[,2], main="500 Patrones", xlab="Eje X", ylab="Eje Y",col = "darkblue", col.main="blue", pch = 20, xlim= c(0, 20), ylim=c(0,20))
points(data2000rojos[,1], data2000rojos[,2], col = "red", pch = 20)

legend("topright", inset=.02, title="Tipos de puntos", c("En circulo","En cuadrado"),fill= c("blue", "red") , horiz=FALSE)

dev.off()

########### Pregunta 3
# Bupa data corte 40 error entren
par(mfrow=c(1,3))
dataB <- read.table(file="b_40_0.csv", header= FALSE, sep=",")
plot(dataB[,1], dataB[,2], main="Adaline, 40 Ejs, Corrida 0",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(1, 3), xlim=c(1,25))
lines(dataB[,1], dataB[,2], col="darkblue")
# error de prueba
dataB <- read.table(file="b_40_0.csv", header= FALSE, sep=",")
points(dataB[,1], dataB[,3], col = "red")
lines(dataB[,1], dataB[,3], col = "red")
legend("topright", inset=.02, title="Tipo de Error",
     c("Error de Entrenamiento", "Error de Prueba"),fill= c("darkblue","red") , horiz=FALSE)
# error entrenamiento
dataB <- read.table(file="b_40_1.csv", header= FALSE, sep=",")
plot(dataB[,1], dataB[,2], main="Adaline, 40 Ejs, Corrida 1",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(1, 3), xlim=c(1,25))
lines(dataB[,1], dataB[,2], col="darkblue")
# error de pueba
dataB <- read.table(file="b_40_1.csv", header= FALSE, sep=",")
points(dataB[,1], dataB[,3], col = "red")
lines(dataB[,1], dataB[,3], col = "red")
legend("topright", inset=.02, title="Tipo de Error",
     c("Error de Entrenamiento", "Error de Prueba"),fill= c("darkblue","red") , horiz=FALSE)
# error de entrenamiento
dataB <- read.table(file="b_40_2.csv", header= FALSE, sep=",")
plot(dataB[,1], dataB[,2], main="Adaline, 40 Ejs, Corrida 2",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(1, 3), xlim=c(1,25))
lines(dataB[,1], dataB[,2], col="darkblue")
# error de pueba
dataB <- read.table(file="b_40_2.csv", header= FALSE, sep=",")
points(dataB[,1], dataB[,3], col = "red")
lines(dataB[,1], dataB[,3], col = "red")
legend("topright", inset=.02, title="Tipo de Error",
     c("Error de Entrenamiento", "Error de Prueba"),fill= c("darkblue","red") , horiz=FALSE)
     
## ADALINE 80 ejemplo
# Bupa data corte 40 error entren
par(mfrow=c(1,3))
## ADaline 80, 0
dataB <- read.table(file="b_80_0.csv", header= FALSE, sep=",")
plot(dataB[,1], dataB[,2], main="Adaline, 80 Ejs, Corrida 0",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(1, 3), xlim=c(1,25))
lines(dataB[,1], dataB[,2], col="darkblue")
# error de prueba
dataB <- read.table(file="b_80_0.csv", header= FALSE, sep=",")
points(dataB[,1], dataB[,3], col = "red")
lines(dataB[,1], dataB[,3], col = "red")
legend("topright", inset=.02, title="Tipo de Error",
     c("Error de Entrenamiento", "Error de Prueba"),fill= c("darkblue","red") , horiz=FALSE)
     
## Adaline 80, 1
dataB <- read.table(file="b_80_1.csv", header= FALSE, sep=",")
plot(dataB[,1], dataB[,2], main="Adaline, 80 Ejs, Corrida 1",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(1, 3), xlim=c(1,25))
lines(dataB[,1], dataB[,2], col="darkblue")
# error de prueba
dataB <- read.table(file="b_80_1.csv", header= FALSE, sep=",")
points(dataB[,1], dataB[,3], col = "red")
lines(dataB[,1], dataB[,3], col = "red")
legend("topright", inset=.02, title="Tipo de Error",
     c("Error de Entrenamiento", "Error de Prueba"),fill= c("darkblue","red") , horiz=FALSE)

##adaline 80 ,2
dataB <- read.table(file="b_80_2.csv", header= FALSE, sep=",")
plot(dataB[,1], dataB[,2], main="Adaline, 80 Ejs, Corrida 2",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(1, 3), xlim=c(1,25))
lines(dataB[,1], dataB[,2], col="darkblue")
# error de prueba
dataB <- read.table(file="b_80_2.csv", header= FALSE, sep=",")
points(dataB[,1], dataB[,3], col = "red")
lines(dataB[,1], dataB[,3], col = "red")
legend("topright", inset=.02, title="Tipo de Error",
     c("Error de Entrenamiento", "Error de Prueba"),fill= c("darkblue","red") , horiz=FALSE)
         
################ ADALINE 120 EJEMPLOS
## ADALINE 120 ejemplo
# Bupa data corte 40 error entren
par(mfrow=c(1,3))
## ADaline 120, 0
dataB <- read.table(file="b_120_0.csv", header= FALSE, sep=",")
plot(dataB[,1], dataB[,2], main="Adaline, 120 Ejs, Corrida 0",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(1, 3), xlim=c(1,25))
lines(dataB[,1], dataB[,2], col="darkblue")
# error de prueba
dataB <- read.table(file="b_120_0.csv", header= FALSE, sep=",")
points(dataB[,1], dataB[,3], col = "red")
lines(dataB[,1], dataB[,3], col = "red")
legend("topright", inset=.02, title="Tipo de Error",
     c("Error de Entrenamiento", "Error de Prueba"),fill= c("darkblue","red") , horiz=FALSE)
     
## Adaline 120, 1
dataB <- read.table(file="b_120_1.csv", header= FALSE, sep=",")
plot(dataB[,1], dataB[,2], main="Adaline, 120 Ejs, Corrida 1",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(1, 3), xlim=c(1,25))
lines(dataB[,1], dataB[,2], col="darkblue")
# error de prueba
dataB <- read.table(file="b_120_1.csv", header= FALSE, sep=",")
points(dataB[,1], dataB[,3], col = "red")
lines(dataB[,1], dataB[,3], col = "red")
legend("topright", inset=.02, title="Tipo de Error",
     c("Error de Entrenamiento", "Error de Prueba"),fill= c("darkblue","red") , horiz=FALSE)

##adaline 120 ,2
dataB <- read.table(file="b_120_2.csv", header= FALSE, sep=",")
plot(dataB[,1], dataB[,2], main="Adaline, 120 Ejs, Corrida 2",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(1, 3), xlim=c(1,25))
lines(dataB[,1], dataB[,2], col="darkblue")
# error de prueba
dataB <- read.table(file="b_120_2.csv", header= FALSE, sep=",")
points(dataB[,1], dataB[,3], col = "red")
lines(dataB[,1], dataB[,3], col = "red")
legend("topright", inset=.02, title="Tipo de Error",
     c("Error de Entrenamiento", "Error de Prueba"),fill= c("darkblue","red") , horiz=FALSE)
         
## ADALINE 160 ejemplos

# Bupa data corte 40 error entren
par(mfrow=c(1,3))
## ADaline 160, 0
dataB <- read.table(file="b_160_0.csv", header= FALSE, sep=",")
plot(dataB[,1], dataB[,2], main="Adaline, 160 Ejs, Corrida 0",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(1, 3), xlim=c(1,25))
lines(dataB[,1], dataB[,2], col="darkblue")
# error de prueba
dataB <- read.table(file="b_160_0.csv", header= FALSE, sep=",")
points(dataB[,1], dataB[,3], col = "red")
lines(dataB[,1], dataB[,3], col = "red")
legend("topright", inset=.02, title="Tipo de Error",
     c("Error de Entrenamiento", "Error de Prueba"),fill= c("darkblue","red") , horiz=FALSE)
     
## Adaline 160, 1
dataB <- read.table(file="b_160_1.csv", header= FALSE, sep=",")
plot(dataB[,1], dataB[,2], main="Adaline, 160 Ejs, Corrida 1",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(1, 3), xlim=c(1,25))
lines(dataB[,1], dataB[,2], col="darkblue")
# error de prueba
dataB <- read.table(file="b_160_1.csv", header= FALSE, sep=",")
points(dataB[,1], dataB[,3], col = "red")
lines(dataB[,1], dataB[,3], col = "red")
legend("topright", inset=.02, title="Tipo de Error",
     c("Error de Entrenamiento", "Error de Prueba"),fill= c("darkblue","red") , horiz=FALSE)

##adaline 160 ,2
dataB <- read.table(file="b_160_2.csv", header= FALSE, sep=",")
plot(dataB[,1], dataB[,2], main="Adaline, 160 Ejs, Corrida 2",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(1, 3), xlim=c(1,25))
lines(dataB[,1], dataB[,2], col="darkblue")
# error de prueba
dataB <- read.table(file="b_160_2.csv", header= FALSE, sep=",")
points(dataB[,1], dataB[,3], col = "red")
lines(dataB[,1], dataB[,3], col = "red")
legend("topright", inset=.02, title="Tipo de Error",
     c("Error de Entrenamiento", "Error de Prueba"),fill= c("darkblue","red") , horiz=FALSE)

##### 
## ADALINE 200 ejemplo
# Bupa data corte 40 error entren
par(mfrow=c(1,3))
## ADaline 200, 0
dataB <- read.table(file="b_200_0.csv", header= FALSE, sep=",")
plot(dataB[,1], dataB[,2], main="Adaline, 200 Ejs, Corrida 0",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(1, 3), xlim=c(1,25))
lines(dataB[,1], dataB[,2], col="darkblue")
# error de prueba
dataB <- read.table(file="b_200_0.csv", header= FALSE, sep=",")
points(dataB[,1], dataB[,3], col = "red")
lines(dataB[,1], dataB[,3], col = "red")
legend("topright", inset=.02, title="Tipo de Error",
     c("Error de Entrenamiento", "Error de Prueba"),fill= c("darkblue","red") , horiz=FALSE)
     
## Adaline 200, 1
dataB <- read.table(file="b_200_1.csv", header= FALSE, sep=",")
plot(dataB[,1], dataB[,2], main="Adaline, 200 Ejs, Corrida 1",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(1, 3), xlim=c(1,25))
lines(dataB[,1], dataB[,2], col="darkblue")
# error de prueba
dataB <- read.table(file="b_200_1.csv", header= FALSE, sep=",")
points(dataB[,1], dataB[,3], col = "red")
lines(dataB[,1], dataB[,3], col = "red")
legend("topright", inset=.02, title="Tipo de Error",
     c("Error de Entrenamiento", "Error de Prueba"),fill= c("darkblue","red") , horiz=FALSE)

##adaline 200 ,2
dataB <- read.table(file="b_200_2.csv", header= FALSE, sep=",")
plot(dataB[,1], dataB[,2], main="Adaline, 200 Ejs, Corrida 2",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(1, 3), xlim=c(1,25))
lines(dataB[,1], dataB[,2], col="darkblue")
# error de prueba
dataB <- read.table(file="b_200_2.csv", header= FALSE, sep=",")
points(dataB[,1], dataB[,3], col = "red")
lines(dataB[,1], dataB[,3], col = "red")
legend("topright", inset=.02, title="Tipo de Error",
     c("Error de Entrenamiento", "Error de Prueba"),fill= c("darkblue","red") , horiz=FALSE)