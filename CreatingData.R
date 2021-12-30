
setwd("C:/Users/enriq/Dropbox/Midagri/DashBoard")

#install.packages("plotly")
#install.packages("plyr")
#install.packages("flexdashboard")
#install.packages("rmarkdown")
#install.packages("ggplot2")
#install.packages("tinyteX")
#install.packages("readxl")
#install.packages("dplyr")
#install.packages("reshape2")
#install.packages("tidyverse")
#install.packages("scales")
#install.packages("grid")
#install.packages("gridExtra")
#install.packages("lemon")

#  render("Dashboard.Rmd", output_format = "word_document")

library(ggplot2)
library(plotly)
library(plyr)
library(flexdashboard)
library(reshape2)
library(dplyr)
library(tidyverse) 
library(rmarkdown)

# Make some noisily increasing data
set.seed(955)
library(readxl)
data1 <- read_excel("d1.xlsx", sheet = "Hoja2")
Porcentaje <-c(data1$Hombre, data1$Mujer)
Género <-c(rep("Hombre", 20), rep("Mujer", 20))
df <- data.frame(Porcentaje,Género)

df_fill <- dcast(data1, Años ~ Género, fun.aggregate = sum) %>% melt(. , id = "Años")

################################################################################

p <- ggplot(data = df_fill, aes(x = Años, y = Porcentaje, fill = Género))  + geom_bar(stat="identity", position="dodge")+ theme_bw() +   theme(panel.border = element_blank())
ggplotly(p) 

library(readxl)
data2 <- read_excel("d2.xlsx", sheet = "Hoja2")
df_n2 <- data.frame(data2)

p <- ggplot(data = df_n2,aes(x=Género, y=Porcentaje, fill = Tipo)) + 
  geom_bar(width = .35,position="dodge", stat="identity") + theme_bw()  +   theme(panel.border = element_blank())
ggplotly(p)

library(readxl)
data3 <- read_excel("d3.xlsx", sheet = "Hoja2")
df_n3 <- data.frame(data3)

p <- ggplot(df_n3,aes(x=Años, y = Índice, fill = Ámbito)) + geom_line(size = 1.2,stat="identity",aes(colour=Ámbito, group=Ámbito)) + theme_bw() +   theme(panel.border = element_blank())
ggplotly(p)

library(readxl)
data4 <- read_excel("d4.xlsx", sheet = "Hoja2")
df_n4 <- data.frame(data4)

p <- ggplot(df_n4,aes(x=Año, y = Porcentaje, fill = Género)) + geom_line(size = 1.2,stat="identity",aes(colour=Género, group=Género)) + theme_bw() +   theme(panel.border = element_blank())
ggplotly(p)


df_n5 <- data.frame(
  Género = c("Hombres", "Mujeres"),
  Superficie = c(79, 21)
)

p <- ggplot(df_n5,aes(x=Género, y = Superficie, fill = Género)) +
  geom_bar(width = .4, stat = "identity") + theme_bw() +  theme(panel.border = element_blank())

ggplotly(p)


df_n55 <- data.frame(
  Género = c("Hombres", "Mujeres"),
  Superficie = c(10.4, 6.4)
)

p <- ggplot(df_n55,aes(x=Género, y = Superficie, fill = Género)) +
  geom_bar(width = .4, stat = "identity") + theme_bw() +  theme(panel.border = element_blank())

ggplotly(p)

library(lemon)
library(readxl)
data6 <- read_excel("d5.xlsx", sheet = "Hoja2")
df_n6 <- data.frame(data6)

library(tidyverse)

p <- ggplot(df_n6, aes(x = ifelse (test = Género == "Mujeres", yes = -Porcentaje , no = Porcentaje), y = Departamento, fill = Género)) + theme_bw() + geom_bar(stat = "identity") + theme(panel.border = element_blank()) + geom_col() + scale_x_symmetric(labels = abs)+labs(x="Porcentaje")

ggplotly(p)

library(lemon)
library(readxl)
data7 <- read_excel("d5.xlsx", sheet = "Hoja3")
df_n7 <- data.frame(data7)

library(tidyverse)

p <- ggplot(df_n7, aes(x = ifelse (test = Género == "Mujeres", yes = -Porcentaje , no = Porcentaje), y = Departamento, fill = Género)) + theme_bw() + geom_bar(stat = "identity") + theme(panel.border = element_blank()) + geom_col() + scale_x_symmetric(labels = abs)+labs(x="Porcentaje")

ggplotly(p)
















