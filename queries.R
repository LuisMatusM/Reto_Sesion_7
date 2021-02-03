install.packages("DBI")
install.packages("RMySQL")

library(DBI)
library(RMySQL)


MyDataBase <- dbConnect(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest")

DataDB <- dbGetQuery(MyDataBase, "select * from CountryLanguage")
class(DataDB)
head(DataDB)

install.packages('dplyr')
library(dplyr)
esp<-filter(DataDB, Language=='Spanish')

install.packages('ggplot2')
library(ggplot2)
ggplot(esp, aes(x=Percentage, y=CountryCode), color= IsOfficial) + geom_bin2d() + coord_flip()

