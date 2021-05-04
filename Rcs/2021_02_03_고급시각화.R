install.packages("lattice")
library(lattice)
install.packages("mlmRev")
library(mlmRev)
data(Chem97)
str(Chem97)
head(Chem97,30)
Chem97

histogram(~gcsescore,data = Chem97)
histogram(~gcsescore | score,data = Chem97)
histogram(~gcsescore | factor(score),data = Chem97)
densityplot(~gcsescore | factor(score),data = Chem97,
            groups = gender,
            plot.points=T,auto.key = T)
data(VADeaths)
VADeaths
str(VADeaths)
class(VADeaths)
mode(VADeaths)
dif<-as.data.frame.table(VADeaths)
str(dif)
dif
barchart(Var1 ~ Freq | Var2,data = dif,layout=c(4,1))
barchart(Var1 ~ Freq | Var2,data = dif,layout=c(4,1),origin=0)
dotplot(Var1 ~ Freq | Var2,dif)
dotplot(Var1 ~ Freq | Var2,dif,layout=c(4,1))
dotplot(Var1 ~ Freq,data=dif,
        groups = Var2,type="o",
        auto.key=list(space="right",points=T,lines=T)
        )
library(datasets)
str(airquality)
xyplot(Ozone ~ Wind,data = airquality)
xyplot(Ozone ~ Wind | Month,data = airquality)
xyplot(Ozone ~ Wind | Month,data = airquality, layout=c(5,1))
convert<-transform(airquality,Month = factor(Month))
str(convert)
xyplot(Ozone ~ Wind | Month,data = convert)

head(quakes)
str(quakes)
xyplot(lat ~ long,data = quakes,pch=".")

tplot<-xyplot(lat ~ long,data = quakes,pch=".")
tplot<-update(tplot,main="1964년 이후 태평양에서 발생한 지진위치")
print(tplot)

range(quakes$depth)
quakes$depth2[quakes$depth >=40 & quakes$depth <=150]<-1
quakes$depth2[quakes$depth >=151 & quakes$depth <=250]<-2
quakes$depth2[quakes$depth >=251 & quakes$depth <=350]<-3
quakes$depth2[quakes$depth >=351 & quakes$depth <=450]<-4
quakes$depth2[quakes$depth >=451 & quakes$depth <=550]<-5
quakes$depth2[quakes$depth >=551 & quakes$depth <=680]<-6

convert<-transform(quakes,depth2=factor(depth2))
xyplot(lat ~ long | depth2, data = convert)
xyplot(Ozone + Solar.R ~ Wind | factor(Month),
       data = airquality,
       col = c("blue","red"),
       layout = c(5,1))

numgroup<-equal.count(1:150,number = 4,overlap=0)
numgroup

depthgroup<- equal.count(quakes$depth,number=5,overlap=0)
depthgroup

xyplot(lat~long | depthgroup,data = quakes,
       mian = "Fojo Earthquakes(depthgroup)",
       ylab = "latitude",xlab = "longitude",
       pch = "@",col="red")

magnitudegroup <-equal.count(quakes$mag,number = 2, overlap =0)
magnitudegroup

xyplot(lat ~ long | magnitudegroup,data = quakes,
       main = "Fiji Earthquakes(magnitude)",
       ylab = "latitude",xlab = "longitude",
       pch = "@",col="blue")

xyplot(lat ~ long |depthgroup * magnitudegroup,data = quakes,
       main = "Fiji Earthquakes",
       ylab = "latitude",xlab = "longitude",
       pch="@", col =c("red","blue"))

quakes$depth3[quakes$depth >=39.5 & quakes$depth <=80.5]<-'d1'
quakes$depth3[quakes$depth >=79.5 & quakes$depth <=186.5]<-'d2'
quakes$depth3[quakes$depth >=185.5 & quakes$depth <=397.5]<-'d3'
quakes$depth3[quakes$depth >=396.5 & quakes$depth <=562.5]<-'d4'
quakes$depth3[quakes$depth >=562.5 & quakes$depth <=680.5]<-'d5'

quakes$mag3[quakes$mag >=3.95 & quakes$mag <=4.65]<-'m1'
quakes$mag3[quakes$mag >=4.55 & quakes$mag <=6.45]<-'m2'

convert <- transform(quakes,
                     depth3 = factor(depth3),
                     mag3 = factor(mag3))
xyplot(lat ~ long | depth3 * mag3,data = convert,
       main ="Fiji Earthquakes",
       ylab = "latitude",xlab = "longitude",
       pch = "@",col=c("red","blue"))

coplot(lat ~ long | depth,data = quakes)
coplot(lat ~ long | depth,data = quakes,
       overlap = 0.1)
coplot(lat ~ long | depth,data = quakes,
       number = 5, row = 1)
coplot(lat ~ long | depth,data = quakes,
       naumber =5, row =1,
       panel=panel.smooth)
cloud(depth ~ lat * long,data = quakes,
      zlim = rev(range(quakes$depth)),
      xlab = "경도",ylab = "위도",zlab="깊이")
cloud(depth ~ lat * long,data = quakes,
      zlim = rev(range(quakes$depth)),
      panel.aspect=0.9,
      screen = list(z =45,x=-25),
      xlab = "경도",ylab = "위도",zlab="깊이")

install.packages("ggplot2")
library(ggplot2)
data(mpg)
str(mpg)
head(mpg)
summary(mpg)
table(mpg$drv)

qplot(hwy,data = mpg)
qplot(hwy,data = mpg,fill=drv)
qplot(hwy,data = mpg,fill=drv,
      binwidth=2)
qplot(hwy,data = mpg,fill=drv,
      facets = .~drv,
      binwidth=2)
qplot(hwy,data = mpg,fill=drv,
      facets = drv~.,
      binwidth=2)
qplot(displ,hwy,data = mpg)
qplot(displ,hwy,data = mpg,color=drv)
qplot(displ,hwy,data = mpg,color=drv,facets = .~drv)

head(mtcars)
qplot(wt,mpg,data = mtcars,color=factor(carb))
qplot(wt,mpg,data = mtcars,size=qsec,color=factor(carb))
qplot(wt,mpg,data = mtcars,size=qsec,color=factor(carb),shape=factor(cyl))
head(diamonds)
qplot(clarity,data = diamonds,fill=cut,grom="bar")
qplot(clarity,data = diamonds,colour=cut,grom="bar")
qplot(wt,mpg,data = mtcars,size=qsec,geom ="point")
qplot(wt,mpg,data = mtcars,size=factor(cyl),
      color=factor(carb),geom ="point")
qplot(wt,mpg,data = mtcars,size=qsec,
      color = factor(carb),
      shape=factor(cyl),geom ="point")
qplot(wt,mpg,data = mtcars,geom =c("point","smooth"))
qplot(wt,mpg,data = mtcars,color=factor(cyl),
      geom =c("point","smooth"))
qplot(mpg,wt,data=mtcars,
      color = factor(cyl),geom="line")
qplot(mpg,wt,data = mtcars,
      color=factor(cyl),geom = c("point","line"))
p<-ggplot(diamonds,aes(carat,price,color=cut))
p+geom_point()
p<-ggplot(mtcars,aes(mpg,wt,color=factor(cyl)))
p+geom_point()
p<-ggplot(mtcars,aes(mpg,wt,color=factor(cyl)))
p+geom_line()
p<-ggplot(mtcars,aes(mpg,wt,color=factor(cyl)))
p+geom_point()

p<-ggplot(diamonds,aes(price))
p+stat_bin(aes(fill=cut),geom="bar")
p+stat_bin(aes(fill=..density..),geom="bar")

p<-ggplot(diamonds,aes(price))
p+stat_bin(aes(fill=cut),geom = "area")

p+stat_bin(aes(color=cut,
               size =..density..),geom = "point")

library(UsingR)
data("galton")
p<-ggplot(data=galton,aes(x=parent,y=child))
p+geom_count()+geom_smooth(method = "lm")

p<-ggplot(diamonds,aes(carat,price,color=cut))
p<-p+geom_point()+ggtitle("다이아몬드 무게와 가격의 상관관계")
print(p)
p+theme(
        title=element_text(color = "blue",size=25),
        axis.title = element_text(size=14,face = "bold"),
        axis.title.x = element_text(color = "green"),
        axis.title.y = element_text(color="green"),
        axis.text = element_text(size=14),
        axis.text.y = element_text(color = "red"),
        axis.text.x = element_text(color = "purple"),
        legend.title = element_text(size = 20,
                                    face = "bold",
                                    color = "red"),
        legend.position = "bottom",
        legend.direction = "horizontal")

library(ggplot2)
install.packages("ggmap")
library(ggmap)
seoul<-c(left = 126.77, bottom=37.40,
         right=127.17, top=37.70)
map<-get_stamenmap(seoul,zoom=12,maptype = 'terrain')
ggmap(map)
pop<-read.csv(file.choose(),header = T)

library(stringr)
region<-pop$'지역명'
lon<-pop$LON
lat<-pop$LAT
tot_pop<-as.numeric(str_replace_all(pop$'총인구수',',',''))

df<-data.frame(region,lon,lat,tot_pop)
df

daegu<-c(left=123.4423013, bottom = 32.8528306,
         right=131.601445,top=38.8714354)
map<-get_stamenmap(daegu,zoom = 7,maptype = 'watercolor')
layer1<-ggmap(map)
layer1

layer2<-layer1+geom_point(data=df,
                          aes(x=lon,y=lat,
                              color=fator(tot_pop),
                              size=factor(tot_pop)))
layer2
