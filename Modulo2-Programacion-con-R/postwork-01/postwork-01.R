library(dplyr)

setwd("C:/Paramont/Pogra/Cursos/BEDU/Modulo2-Programacion-con-R/postwork/postwork-01")
df <- read.csv("SP1.csv")
# total de partidos jugados en toda la temporada
total.matches <- dim(df)[1]


# Calculo de probabilidad (marginal) de que un equipo jugando en casa anote x=0,1,...6 goles
m.prob.home <- data.frame(table(df$FTHG))
m.prob.home <- rename(m.prob.home, goles=Var1, p.marginal=Freq)
m.prob.home <- mutate(m.prob.home, p.marginal=p.marginal/total.matches)
  #Probabilidad marginal es la suma de incidencias de un equipo metiendo x goles en un partido, entre numero total de partidos.

# Calculo de probabilidad (marginal) de que un equipo jugando como visitante anote y=0,1,...5 goles
m.prob.away <- data.frame(table(df$FTAG))
m.prob.away <- rename(m.prob.away, goles=Var1, p.marginal=Freq)
m.prob.away <- mutate(m.prob.away, p.marginal=p.marginal/total.matches)

# Calculo de probabilidad (conjunto) de que un equipo visitante anote x=0,1,...6 goles y un equipo anfitrin anote x=0,1,...8 goles
# Goles de anfitrion (FTHG) son filas.
# Goles de visitante (FTAG) son columnas.
c.prob <- data.frame(table(df$FTHG, df$FTAG))
c.prob <- rename(c.prob, goles.anfitrion=Var1, goles.visitante=Var2, p.conjunta=Freq)
c.prob <- mutate(c.prob, p.conjunta=p.conjunta/total.matches)



#imprimiendo resultados
print("Probabilidad de que un equipo anfitrión anote 0,1,...,6 goles")
m.prob.home
print("Probabilidad de que un equipo invitado anote 0,1,...,5 goles")
m.prob.away
print("Probabilidad de que un equipo anfitrión anote 0,1,...,6 goles, y que un equipo invitado anote 0,1,...,5 goles")
c.prob
