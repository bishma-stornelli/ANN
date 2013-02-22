# Graficas Proy 1 Inteligencia

#########################
# Multicapa 1000

jpeg('data1000.jpg')
data1000azules <- read.table(file="or.data_PerceptronLearner_false_0.01.cvs", header= FALSE, sep=",")
data1000amarillos <- read.table(file="or.data_PerceptronLearner_false_0.01.cvs", header= FALSE, sep=",")
plot(data1000azules[,1], data1000azules[,2], main="1000 Patrones", xlab="Eje X", ylab="Eje Y",col = "darkblue", col.main="blue", pch = 20)
points(data1000amarillos[,1], data1000amarillos[,2], col = "yellow", pch = 20)

legend("topright", inset=.02, title="Tipos de puntos", c("Clasificados en azul","Clasificados en amarillo"),fill= c("blue", "yellow") , horiz=FALSE)

dev.off()
  	 
##################

# Multicapa 500

jpeg('data500.jpg')
data500azules <- read.table(file="or.data_PerceptronLearner_false_0.01.cvs", header= FALSE, sep=",")
data500amarillos <- read.table(file="or.data_PerceptronLearner_false_0.01.cvs", header= FALSE, sep=",")
plot(data500azules[,1], data500azules[,2], main="500 Patrones", xlab="Eje X", ylab="Eje Y",col = "darkblue", col.main="blue", pch = 20)
points(data500amarillos[,1], data500amarillos[,2], col = "yellow", pch = 20)

legend("topright", inset=.02, title="Tipos de puntos", c("Clasificados en azul","Clasificados en amarillo"),fill= c("blue", "yellow") , horiz=FALSE)

dev.off()
     
##################

# Multicapa 2000

jpeg('data2000.jpg')
data2000azules <- read.table(file="or.data_PerceptronLearner_false_0.01.cvs", header= FALSE, sep=",")
data2000amarillos <- read.table(file="or.data_PerceptronLearner_false_0.01.cvs", header= FALSE, sep=",")
plot(data2000azules[,1], data2000azules[,2], main="2000 Patrones", xlab="Eje X", ylab="Eje Y",col = "darkblue", col.main="blue", pch = 20)
points(data2000amarillos[,1], data2000amarillos[,2], col = "yellow", pch = 20)

legend("topright", inset=.02, title="Tipos de puntos", c("Clasificados en azul","Clasificados en amarillo"),fill= c("blue", "yellow") , horiz=FALSE)

dev.off()