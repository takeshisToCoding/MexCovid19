#Load the data
casos_estados <- read.csv("../data/casos_estados.csv")
#plot data
data <- matrix(c(casos_estados$X5..Apr..2020, casos_estados$X6..Apr..2020, casos_estados$X7..Apr..2020), nrow = 3, ncol = 32, byrow = TRUE)
barplot(data, ylim =c(0,800), names.arg=c(as.character( casos_estados[,1]) ), las="2", col=c("red", "blue", "green"), 
        beside = TRUE, cex.axis=1.0, main = "Casos acumulados por estado", ylab="Casos acumulados")
grid(nx = NULL, col = "gray", lty = "dotted", lwd = par("lwd"), equilogs = FALSE)
text((1:32)*4,casos_estados$X7..Apr..2020+20, labels=c(as.character( casos_estados$X7..Apr..2020+10)), cex=0.8)
legend(100, 800, legend=c("5-Abr-20", "6-Abr-20", "7-Abr-20"), col=c("red", "blue", "green"), lty=1, cex=0.9)

#######
casos_totales <- read.csv("../data/casos_totales.csv")
data_total <- matrix(c(casos_totales$Casos.Confirmados, casos_totales$Muertes), nrow = 41, ncol = 2, byrow = FALSE)
matplot(data_total, type = c("l","l"), pch=c(1,2))
matplot(data_total, type = c("o","o"), pch=c(1,2), xaxt="n", ylim = c(0, 3500), cex.main=1.0,
        main = "Casos confirmados acumulados [TOTALES PAIS MEXICO]", ylab="Datos acumulados")
axis(1,at=1:41,labels=casos_totales$FECHA, las=2, cex.axis=0.7)
grid(nx = NULL, col = "lightgray", lty = "dotted", lwd = par("lwd"), equilogs = FALSE)
text(casos_totales$Casos.Confirmados+100, labels=c(as.character( casos_totales$Casos.Confirmados)), cex=0.7)
text(casos_totales$Muertes+100, labels=c(as.character( casos_totales$Muertes)), cex=0.7)
legend(15, 3500, legend=c("Casos Confirmados", "Muertes"), col=c("black","red"), lty=3:4, cex=0.9)

##########
data_cumulative <- matrix(c(casos_totales$casosNuevosDia, casos_totales$muertesNuevasDia), nrow = 41, ncol = 2, byrow = FALSE)
matplot(data_cumulative[,1], type = c("b", "b"), pch=c(1,2), xaxt="n", ylim = c(0, 400), 
        main = "Casos nuevos por dia", ylab="Datos nuevos por dia")
polygon(c(casos_totales$casosNuevosDia, 0), col = "lightblue")
polygon(c(casos_totales$muertesNuevasDia, 0), col = "red")
axis(1,at=1:41, labels=casos_totales$FECHA, las=2, cex.axis=0.8)
grid(nx = NULL, col = "lightgray", lty = "dotted", lwd = par("lwd"), equilogs = FALSE)
text(casos_totales$casosNuevosDia+10, labels=c(as.character( casos_totales$casosNuevosDia)), cex=0.7)
text(casos_totales$muertesNuevasDia+10, labels=c(as.character( casos_totales$muertesNuevasDia)), cex=0.7)
legend(15, 350, legend=c("Casos confirmados nuevos por dia", "Muertes nuevas por dia"), col=c("blue","red"), lty=3:4, cex=0.9)