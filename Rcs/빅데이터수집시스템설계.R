str(rivers)
mode(rivers)
data(rivers)

barplot(rivers,breaks=6,beside = T,col = 'skyblue',xlab = "miles")
hist(rivers,breaks=6,col = 'skyblue',xlab = "miles",border='navy')

setwd("C:/Users/user/Desktop/Rcs")
data<-read.csv("monin.csv",header = T)
head(data)
str(data)

barplot(data,ylim =c(0,15000),
        col = rainbow(2))
barplot(as.matrix(data),beside = F,col = rainbow(2),
        ylab = "발표건수",
        main = "문인잡지의 작품 발표 현황")

legend(19,71,c("2016","2017"),cex = 0.8,fill = rainbow(2))        
        

data(trees)
str(trees)

df<-as.data.frame(trees)
str(df)
df
layout = c(1,3)
barplot(trees$Girth)
barplot(trees$Height)
barplot(trees$Volume)


library(ggplot2)
head(diamonds)
ds<-diamonds
ds
barplot(ds$cut,beside = T,horiz = T,
        col='pink',
        main = "Quality of the cut")
p<-ggplot(diamonds,aes(cut))
p+stat_bin(aes(fill=carat),geom = "bar")
