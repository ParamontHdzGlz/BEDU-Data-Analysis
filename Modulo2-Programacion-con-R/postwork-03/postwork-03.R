# postwork-03

library(dplyr)

setwd("C:/Paramont/Pogra/Cursos/BEDU/Modulo2-Programacion-con-R/postwork/postwork-03/data")

#Obteniendo el dataframe del postwork-02
#{

  # Obteniendo los data sets de https://www.football-data.co.uk/spainm.php
  url.19.20 <- "https://www.football-data.co.uk/mmz4281/1920/SP1.csv"
  url.18.19 <- "https://www.football-data.co.uk/mmz4281/1819/SP1.csv"
  url.17.18 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"
  # Descargando los documentos
  download.file(url=url.19.20, destfile="season19-20.csv", mode="wb")
  download.file(url=url.18.19, destfile="season18-19.csv", mode="wb")
  download.file(url=url.17.18, destfile="season17-18.csv", mode="wb")
  # Haciendo una lista que contiene a todos los csv descargados en la carpeta actual.
  data.list <- lapply(dir(), read.csv)
  # Conservando sÃ³lo las columnas indicadas en los df de la lista.
  data.list <- lapply(data.list, select, Date:FTR)
  # Eliminamos la columna de Time del 3er dataframe, ya que es el Ãºnico que contiene dicho dato.
  data.list[[3]]$Time <- NULL
  # Transformando las fechas en Date de srings a objetos Date
  for(i in 1:length(data.list)){
    data.list[[i]] <- mutate(data.list[[i]], Date=as.Date(Date, format="%d/%m/%y"))
  }
  # Uniendo todos los dataframes de la lista en uno sÃ³lo
  data <- do.call(rbind, data.list)
#}
  

### 1 ###

# total de partidos jugados en toda la temporada
total.matches <- dim(data)[1]

# Calculo de probabilidad (marginal) de que un equipo jugando en casa anote x=0,1,...8 goles  
m.prob.home <- data.frame(table(data$FTHG))
m.prob.home <- rename(m.prob.home, goles=Var1, p.marginal=Freq)
m.prob.home <- mutate(m.prob.home, p.marginal=p.marginal/total.matches)

# Calculo de probabilidad (marginal) de que un equipo jugando como visitante anote x=0,1,...6 goles  
m.prob.away <- data.frame(table(data$FTAG))
m.prob.away <- rename(m.prob.away, goles=Var1, p.marginal=Freq)
m.prob.away <- mutate(m.prob.away, p.marginal=p.marginal/total.matches)

# Calculo de probabilidad (conjunto) de que un equipo visitante anote x=0,1,...6 goles y un equipo anfitrin anote x=0,1,...8 goles
# Goles de anfitrion (FTHG) son filas.
# Goles de visitante (FTAG) son columnas.
c.prob <- data.frame(table(data$FTHG, data$FTAG))
c.prob <- rename(c.prob, goles.anfitrion=Var1, goles.visitante=Var2, p.conjunta=Freq)
c.prob <- mutate(c.prob, p.conjunta=p.conjunta/total.matches)


### 2 ###

#graficando
#Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo de casa
ggplot(m.prob.home, aes(x=goles, y=p.marginal))+
  geom_bar(stat="identity")+
  ggtitle("Probabilidad marginal de equipo anfitrion de anotar x goles")

#Un gráfico de barras para las probabilidades marginales estimadas del número de goles que anota el equipo visitante.
ggplot(m.prob.away, aes(x=goles, y=p.marginal))+
  geom_bar(stat="identity")+
  ggtitle("Probabilidad marginal de equipo visitante de anotar x goles")

#Un HeatMap para las probabilidades conjuntas estimadas de los números de goles que anotan el equipo de casa y el equipo visitante en un partido.
ggplot(c.prob, aes(x=goles.anfitrion, y=goles.visitante))+
  geom_tile(aes(fill=p.conjunta), colour="grey50")+
  scale_fill_gradient2(low="blue", mid="green", high="red", midpoint=0.05)


