# postwork-02

library(dplyr)

setwd("C:/Paramont/Pogra/Cursos/BEDU/Modulo2-Programacion-con-R/postwork/postwork-02/data")

### 1 ###
# Obteniendo los data sets de https://www.football-data.co.uk/spainm.php
url.19.20 <- "https://www.football-data.co.uk/mmz4281/1920/SP1.csv"
url.18.19 <- "https://www.football-data.co.uk/mmz4281/1819/SP1.csv"
url.17.18 <- "https://www.football-data.co.uk/mmz4281/1718/SP1.csv"
# Descargando
download.file(url=url.19.20, destfile="season19-20.csv", mode="wb")
download.file(url=url.18.19, destfile="season18-19.csv", mode="wb")
download.file(url=url.17.18, destfile="season17-18.csv", mode="wb")
# Haciendo una lista que contiene a todos los csv descargados en la carpeta actual.
data.list <- lapply(dir(), read.csv)

### 2 ###
# Revisando los tres datasets con las funciones en functions.
functions <- c("str", "head", "View", "summary")
for (fun in functions){
  for (i in 1:length(data.list)){
    Sys.sleep(3)
    print(paste(fun, "del data set número: ", i))
    Sys.sleep(1)
    print(do.call(fun, data.list[i]))
  }
}

### 3 ###
# Conservando solo las columnas indicadas en los df de la lista.
data.list <- lapply(data.list, select, Date:FTR)

# Eliminamos la columna de Time del 3er dataframe, ya que es el único que contiene dicho dato.
data.list[[3]]$Time <- NULL

### 4 ###
# Transformando las fechas en Date de srings a objetos Date
for(i in 1:length(data.list)){
  data.list[[i]] <- mutate(data.list[[i]], Date=as.Date(Date, format="%d/%m/%y"))
}
# Uniendo todos los dataframes de la lista en uno sólo
data <- do.call(rbind, data.list)
