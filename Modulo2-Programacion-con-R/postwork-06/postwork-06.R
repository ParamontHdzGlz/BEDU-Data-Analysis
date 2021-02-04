
library(dplyr)

setwd("C:/Paramont/Pogra/Cursos/BEDU/Modulo2-Programacion-con-R/postwork/postwork-06")
df <- read.csv("match.data.csv")


# 1 
# Agregando la columna sumagoles
df <- mutate(df,date=as.Date(date, "%Y-%m-%d"), sumagoles=home.score+away.score)

# 2
# Obteniendo promedio de sumagoles por mes
prom.goles <- df %>% 
  group_by(format(date, "%Y-%m")) %>% 
  summarise(goles.prom.mes=mean(sumagoles))

# 3
# Creando serie de tiempo para el promedio mensual de goles
prom.goles <- as.data.frame(prom.goles)
prom.goles <- rename(prom.goles, date='format(date, "%Y-%m")')
prom.goles <- prom.goles[prom.goles$date <= '2019-12',]
prom.goles.ts <- ts(prom.goles$goles.prom.mes, start=1, frequency=10)


# 4 
# Graficando
ts.plot(prom.goles.ts[11:20])

