#######
# 1. Open jpeg file
jpeg("../imgs/casos_acumulados_total.jpeg", width = 1000, height = 648)
casos_totales <- read.csv("../data/casos_totales.csv")
total_datos = length(casos_totales$Casos.Confirmados)
lim_1 = 15000

data_total <- matrix(c(casos_totales$Casos.Confirmados, casos_totales$Muertes), nrow = total_datos, ncol = 2, byrow = FALSE)
matplot(data_total, type = c("l","l"), pch=c(1,2))
matplot(data_total, type = c("o","o"), pch=c(1,2), xaxt="n", ylim = c(0, lim_1), cex.main=1.0,
        main = "Casos confirmados acumulados [TOTALES PAIS MEXICO]", ylab="Datos acumulados")
axis(1,at=1:total_datos, labels=casos_totales$FECHA, las=2, cex.axis=0.7)
grid(nx = NULL, col = "lightgray", lty = "dotted", lwd = par("lwd"), equilogs = FALSE)

#Plotting labels
text((total_datos-4):total_datos, tail(casos_totales$Casos.Confirmados+400, 5), 
     labels=c(as.character( tail(casos_totales$Casos.Confirmados,4) )), cex=0.7)
text(total_datos, tail(casos_totales$Muertes+400, 1), 
     labels=c(as.character( casos_totales$Muertes[total_datos])), cex=0.7)
legend(10, lim_1-100, legend=c("Casos Confirmados", "Muertes"), col=c("black","red"), lty=3:4, cex=0.9)
# 3. Close the file
dev.off()

##########
# 1. Open jpeg file
lim_2 <- 1700
jpeg("../imgs/casos_nuevos_dia_bar.jpeg", width = 1000, height = 648)
barplot_muertes <- barplot(casos_totales$casosNuevosDia, ylim = c(0, lim_2), las="2", col=rgb(0.5,0.8,0.4,0.4),
                           names.arg=c(as.character( casos_totales$FECHA)), cex.names = 0.8,
                           main = "Casos nuevos por dia", 
                           ylab="Datos nuevos por dia")
grid(nx = NULL, col = "lightgray", lty = "dotted", lwd = par("lwd"), equilogs = FALSE)
text(barplot_muertes, casos_totales$casosNuevosDia+20, 
     labels=c(as.character( casos_totales$casosNuevosDia)), cex=0.6)
legend(10, lim_2, legend=c("Casos confirmados por dia"), col=c(rgb(0.5,0.8,0.4,1.0)), lty=4, cex=0.9)
# 3. Close the file
dev.off()

##########
lim_3 = 170
# 1. Open jpeg file
jpeg("../imgs/muertes_nuevas_dia_bar.jpeg", width = 1000, height = 648)
barplot_muertes <- barplot(casos_totales$muertesNuevasDia, ylim = c(0, lim_3), las="2", col=rgb(0.8,0.5,0.4,0.4),
                           names.arg=c(as.character( casos_totales$FECHA)), cex.names = 0.8,
                           main = "Muertes por dia", 
                           ylab="Datos nuevos por dia")
grid(nx = NULL, col = "lightgray", lty = "dotted", lwd = par("lwd"), equilogs = FALSE)
text(barplot_muertes, casos_totales$muertesNuevasDia+5, labels=c(as.character( casos_totales$muertesNuevasDia)), cex=0.6)
legend(10, lim_3, legend=c("Muertes nuevas por dia"), col=c("red"), lty=4, cex=0.9)
# 3. Close the file
dev.off()