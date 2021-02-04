# postwork-05

library(dplyr)
library(fbRanks)

setwd("C:/Paramont/Pogra/Cursos/BEDU/Modulo2-Programacion-con-R/postwork/postwork-05/data")

### 1 ####
# Crear archivo csv "soccer.csv" con el dataframe a trabajar.

# Descarga de archivos
url.19.20 <- "https://www.football-data.co.uk/mmz4281/1920/SP1.csv"
url.18.19 <- "https://www.football-data.co.uk/mmz4281/1819/SP1.csv"
url.17.18 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"
download.file(url=url.19.20, destfile="season19-20.csv", mode="wb")
download.file(url=url.18.19, destfile="season18-19.csv", mode="wb")
download.file(url=url.17.18, destfile="season17-18.csv", mode="wb")
# Union en un solo dataframe y manejo de columnas
data.list <- lapply(dir(), read.csv)
data.list <- lapply(data.list, select, Date, HomeTeam, FTHG, AwayTeam, FTAG) 
SmallData <- do.call(rbind, data.list)
SmallData <- mutate(SmallData, Date=as.Date(Date, format="%d/%m/%y"))
SmallData <- rename(SmallData, date=Date, home.team=HomeTeam, home.score=FTHG, away.team=AwayTeam, away.score=FTAG)
# Exportando a archivo csv
setwd("C:/Paramont/Pogra/Cursos/BEDU/Modulo2-Programacion-con-R/postwork/postwork-05")
write.csv(SmallData, "soccer.csv", row.names=FALSE)


### 2 ###
# Cargar archivo "soccer.csv"

# Cargando
listasoccer <- create.fbRanks.dataframes("soccer.csv")
anotaciones <- listasoccer$scores
equipos <- listasoccer$teams


### 3 ###
# Rankeo de equipos

# vector de fechas unicas
fecha <- unique(anotaciones$date)
n <- length(fecha)
# fecha minima // primer fecha
min.date <- min(fecha)
# fecha máxima (sin contar la ultima) // penultima fecha
max.date <- max(fecha[-length(fecha)])
# guardando rankings
ranking <- rank.teams(anotaciones, max.date=max.date, min.date=min.date)


### 4 ###
# predecir resultados de ultimos paridos de la temporada de 2019-2020
predict(ranking, newdata=anotaciones[anotaciones$date==fecha[n],])



