install.packages("ggplot2")
library(ggplot2)
head(diamonds)
qplot(carat,price,data = diamonds, color=clarity,geom = "line" )


install.packages("lattice")
library(lattice)
head(quakes)
str(quakes)

depthgroup <- equal.count(quakes$depth, number=3,overlap = 0)
depthgroup

magnitudegrop <- equal.count(quakes$mag, number =2, overlap = 0)
magnitudegrop


xyplot(mag ~ depth|depthgroup * magnitudegrop,data= quakes,
       main = "Fiji Earthquakes",
       ylab="latitude",xlab="longitde",
       pch="@",col=c("red","blue"))


install.packages("ggmap")
library(ggmap)
seoul<-c(left=126.77,bottom = 37.40,
         right = 127.17, top = 37.70)
map <-get_stamenmap(seoul,zoom = 11, maptype = "watercolor")
ggmap(map)

uni<- read.csv(file.choose(),header = T)

library(stringr)

region <-uni$학교명
lon<-uni$LON
lat<-uni$LAT

df<-data.frame(region,lon,lat)
df

layer1 <- ggmap(map)
layer1

layer2 <- layer1 + geom_point(data = df,
                              aes(x = lon, y = lat,
                                  color = factor(region),
                                  size = factor(region)))
layer2
layer3<- layer2 + geom_text(data = df,
                            aes(x = lon + 0.01, y = lat + 0.08,
                                label =  region),size = 3)
layer3
ggsave("university.png",scale=1,width = 10.24, height = 7.68)
