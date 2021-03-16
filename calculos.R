install.packages(c("googlesheets4","googledrive"))
library(googledrive)
drive_auth()
2
target <- drive_get("https://docs.google.com/spreadsheets/d/1SmXjQpvz0ejkpOZOKafsEWolhzk63tJuiYJ15lst95s/edit#gid=1513074780")
drive_download(target, type= "csv", path = "Sample Dow.csv")

Meses <- c("Octubre","Diciembre")
Seguidores <- c(1243*0.89, 1243)
Tabla_1 <- data.frame(cbind(Meses,Seguidores))


library( knitr ) # Presentación de tablas
#pak readr
library(readr)

#Lecturas de Google Drive----
data_ig<- drive_get("https://docs.google.com/spreadsheets/d/1sd-fCMDJgtMjVszNQoZAW25d274MhtLI4DpmsReFhg4/edit#gid=1700690346")
data_stories<- drive_get("https://docs.google.com/spreadsheets/d/1sd-fCMDJgtMjVszNQoZAW25d274MhtLI4DpmsReFhg4/edit#gid=870159972")
data_fb<- drive_get("https://docs.google.com/spreadsheets/d/1sd-fCMDJgtMjVszNQoZAW25d274MhtLI4DpmsReFhg4/edit#gid=407085179")
data_tt<- drive_get("https://docs.google.com/spreadsheets/d/1sd-fCMDJgtMjVszNQoZAW25d274MhtLI4DpmsReFhg4/edit#gid=1968740801")
drive_download(data_ig, type= "csv", path = "instagram.csv")
drive_download(data_stories, type= "csv", path = "historias.csv")
drive_download(data_fb, type= "csv", path = "facebook.csv")
drive_download(data_tt, type= "csv", path = "twitter.csv")

#estadisticas de  instagram----
library(readr)
instagram <- read_csv("instagram.csv")
View(instagram)
#install.packages("githubinstall")
#remotes::install_github("rstudio/rticles")

library(dplyr)
data3 <- instagram
data3 <- as.data.frame(unclass(data3)) 
group_by(data3)
data3 %>%
  rows_patch(data.frame(data3$Type == c("Imagen","Video","Carrete","Gifs"), data3$Views = 0 ))
#data3[is.na(data3)] <- 0
#elimine los valores NA

data3$Type <- as.factor(data3$Type)

instagram[,c(3,6)] %>% group_by(Type)
