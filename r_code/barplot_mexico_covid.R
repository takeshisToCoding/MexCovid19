#Load the data
lim = 2500
data_frame <- read.csv("../data/casos_estados.csv")
casos_estados <- data_frame[order(data_frame$X17..Apr..2020, decreasing = TRUE),]
# 1. Open jpeg file
#jpeg("../imgs/casos_acumulados_estados.jpeg", width = 640, height = 480)
#plot data
data <- matrix(c(casos_estados$X15..Apr..2020, casos_estados$X16..Apr..2020, casos_estados$X17..Apr..2020), 
               nrow = 3, ncol = 32, byrow = TRUE)
barplot(data, ylim =c(0, lim), 
        names.arg=c(as.character( casos_estados[,1]) ), 
        las="2", col=c("red", "blue", "green"), 
        beside = TRUE, cex.axis=0.8, cex.names = 0.6, 
        main = "Casos acumulados por estado", 
        ylab="Casos acumulados")
grid(nx = NULL, col = "gray", lty = "dotted", lwd = par("lwd"), equilogs = FALSE)
text((1:32)*4,casos_estados$X17..Apr..2020+40, labels=c(as.character( casos_estados$X17..Apr..2020)), cex=0.8)
legend(100, lim-100, legend=c("15-Abr-20", "16-Abr-20", "17-Abr-20"), col=c("red", "blue", "green"), lty=1, cex=0.9)
# 3. Close the file
#dev.off()


#######
#jpeg("../imgs/casos_acumulados_total.jpeg", width = 640, height = 480)
casos_totales <- read.csv("../data/casos_totales.csv")
total_datos = length(casos_totales$Casos.Confirmados)
lim_1 = 15000
# 1. Open jpeg file
data_total <- matrix(c(casos_totales$Casos.Confirmados, casos_totales$Muertes), nrow = total_datos, ncol = 2, byrow = FALSE)
matplot(data_total, type = c("l","l"), pch=c(1,2))
matplot(data_total, type = c("o","o"), pch=c(1,2), xaxt="n", ylim = c(0, lim_1), cex.main=1.0,
        main = "Casos confirmados acumulados [TOTALES PAIS MEXICO]", ylab="Datos acumulados")
axis(1,at=1:total_datos, labels=casos_totales$FECHA, las=2, cex.axis=0.7)
grid(nx = NULL, col = "lightgray", lty = "dotted", lwd = par("lwd"), equilogs = FALSE)
text((total_datos-4):total_datos, tail(casos_totales$Casos.Confirmados+400, 5), 
     labels=c(as.character( tail(casos_totales$Casos.Confirmados,4) )), cex=0.7)
text(total_datos, tail(casos_totales$Muertes+400, 1), 
     labels=c(as.character( casos_totales$Muertes[total_datos])), cex=0.7)
legend(10, lim_1-100, legend=c("Casos Confirmados", "Muertes"), col=c("black","red"), lty=3:4, cex=0.9)
# 3. Close the file
#dev.off()

##########
lim_2 = 1500
data_cumulative <- matrix(c(casos_totales$casosNuevosDia, casos_totales$muertesNuevasDia), nrow = total_datos, ncol = 2, byrow = FALSE)
# 1. Open jpeg file
#jpeg("../imgs/casos_nuevos_dia.jpeg", width = 640, height = 480)
matplot(data_cumulative[,1], type = c("b", "b"), pch=c(1,2), xaxt="n", ylim = c(0, lim_2), 
        main = "Casos nuevos por dia", 
        ylab="Datos nuevos por dia")
polygon(c(casos_totales$casosNuevosDia, 0), col = "lightblue")
polygon(c(casos_totales$muertesNuevasDia, 0), col = "red")
axis(1,at=1:total_datos, labels=casos_totales$FECHA, las=2, cex.axis=0.8)
grid(nx = NULL, col = "lightgray", lty = "dotted", lwd = par("lwd"), equilogs = FALSE)
text(casos_totales$casosNuevosDia+20, labels=c(as.character( casos_totales$casosNuevosDia)), cex=0.7)
text(casos_totales$muertesNuevasDia+20, labels=c(as.character( casos_totales$muertesNuevasDia)), cex=0.7)
legend(10, lim_2-50, legend=c("Casos confirmados nuevos por dia", "Muertes nuevas por dia"), col=c("blue","red"), lty=3:4, cex=0.9)
# 3. Close the file
#dev.off()


##########
# 1. Open jpeg file
#jpeg("../imgs/casos_nuevos_dia_bar.jpeg", width = 640, height = 480)
barplot_muertes <- barplot(casos_totales$casosNuevosDia, ylim = c(0, lim_2), las="2", col=rgb(0.5,0.8,0.4,0.4),
                           names.arg=c(as.character( casos_totales$FECHA)), cex.names = 0.8,
                           main = "Casos nuevos por dia", 
                           ylab="Datos nuevos por dia")
grid(nx = NULL, col = "lightgray", lty = "dotted", lwd = par("lwd"), equilogs = FALSE)
text(barplot_muertes, casos_totales$casosNuevosDia+20, 
     labels=c(as.character( casos_totales$casosNuevosDia)), cex=0.6)
legend(10, lim_2, legend=c("Casos confirmados por dia"), col=c(rgb(0.5,0.8,0.4,1.0)), lty=4, cex=0.9)
# 3. Close the file
#dev.off()

##########
lim_2 = 200
# 1. Open jpeg file
#jpeg("../imgs/muertes_nuevas_dia_bar.jpeg", width = 640, height = 480)
barplot_muertes <- barplot(casos_totales$muertesNuevasDia, ylim = c(0, lim_2), las="2", col=rgb(0.8,0.5,0.4,0.4),
        names.arg=c(as.character( casos_totales$FECHA)), cex.names = 0.8,
        main = "Muertes por dia", 
        ylab="Datos nuevos por dia")
grid(nx = NULL, col = "lightgray", lty = "dotted", lwd = par("lwd"), equilogs = FALSE)
text(barplot_muertes, casos_totales$muertesNuevasDia+5, labels=c(as.character( casos_totales$muertesNuevasDia)), cex=0.6)
legend(10, lim_2, legend=c("Muertes nuevas por dia"), col=c("red"), lty=4, cex=0.9)
# 3. Close the file
#dev.off()

#######
lim_3 = 1.2
casos_hospitalizados <- read.csv("../data/casos_ambulatorios_hospitalizados.csv")
barplot_ambulatorios <- barplot(casos_hospitalizados$Ambulatorio..., ylim = c(0, lim_3), 
                           las="2", col=rgb(0.2,0.6,0.4,0.4),
                           names.arg=c(as.character(casos_hospitalizados$Fecha)), cex.names = 0.8,
                           main = "Porcentaje de pacientes ambulatorios", 
                           ylab="%")
grid(nx = NULL, col = "lightgray", lty = "dotted", lwd = par("lwd"), equilogs = FALSE)
text(barplot_ambulatorios, casos_hospitalizados$Ambulatorio...+.1, 
     labels=c(as.character( casos_hospitalizados$Ambulatorio...)), cex=0.6)
legend(10, lim_3, legend=c("No requieren hospitalizacion"), col=c(rgb(0.2,0.6,0.4,1.0)), lty=4, cex=0.9)

#######
lim_4 = 0.8
barplot_hospitalizados <- barplot(casos_hospitalizados$TotalHospitalizados..., ylim = c(0, lim_4), 
                                las="2", col=rgb(0.6,0.2,0.4,0.4),
                                names.arg=c(as.character(casos_hospitalizados$Fecha)), cex.names = 0.8,
                                main = "Porcentaje de hospitalizados", 
                                ylab="%")
grid(nx = NULL, col = "lightgray", lty = "dotted", lwd = par("lwd"), equilogs = FALSE)
text(barplot_ambulatorios, casos_hospitalizados$TotalHospitalizados...+.1, 
     labels=c(as.character( casos_hospitalizados$TotalHospitalizados...)), cex=0.6)
legend(4, lim_4, legend=c("Han requerido hospitalización"), col=c(rgb(0.6,0.2,0.4,1.0)), lty=4, cex=0.9)


#######
lim_4 = 1.6
n_datos = 21
count <- matrix(c(casos_hospitalizados$TotalHospitalizados..., casos_hospitalizados$Ambulatorio...), nrow = 2, ncol = n_datos, byrow = TRUE)
barplot_hospitalizados <- barplot(count, ylim = c(0, lim_4), 
                                  las="2", 
                                  col=c(rgb(0.6,0.2,0.4,0.4), rgb(0.4,0.2,0.8,0.4)),
                                  names.arg=c(as.character(casos_hospitalizados$Fecha)), cex.names = 0.8,
                                  main = "Porcentaje de hospitalizados", 
                                  ylab="%")
grid(nx = NULL, col = "lightgray", lty = "dotted", lwd = par("lwd"), equilogs = FALSE)
text(barplot_ambulatorios, 0.08, 
     labels=c(as.character( casos_hospitalizados$TotalHospitalizados...)), cex=0.6)
text(barplot_ambulatorios, 0.6, 
     labels=c(as.character( casos_hospitalizados$Ambulatorio...)), cex=0.6)
legend(4, lim_4-0.2, legend=c("Ambulatorios", "Han requerido hospitalización"), col=c(rgb(0.4,0.2,1.0,0.8), rgb(0.8,0.2,0.4,0.8)), lty=3:4, cex=0.9)


####### 
lim_4 = 1.6
ultimos_casos = 10
count <- matrix(c(tail(casos_hospitalizados$HospitalizadoIntubado.TotalCasos...., ultimos_casos),
                tail(casos_hospitalizados$HospitalizadoGrave.TotalCasos...., ultimos_casos),
                tail(casos_hospitalizados$HospitalizadoEstable.TotalCasos...., ultimos_casos),
                tail(casos_hospitalizados$Ambulatorio..., ultimos_casos)), nrow = 4, ncol = ultimos_casos, byrow = TRUE)
barplot_hospitalizados <- barplot(count, ylim = c(0, lim_4), 
                                  las="2", 
                                  col=c(rgb(1.0,0.2,0.2,0.6), rgb(0.6,0.4,0.4,0.4),
                                        rgb(0.4,0.6,0.4,0.4), rgb(0.2,0.6,0.8,0.4)),
                                  names.arg=c(as.character( tail(casos_hospitalizados$Fecha, ultimos_casos) )), cex.names = 0.8,
                                  main = "Porcentaje de hospitalizados", 
                                  ylab="%")
grid(nx = NULL, col = "lightgray", lty = "dotted", lwd = par("lwd"), equilogs = FALSE)
text(barplot_ambulatorios, 0.6, 
     labels=c(as.character( tail(casos_hospitalizados$Ambulatorio..., ultimos_casos) )), cex=0.6)

text(barplot_ambulatorios, tail(casos_hospitalizados$HospitalizadoEstable.TotalCasos...., ultimos_casos) + 
                           tail(casos_hospitalizados$HospitalizadoGrave.TotalCasos...., ultimos_casos) +
                           tail(casos_hospitalizados$HospitalizadoIntubado.TotalCasos...., ultimos_casos) - 0.04, 
     labels=c(as.character( tail(casos_hospitalizados$HospitalizadoEstable.TotalCasos...., ultimos_casos) )), cex=0.6)

text(barplot_ambulatorios, tail(casos_hospitalizados$HospitalizadoGrave.TotalCasos...., ultimos_casos) +
                           tail(casos_hospitalizados$HospitalizadoIntubado.TotalCasos...., ultimos_casos)- 0.04, 
     labels=c(as.character( tail(casos_hospitalizados$HospitalizadoGrave.TotalCasos...., ultimos_casos) )), cex=0.6)

text(barplot_ambulatorios, tail(casos_hospitalizados$HospitalizadoIntubado.TotalCasos...., ultimos_casos) + 0.02, 
     labels=c(as.character( tail(casos_hospitalizados$HospitalizadoIntubado.TotalCasos...., ultimos_casos) )), cex=0.6)
legend(4, lim_4-0.1, legend=c("Ambulatorios","Hospitalizado Estable","Hospitalizado Graves","Entubados"), 
       col=c(rgb(0.2,0.6,0.8,0.8), rgb(0.4,0.6,0.4,0.8), 
             rgb(0.6,0.4,0.4,0.8), rgb(1.0,0.2,0.2,0.8) ), lty=1:4, cex=0.9)


# ToDo:
# - Desglose de casos hospitalizados
# - barplot sobrepuestas para nuevos casos. ( par(new = T) )

