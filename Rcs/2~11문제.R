vec1<-rep("R",each=5)
vec1
vec2<-seq(1,10,3)
vec2
vec3<-rep(vec2,each=3)
vec3
vec4<-c(vec2,vec3)
vec4
seq(25,-15,-5)
vec5<-vec4[seq(1,16,2)]
vec5

name<-c("최민수","유관순","이순신","김유신","홍길동")
age<-c(55,45,45,53,15)
gender<-c(1,2,1,1,1)
job<-c("연예인","주부","군인","직장인","학생")
sat<-c(3,4,2,5,5)
grade<-c("C","C","A","D","A")
total<-c(44.4,28.5,43.5,NA,27.1)

user<-data.frame(name,age,gender,job,sat,grade,total)
histogram(user$gender)
user2<-user[seq(2,6,2)]
user2

kor<-c(90,85,90)
eng<-c(70,85,75)
mat<-c(86,92,88)

Date<-data.frame(kor,eng,mat)
Date
apply(Date,1,max)
apply(Date,2,max)
round(apply(Date,1,mean),2)
round(apply(Date,2,mean),2)
apply(Date,1,var)
apply(Date,1,sd)

Data2<-c("2017-02-05 수입3000원",
         "2017-02-06 수입4500원",
         "2017-02-07 수입2500원")
library(stringr)

str_extract_all(Data2,"[0-9]{4}[가-히]")

paste(Data2,cpllapse=",")

setwd("C:/Users/user/Desktop/Rcs")
Titanic
write.csv(Titanic,"C:/Users/user/Desktop/Rcs/Rwork/output/titanic.csv")
titanicData<-read.csv("C:/Users/user/Desktop/Rcs/Rwork/output/titanic.csv")
str(titanicData)
head(titanicData [, -c(1,3)])

data("CO2")
a<-(CO2$Treatment=='nonchilled')
write.csv(a,"C:/Users/user/Desktop/Rcs/CO2_df.csv")
a1<-(CO2$Treatment=='chilled')
write.csv(a1,"C:/User/user/Desktop/Rcs/CO2_df2.csv")

name<-c("유관순","홍길동","이순신","신사임당")
gender<-c("F","M","M","F")
price<-c(50,65,45,75)

client<-data.frame(name,gender,price)

result<-ifelse(price>=65,"Best","Normal")
result
table(result)

EMP<-c("2014홍길동220","2002이순신300","2010유관순260")

emp_pay <-function(x){
  library(stringr)
  epay<-numeric()
  ename<-character()
  idx<-1

  for(n in x){
    ename[idx]<-str_extract(n,'[가-히]{3}')
    spay<-str_extract(n,'[가-히]{3}[0-9]{3}')
    spay<-str_replace(spay,'[가-히]{3}','')
    vec<-as.numeric(spay)
    epay[idx]<-vec
    idx<-idx+1
}

avg<-mean(epay)
cat('전체급여 평균:',avg,'\n')
cat('평균이상급여수령자','\n')

n<-1:length(x)
for(idx in n){
  if(epay[idx]>=avg){
    cat(ename[idx],'=>',epay[idx],'\n')
  }
}
}

emp_pay(EMP)

function(x)
a<-1
b<-3

((b*3+4)-(a*3+4))/(b-a)

install.packages("RSADBE")
library('RSADBE')
data("Bug_Metrics_Software")

rowSums(Bug_Metrics_Software[,,1])
colMeans(Bug_Metrics_Software[,,1])
summary(Bug_Metrics_Software[,,1])

data("iris3")
names(iris3)
attributes(iris3)
str(iris3)

plot(iris3,main = "iris3 전체 데이터 셋의 분포현황")
plot(iris3[,c(3,1),1],main="iris3 setosa 데이터 셋의 분포현황")
plot(iris3[,c(3,2),2],main = "iris versicolor 데이터 셋의 분포현황")
plot(iris3[,c(3,3),3],main = "iris virgivica 데이터 셋의 분포현황")

data("iris")
str(iris)

plot(iris[,1],iris[,3])
plot(iris[,1],iris[,3],col=iris[,5])
names(iris)

plot(iris$Sepal.Length,iris$Petal.Length,col=iris$Species)
title("iris 데이터 테이블 산포도 차트")
setwd("C:/Users/user/Desktop/Rcs/Rwork/output")
jpeg("iris.jpg",width=720,height=480)
dev.off()

install.packages("dplyr")
library(dplyr)
data("iris")
iris

a1<- iris%>%filter(Petal.Length>=1.5)
a1

a2<-a1%>%select(Sepal.Length,Petal.Length,Species)
a2

a3<-a2%>%mutate(diff=Sepal.Length - Petal.Length)
head(a3)

a4<-a3%>%group_by(Species)%>%summarise(s= mean(Sepal.Length),
                                       p= mean(Petal.Length))
a4

install.packages("reshape2")
library(reshape2)

long<-melt(iris,id="Species")
long

str(iris)
ir_dcast<-dcast(long,Species ~ variable,sum)
ir_dcast

getwd()
setwd("C:/Users/user/Desktop/Rcs/Rwork/Part-II")
dataset<-read.csv("dataset.csv",header = T)
dataset
dataset2<-subset(dataset,price>=2&price<=8)

p<-dataset2$position
p2<-6-p

dataset2$position<-p2
dataset2$position2[dataset2$position ==1]<-'1급'
dataset2$position2[dataset2$position ==2]<-'2급'
dataset2$position2[dataset2$position ==3]<-'3급'
dataset2$position2[dataset2$position ==4]<-'4급'
dataset2$position2[dataset2$position ==5]<-'5급'

dataset$position2

resident2<-na.omit(dataset2$resident)
length(resident2)
resident2

dataset2$gender2[dataset2$gender ==1]<-'남자'
dataset2$gender2[dataset2$gender ==2]<-'여자'
table(dataset2$gender2)
pie(table(dataset2$gender2))

dataset2$age3[dataset2$age <=30]<-'1'
dataset2$age3[dataset2$age >30 & dataset2$age <55]<-'2'
dataset2$age3[dataset2$age >=55]<-'3'
head(dataset2$age3)

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

library(latticeExtra)
data(SeatacWeather)
str(SeatacWeather)

xyplot(min.temp + max.temp ~ day | month,
       data=SeatacWeather,type="1",layout=c(3,1))
install.packages("ggplot2")
library(ggplot2)
head(diamonds)
qplot(carat,price,data = diamonds, color=clarity,geom = "line")

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

install.packages("rJava")
install.packages("DBI")
install.packages("RJDBC")
library(DBI)
Sys.setenv(JAVA_HOME = "C:/Program Files/Java/jdk-15.0.1")
library(rJava)
library(RJDBC)

drr <- JDBC(driverClass = "com.mysql.cj.jdbc.Driver",
            "C:/Rcs/mysql-connector-java-8.0.23.jar")
conn <- dbConnect(drr,"jdbc:mysql://127.0.0.1:3306/work","dda","0258")

query<-"select * from GoodsInfo"
dbGetQuery(conn,query)

install.packages("MASS")
library(MASS)
data("Animals")
head(Animals)

summary(Animals$brain)
mean(Animals$brain) 
median(Animals$brain)
sd(Animals$brain)
var(Animals$brain) 
max(Animals$brain)
min(Animals$brain)

setwd("C:/Users/user/Desktop/Rcs/Rwork/Part-III")
data<-read.csv("descriptive.csv",header = TRUE)
str(data)

type<-data$type
table(type)
barplot(table(type))
pie(table(type))

mean(data$age) 
sd(data$age)

install.packages("moments")

library(moments)

age<-data$age

skewness(age)
kurtosis(age)

hist(age)

hist(age,freq=F)
lines(density(age),col = 'blue')
x<-seq(40,70,5)
curve(dnorm(x, mean(age), sd(age)), col='red', add = T)

      