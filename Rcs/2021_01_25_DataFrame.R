no <-c(1,2,3)
name <-c("hong","lee","kim")
pay<- c(150,250,300)
vemp <-data.frame(No =no, Name = name, Pay = pay)
vemp

m <- matrix(
c(1,"hong",150,
+ 2,"lee",250,
+ 3,"kim", 300),3, by = T)
meamp <- data.frame(m)
meamp

getwd()
txtemp <-read.table('emp.txt',header = 1,sep = "")
txtemp

df <- data.frame(x=c(1:5), y = seq(2,10,2), z =c('a','b','c','d','e'))
df
x1<- subset(df,x>=3)
x1
y1<-subset(df,y<=8)
xyand <- subset(df,x>=2&y<=6)
xyor <- subset(df,x>=2|y<=6)
y1
xyand
xyor

sid = c("A","B","C","D")
score = c(90,80,70,60)
subject = c("컴퓨터","국어국문","소프트웨어","유아교육")

student <- data.frame(sid,score,subject)
student


install.packages("UsingR")
library(UsingR)
data(galton)
str(galton)
dim(galton)
head(galton,9)

num <-list(c(1:5),c(6,10))
num
