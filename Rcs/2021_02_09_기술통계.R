setwd("C:/Users/user/Desktop/Rcs/Rwork/Part-III")
data<-read.csv("descriptive.csv",header = TRUE)
head(data)

dim(data)
length(data)
length(data$survey)
str(data)

summary(data)
length(data$gender)
summary(data$gender)
table(data$gender)

data<-subset(data,gender==1 | gender==2)
x<-table(data$gender)
x
barplot(x)

prop.table(x)
y<-prop.table(x)
round(y*100,2)

length(data$level)
summary(data$level)
table(data$level)

x1<-table(data$level)
barplot(x1)

survey<-data$survey
survey

summary(survey)

x1<-table(survey)
x1

hist(survey)
pie(x1)

length(data$cost)
summary(data$cost)

plot(data$cost)
data<-subset(data,data$cost>=2 &data$cost <=10)
x<-data$cost
mean(x)

mean(x)
median(x)
sort(x)
sort(x,decreasing = T)

quantile(x,1/4)
quantile(x,2/4)
quantile(x,3/4)
quantile(x,4/4)

length(x)
x.t<- table(x)
max(x.t)

x.m<-rbind(x.t)
class(x.m)
str(x.m)
which(x.m[1,]==18)

x.df<-as.data.frame(x.m)
which(x.df[1,]==18)

x.df[1,19]
attributes(x.df)

var(x)
sd(x)
sqrt(var(data$cost,na.rm = T))

table(data$cost)

hist(data$cost)
plot(data$cost)

data$cost2[data$cost >=1 & data$cost <=3] <-1
data$cost2[data$cost >=4 & data$cost <=6] <-2
data$cost2[data$cost >=7] <-3

table(data$cost2)
par(mfrow = c(1,2))
barplot(table(data$cost2))
pie(table(data$cost2))

install.packages("moments")
library(moments)
cost<-data$cost

skewness(cost)

kurtosis(cost)

hist(cost)

hist(cost,freq = F)
lines(density(cost),col='blue')
x<-seq(0,8,0.1)
curve(dnorm(x,mean(cost),sd(cost)),col='red',add=T)
