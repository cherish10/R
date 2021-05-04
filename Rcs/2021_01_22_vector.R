age <-c(30,35,40)
age

names(age) <- c("홍길동","이순신","깅김찬")
age

age[1]
age[0]

v1 <-c(13,-5,20:23,12,-2:3)
v1[1]
v1[c(2,4)]
v1[-3]
v1[-c(2,5:10,1)]

install.packages("RSADBE")
library(RSADBE)
data("Severity_Counts")
str(v1)
str(Severity_Counts)

Severity_Counts

m<- matrix(c(1:5))
m

m<- matrix(c(2:3))
m

m <- matrix(c(1:30),3,5,0)
m

m<- matrix(1,5,5)
m

x1<-c(5,10,50:52)
x2<-c(30,5,6:8)
mr<-rbind(x1,x2)
mr

x<- matrix(c(1:9),3,3)
x
length(x)
ncol(x)

apply(x,1,max)
apply(x,1,min)
apply(x,2,mean)

f<-function(x){
+ x*c(1,2,3)
}
result <- apply(x,1,f)
result

colnames(x) <- c("one","two","three")
x

vec <- c(1:12)
arr <- array(vec,c(3,2,2))
arr

data("Bug_Metrics_Software")
str(Bug_Metrics_Software)
Bug_Metrics_Software
