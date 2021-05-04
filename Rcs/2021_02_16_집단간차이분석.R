N=10000
X=165.1
S=2
low<-X-1.96*S/sqrt(N)
high<-X+1.96*S/sqrt(N)
low;high

high - X
(low -X)*100
(high-X)*100

setwd("C:/Users/user/Desktop/Rcs/Rwork/Part-III")
data<-read.csv("one_sample.csv",header = TRUE)
head(data)

x<-data$survey

summary(x)
length(x)
table(x)

install.packages("prettyR")
library(prettyR)
freq(x)

binom.test(14,150,p=0.2)
binom.test(14,150,p=0.2,alternative = "two.side",conf.level = 0.95)
binom.test(14,150,p=0.2,
           alternative = "greater",conf.level = 0.95)
binom.test(c(14,150),p=0.2,
           alternative = "less",conf.level = 0.95)

setwd("C:/Users/user/Desktop/Rcs/Rwork/Part-III")
data<-read.csv("one_sample.csv",header = TRUE)
str(data)
head(data)
a<-data$time
head(a)

summary(a)
mean(a,na.rm=T)
x1<-na.omit(a)
mean(x1)

shapiro.test(x1)
par(mfrow = c( 1,2))
hist(x1)
qqnorm(x1)
qqline(x1,lty =1,col='blue')

t.test(x1,mu = 5.2)
t.test(x1,mu = 5.2,alter = "two.side",conf.level = 0.95)
t.test(x1,mu = 5.2,alter = "greater",conf.level = 0.95)
qt(7.083e-05,108)

data<-read.csv("two_sample.csv",header = TRUE)
head(data)

x<-data$method
y<-data$survey

table(x)
table(y)
table(x,y,useNA = "ifany")

prop.test(c(110,135),c(150,150),
          alternative = "two.sided",conf.level = 0.95)
prop.test(c(110,135),c(150,150),
          alter = "greater",conf.level = 0.95)
prop.test(c(110,135),c(150,150),
          alter = "less",conf.level = 0.95)


data<-read.csv("paired_sample.csv",header = TRUE)
result<-subset(data,!is.na(after),c(before,after))
x<-result$before
y<-result$after
x;y
length(x)
length(y)
mean(x)
mean(y)

var.test(x,y,paired=TRUE)

t.test(x,y,paired =TRUE,
       alter="two.sided",
       conf.int=TRUE,conf.level = 0.95)
t.test(x,y,paired =TRUE,
       alter="greater",
       conf.int=TRUE,conf.level = 0.95)
t.test(x,y,paired =TRUE,
       alter="less",
       conf.int=TRUE,conf.level = 0.95)

data<-read.csv("three_sample.csv",header = TRUE)
head(data)

method<-data$method
survey<-data$survey
method;survey
table(method,useNA = "ifany")
table(method,survey,useNA = "ifany")
prop.test(c(34,37,39),
          c(50,50,50))

data<-subset(data,!is.na(score),c(method,score))
head(data)
par(mfrow = c(1,2))
plot(data$score)
barplot(data$score)
mean(data$score)
length(data$score)
data2<-subset(data,score <=14)
length(data2$score)
x<-data2$score
par(mfrow = c(1,1))
boxplot(x)

data2$method2[data2$method ==1]<-'방법1'
data2$method2[data2$method ==2]<-'방법2'
data2$method2[data2$method ==3]<-'방법3'
table(data2$method2)
x<-table(data2$method2)
x
y<-tapply(data2$score,data2$method2,mean)
y
df<-data.frame(교육방법 = x,성적 = y)
df
bartlett.test(score ~ method,data = data2)

result<-aov(score ~ method2,data = data2)
names(result)

summary(result)

TukeyHSD(result)
plot(TukeyHSD(result))
