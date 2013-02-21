# Graficas Proy 1 Inteligencia

#########################
# Multicapa 
dataOR1 <- read.table(file="or.data_PerceptronLearner_false_0.01.cvs", header= FALSE, sep=",")
plot(dataOR1[,1], dataOR1[,2], main="Perceptrón, Función OR", xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue")
lines(dataOR1[,1], dataOR1[,2], col="darkblue")
  	 
##################

#Perceptron XOR False
#tasa 0.3
dataXOR1 <- read.table(file="Xor_P_F_0.3.csv", header= FALSE, sep=",")
plot(dataXOR1[,1], dataXOR1[,2], main="Perceptrón, Función XOR", xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(0, 4))
lines(dataXOR1[,1], dataXOR1[,2], col="darkblue")
#tasa 0.01
dataXOR2 <- read.table(file="Xor_P_F_0.01.csv", header= FALSE, sep=",")
points(dataXOR2[,1], dataXOR2[,2], col = "red")
lines(dataXOR2[,1], dataXOR2[,2], col = "red")
#tasa 0.1
dataXOR3 <- read.table(file="Xor_P_F_0.1.csv", header= FALSE, sep=",")
points(dataXOR3[,1], dataXOR3[,2], col = "green")
lines(dataXOR3[,1], dataXOR3[,2], col = "green")
#tasa 0.5
dataXOR4 <- read.table(file="Xor_P_F_0.5.csv", header= FALSE, sep=",")
points(dataXOR4[,1], dataXOR4[,2], col = "orange")
lines(dataXOR4[,1], dataXOR4[,2], col = "orange")
#tasa 0.99
dataXOR5 <- read.table(file="Xor_P_F_0.99.csv", header= FALSE, sep=",")
points(dataXOR5[,1], dataXOR5[,2], col = "darkcyan")
lines(dataXOR5[,1], dataXOR5[,2], col = "darkcyan")
legend("topright", inset=.02, title="Tasas de Entrenamiento",
  	 c("0.3, 0.4","0.01", "0.1","0.5, 0.05", "0.99"),fill= c("darkblue", "red", "green", "orange", "darkcyan") , horiz=FALSE)

#########################  PREGUNTA 2
### DELTA AND FALSE
par(mfrow=c(1,2))
#tasa 0.01
dataD1 <- read.table(file="and.data_DeltaLearner_false_0.01.cvs", header= FALSE, sep=",")
plot(dataD1[,1], dataD1[,2], main="Delta, Función AND", xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(0, 3))
lines(dataD1[,1], dataD1[,2], col="darkblue")
#tasa 0.1
dataD2 <- read.table(file="and.data_DeltaLearner_false_0.1.cvs", header= FALSE, sep=",")
points(dataD2[,1], dataD2[,2], col = "red")
lines(dataD2[,1], dataD2[,2], col = "red")
#tasa 0.3
dataD3 <- read.table(file="and.data_DeltaLearner_false_0.3.cvs", header= FALSE, sep=",")
points(dataD3[,1], dataD3[,2], col = "green")
lines(dataD3[,1], dataD3[,2], col = "green")
# tasa 0.4
dataD4 <- read.table(file="and.data_DeltaLearner_false_0.4.cvs", header= FALSE, sep=",")
points(dataD4[,1], dataD4[,2], col = "orange")
lines(dataD4[,1], dataD4[,2], col = "orange")
# tasa 0.2
dataD5 <- read.table(file="and.data_DeltaLearner_false_0.2.cvs", header= FALSE, sep=",")
points(dataD5[,1], dataD5[,2], col = "darkcyan")
lines(dataD5[,1], dataD5[,2], col = "darkcyan")
legend("topright", inset=.02, title="Tasas de Entrenamiento",
  	 c("0.01","0.1, 0.05", "0.3","0.4", "0.99, 0.5, 0.2"),fill= c("darkblue", "red", "green", "orange", "darkcyan") , horiz=FALSE)
###### Decae la Tasa
#tasa 0.01
dataD1 <- read.table(file="and.data_DeltaLearner_true_0.01.cvs", header= FALSE, sep=",")
plot(dataD1[,1], dataD1[,2], main="Delta, Función AND", sub="Con Tasa que Decae en ηo/i", col.sub="blue", xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(0, 3))
lines(dataD1[,1], dataD1[,2], col="darkblue")
# tasa 0.2
dataD2 <- read.table(file="and.data_DeltaLearner_true_0.2.cvs", header= FALSE, sep=",")
points(dataD2[,1], dataD2[,2], col = "darkcyan")
lines(dataD2[,1], dataD2[,2], col = "darkcyan")
# tasa 0.1
dataD3 <- read.table(file="and.data_DeltaLearner_true_0.1.cvs", header= FALSE, sep=",")
points(dataD3[,1], dataD3[,2], col = "red")
lines(dataD3[,1], dataD3[,2], col = "red")
# tasa 0.99
dataD4 <- read.table(file="and.data_DeltaLearner_true_0.99.cvs", header= FALSE, sep=",")
points(dataD4[,1], dataD4[,2], col = "orange")
lines(dataD4[,1], dataD4[,2], col = "orange")
# tasa 0.05
dataD5 <- read.table(file="and.data_DeltaLearner_true_0.05.cvs", header= FALSE, sep=",")
points(dataD5[,1], dataD5[,2], col = "green")
lines(dataD5[,1], dataD5[,2], col = "green")
legend("topright", inset=.02, title="Tasas de Entrenamiento",
  	 c("0.01","0.2", "0.1","0.99, 0.4, 0.3", "0.05, 0.5"),fill= c("darkblue", "darkcyan","red", "orange","green") , horiz=FALSE)

  	 
########## DELTA OR FALSE
par(mfrow=c(1,2))
# tasa 0.1
dataD1 <- read.table(file="or.data_DeltaLearner_false_0.1.cvs", header= FALSE, sep=",")
plot(dataD1[,1], dataD1[,2], main="Delta, Función OR", xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(0, 3))
lines(dataD1[,1], dataD1[,2], col="darkblue")
# tasa 0.01
dataD2 <- read.table(file="or.data_DeltaLearner_false_0.01.cvs", header= FALSE, sep=",")
points(dataD2[,1], dataD2[,2], col = "red")
lines(dataD2[,1], dataD2[,2], col = "red")
# tasa 0.4
dataD3 <- read.table(file="or.data_DeltaLearner_false_0.4.cvs", header= FALSE, sep=",")
points(dataD4[,1], dataD4[,2], col = "green")
lines(dataD4[,1], dataD4[,2], col = "green")
# tasa 0.3
dataD5 <- read.table(file="or.data_DeltaLearner_false_0.3.cvs", header= FALSE, sep=",")
points(dataD5[,1], dataD5[,2], col = "orange")
lines(dataD5[,1], dataD5[,2], col = "orange")
# tasa 0.99
dataD6 <- read.table(file="or.data_DeltaLearner_false_0.99.cvs", header= FALSE, sep=",")
points(dataD6[,1], dataD6[,2], col = "darkcyan")
lines(dataD6[,1], dataD6[,2], col = "darkcyan")
legend("topright", inset=.02, title="Tasas de Entrenamiento",
  	 c("0.1","0.01, 0.2, 0.05", "0.4, 0.5","0.3", "0.99"),fill= c("darkblue", "red", "green","orange","darkcyan") , horiz=FALSE)

### DELTA OR TRUE
# tasa 0.2
dataD1 <- read.table(file="or.data_DeltaLearner_true_0.2.cvs", header= FALSE, sep=",")
plot(dataD1[,1], dataD1[,2], main="Delta, Función OR", sub="Con Tasa que Decae en ηo/i", col.sub="blue",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(0, 3))
lines(dataD1[,1], dataD1[,2], col="darkblue")
# tasa 0.01
dataD2 <- read.table(file="or.data_DeltaLearner_true_0.01.cvs", header= FALSE, sep=",")
points(dataD2[,1], dataD2[,2], col = "red")
lines(dataD2[,1], dataD2[,2], col = "red")
# tasa 0.05
dataD2 <- read.table(file="or.data_DeltaLearner_true_0.05.cvs", header= FALSE, sep=",")
points(dataD2[,1], dataD2[,2], col = "green")
lines(dataD2[,1], dataD2[,2], col = "green")
# tasa 0.5
dataD2 <- read.table(file="or.data_DeltaLearner_true_0.5.cvs", header= FALSE, sep=",")
points(dataD2[,1], dataD2[,2], col = "orange")
lines(dataD2[,1], dataD2[,2], col = "orange")
legend("topright", inset=.02, title="Tasas de Entrenamiento",
  	 c("0.2","0.01, 0.1, 0.3, 0.4", "0.05","0.5, 0.99"),fill= c("darkblue", "red", "green","orange") , horiz=FALSE)

######### DELTA XOR FALSE
par(mfrow=c(1,2))
# tasa 0.1
dataX <- read.table(file="Xor_D_F_0.1.csv", header= FALSE, sep=",")
plot(dataX[,1], dataX[,2], main="Delta, Función XOR",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(0, 3))
lines(dataX[,1], dataX[,2], col="darkblue")
#tasa 0.01
dataX1 <- read.table(file="Xor_D_F_0.01.csv", header= FALSE, sep=",")
points(dataX1[,1], dataX1[,2], col = "orange")
lines(dataX1[,1], dataX1[,2], col = "orange")
# tasa 0.2
dataX1 <- read.table(file="Xor_D_F_0.2.csv", header= FALSE, sep=",")
points(dataX1[,1], dataX1[,2], col = "green")
lines(dataX1[,1], dataX1[,2], col = "green")
# tasa 0.05
dataX1 <- read.table(file="Xor_D_F_0.05.csv", header= FALSE, sep=",")
points(dataX1[,1], dataX1[,2], col = "darkcyan")
lines(dataX1[,1], dataX1[,2], col = "darkcyan")
#tasa 0.4
dataX1 <- read.table(file="Xor_D_F_0.4.csv", header= FALSE, sep=",")
points(dataX1[,1], dataX1[,2], col = "red")
lines(dataX1[,1], dataX1[,2], col = "red")
legend("bottomleft", inset=.02, title="Tasas de Entrenamiento",
  	 c("0.1","0.01", "0.2","0.05","0.99, 0.4, 0.3, 0.5"),fill= c("darkblue","orange", "green","darkcyan","red") , horiz=FALSE)

######## DELTA XOR TRue
#tasa 0.05
dataX1 <- read.table(file="Xor_D_T_0.05.csv", header= FALSE, sep=",")
plot(dataX[,1], dataX[,2], main="Delta, Función XOR",sub="Con Tasa que Decae en ηo/i", col.sub="blue",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(0, 3))
lines(dataX1[,1], dataX1[,2], col = "darkblue")
#tasa 0-99
dataX1 <- read.table(file="Xor_D_T_0.99.csv", header= FALSE, sep=",")
points(dataX1[,1], dataX1[,2], col = "red")
lines(dataX1[,1], dataX1[,2], col = "red")
#tasa 0-5
dataX1 <- read.table(file="Xor_D_T_0.5.csv", header= FALSE, sep=",")
points(dataX1[,1], dataX1[,2], col = "darkcyan")
lines(dataX1[,1], dataX1[,2], col = "darkcyan")
legend("bottomleft", inset=.02, title="Tasas de Entrenamiento",
  	 c("0.05, 0.1, 0.01","0.99", "0.2, 0.3, 0.4, 0.5"),fill= c("darkblue","red","darkcyan") , horiz=FALSE)
  	 
####### PRegunta 2 B
par(mfrow=c(2,3))
# Aprendizaje Incremental AND: Perceptron en false
# tasa 0.01
dataP <- read.table(file="and.data_PerceptronLearner_false_0.01.cvs", header= FALSE, sep=",")
plot(dataP[,1], dataP[,2], main="Aprendizaje Incremental, AND", xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(0,3), xlim=c(0,7))
lines(dataP[,1], dataP[,2], col="darkblue")
#tasa 0.1
dataP <- read.table(file="and.data_PerceptronLearner_false_0.1.cvs", header= FALSE, sep=",")
points(dataP[,1], dataP[,2], col = "red")
lines(dataP[,1], dataP[,2], col = "red")
#tasa 0.4
dataP <- read.table(file="and.data_PerceptronLearner_false_0.4.cvs", header= FALSE, sep=",")
points(dataP[,1], dataP[,2], col = "green")
lines(dataP[,1], dataP[,2], col = "green")
legend("topright", inset=.02, title="Tasas de Entrenamiento",
  	 c("0.01","0.1, 0.2, 0.3, 0.5, 0.99", "0.4, 0.05"),fill= c("darkblue","red","green") , horiz=FALSE)

# Aprendizaje Incremental perceptron or 
# tasa 0.01
dataOR1 <- read.table(file="or.data_PerceptronLearner_false_0.01.cvs", header= FALSE, sep=",")
plot(dataOR1[,1], dataOR1[,2], main="Aprendizaje Incremental, OR", xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(0,4), xlim=c(0,25))
lines(dataOR1[,1], dataOR1[,2], col="darkblue")
# tasa 0.1
dataOR2 <- read.table(file="or.data_PerceptronLearner_false_0.1.cvs", header= FALSE, sep=",")
points(dataOR2[,1], dataOR2[,2], col = "red")
lines(dataOR2[,1], dataOR2[,2], col = "red")
# tasa 0.2
dataOR3 <- read.table(file="or.data_PerceptronLearner_false_0.2.cvs", header= FALSE, sep=",")
points(dataOR3[,1], dataOR3[,2], col = "green")
lines(dataOR3[,1], dataOR3[,2], col = "green")
# tasa 0.3
dataOR4 <- read.table(file="or.data_PerceptronLearner_false_0.3.cvs", header= FALSE, sep=",")
points(dataOR4[,1], dataOR4[,2], col = "orange")
lines(dataOR4[,1], dataOR4[,2], col = "orange")
legend("topright", inset=.02, title="Tasas de Entrenamiento",
  	 c("0.01","0.1, 0.05","0.2, 0.4, 0.5, 0.99","0.3"),fill= c("darkblue", "red", "green", "orange") , horiz=FALSE)
  	 
# Aprendizaje Incremental XOR
#Perceptron XOR False
#tasa 0.3
dataXOR1 <- read.table(file="Xor_P_F_0.3.csv", header= FALSE, sep=",")
plot(dataXOR1[,1], dataXOR1[,2], main="Aprendizaje Incremental,	 XOR", xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(0, 5), xlim=c(1,50))
lines(dataXOR1[,1], dataXOR1[,2], col="darkblue")
#tasa 0.01
dataXOR2 <- read.table(file="Xor_P_F_0.01.csv", header= FALSE, sep=",")
points(dataXOR2[,1], dataXOR2[,2], col = "red")
lines(dataXOR2[,1], dataXOR2[,2], col = "red")
#tasa 0.1
dataXOR3 <- read.table(file="Xor_P_F_0.1.csv", header= FALSE, sep=",")
points(dataXOR3[,1], dataXOR3[,2], col = "green")
lines(dataXOR3[,1], dataXOR3[,2], col = "green")
#tasa 0.5
dataXOR4 <- read.table(file="Xor_P_F_0.5.csv", header= FALSE, sep=",")
points(dataXOR4[,1], dataXOR4[,2], col = "orange")
lines(dataXOR4[,1], dataXOR4[,2], col = "orange")
#tasa 0.99
dataXOR5 <- read.table(file="Xor_P_F_0.99.csv", header= FALSE, sep=",")
points(dataXOR5[,1], dataXOR5[,2], col = "darkcyan")
lines(dataXOR5[,1], dataXOR5[,2], col = "darkcyan")
legend("topright", inset=.02, title="Tasas de Entrenamiento",
  	 c("0.3, 0.4","0.01", "0.1","0.5, 0.05", "0.99"),fill= c("darkblue", "red", "green", "orange", "darkcyan") , horiz=FALSE)

## Aprendizaje por Lotes AND
#tasa 0.01
dataD1 <- read.table(file="and.data_DeltaLearner_false_0.01.cvs", header= FALSE, sep=",")
plot(dataD1[,1], dataD1[,2], main="Aprendizaje por Lotes AND", xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(0, 3), xlim=c(0,10))
lines(dataD1[,1], dataD1[,2], col="darkblue")
#tasa 0.1
dataD2 <- read.table(file="and.data_DeltaLearner_false_0.1.cvs", header= FALSE, sep=",")
points(dataD2[,1], dataD2[,2], col = "red")
lines(dataD2[,1], dataD2[,2], col = "red")
#tasa 0.3
dataD3 <- read.table(file="and.data_DeltaLearner_false_0.3.cvs", header= FALSE, sep=",")
points(dataD3[,1], dataD3[,2], col = "green")
lines(dataD3[,1], dataD3[,2], col = "green")
# tasa 0.4
dataD4 <- read.table(file="and.data_DeltaLearner_false_0.4.cvs", header= FALSE, sep=",")
points(dataD4[,1], dataD4[,2], col = "orange")
lines(dataD4[,1], dataD4[,2], col = "orange")
# tasa 0.2
dataD5 <- read.table(file="and.data_DeltaLearner_false_0.2.cvs", header= FALSE, sep=",")
points(dataD5[,1], dataD5[,2], col = "darkcyan")
lines(dataD5[,1], dataD5[,2], col = "darkcyan")
legend("topright", inset=.02, title="Tasas de Entrenamiento",
  	 c("0.01","0.1, 0.05", "0.3","0.4", "0.99, 0.5, 0.2"),fill= c("darkblue", "red", "green", "orange", "darkcyan") , horiz=FALSE)
  	 
# Aprendizaje por lotes OR
# tasa 0.1
dataD1 <- read.table(file="or.data_DeltaLearner_false_0.1.cvs", header= FALSE, sep=",")
plot(dataD1[,1], dataD1[,2], main="Aprendizaje por Lotes OR", xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(0, 4), xlim=c(0,4))
lines(dataD1[,1], dataD1[,2], col="darkblue")
# tasa 0.01
dataD2 <- read.table(file="or.data_DeltaLearner_false_0.01.cvs", header= FALSE, sep=",")
points(dataD2[,1], dataD2[,2], col = "red")
lines(dataD2[,1], dataD2[,2], col = "red")
# tasa 0.4
dataD3 <- read.table(file="or.data_DeltaLearner_false_0.4.cvs", header= FALSE, sep=",")
points(dataD4[,1], dataD4[,2], col = "green")
lines(dataD4[,1], dataD4[,2], col = "green")
# tasa 0.3
dataD5 <- read.table(file="or.data_DeltaLearner_false_0.3.cvs", header= FALSE, sep=",")
points(dataD5[,1], dataD5[,2], col = "orange")
lines(dataD5[,1], dataD5[,2], col = "orange")
# tasa 0.99
dataD6 <- read.table(file="or.data_DeltaLearner_false_0.99.cvs", header= FALSE, sep=",")
points(dataD6[,1], dataD6[,2], col = "darkcyan")
lines(dataD6[,1], dataD6[,2], col = "darkcyan")
legend("topright", inset=.02, title="Tasas de Entrenamiento",
  	 c("0.1","0.01, 0.2, 0.05", "0.4, 0.5","0.3", "0.99"),fill= c("darkblue", "red", "green","orange","darkcyan") , horiz=FALSE)
  	 
# aprendizaje por lotes XOR
# tasa 0.1
dataX <- read.table(file="Xor_D_F_0.1.csv", header= FALSE, sep=",")
plot(dataX[,1], dataX[,2], main="Aprendizaje por Lotes XOR",xlab="Iteraciones", ylab="Error",col = "darkblue", col.main="blue", ylim=c(0, 5	), xlim=c(1,50))
lines(dataX[,1], dataX[,2], col="darkblue")
#tasa 0.01
dataX1 <- read.table(file="Xor_D_F_0.01.csv", header= FALSE, sep=",")
points(dataX1[,1], dataX1[,2], col = "orange")
lines(dataX1[,1], dataX1[,2], col = "orange")
# tasa 0.2
dataX1 <- read.table(file="Xor_D_F_0.2.csv", header= FALSE, sep=",")
points(dataX1[,1], dataX1[,2], col = "green")
lines(dataX1[,1], dataX1[,2], col = "green")
# tasa 0.05
dataX1 <- read.table(file="Xor_D_F_0.05.csv", header= FALSE, sep=",")
points(dataX1[,1], dataX1[,2], col = "darkcyan")
lines(dataX1[,1], dataX1[,2], col = "darkcyan")
#tasa 0.4
dataX1 <- read.table(file="Xor_D_F_0.4.csv", header= FALSE, sep=",")
points(dataX1[,1], dataX1[,2], col = "red")
lines(dataX1[,1], dataX1[,2], col = "red")
legend("topright", inset=.02, title="Tasas de Entrenamiento",
  	 c("0.1","0.01", "0.2","0.05","0.99, 0.4, 0.3, 0.5"),fill= c("darkblue","orange", "green","darkcyan","red") , horiz=FALSE)
  	 
  	 
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