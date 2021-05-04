setwd("C:/Users/user/Desktop/Rcs/Rwork/Part-III")
data<-read.csv("cleanDescriptive.csv",header = TRUE)
head(data)

x<-data$level2
y<-data$level2

result <-data.frame(Level = x,Pass=y)
dim(result)

table(result)

install.packages("gmodels")
library(gmodels)
install.packages("ggplot2")
library(ggplot2)

CrossTable(x=diamonds$color,y=diamonds$cut)

x<-data$level2
y<-data$level2

CrossTable(x,y)

CrossTable(x = diamonds$cut,
           y = diamonds$color,chisq = TRUE)

chisq.test(c(4,6,17,16,8,9))
data<-textConnection(
  "스포츠음료종류 관측도수
  1 41
  2 30
  3 51
  4 71
  5 61
  ")
x<-read.table(data,header = T)

x<-data$level2
y<-data$level2
CrossTable(x,y,chisq = TRUE)

setwd("C:/Users/user/Desktop/Rcs/Rwork/Part-III")
data<-read.csv("homogenity.csv")
head(data)
data<-subset(data,!is.na(survey),c(method,survey))
