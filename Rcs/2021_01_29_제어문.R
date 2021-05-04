x <- 50; y <-4; z <-x*y
if(x*y >=40){
  cat("x*Y의 결과는 40입니다.\n")
  cat("x*y =z")
}else{
  cat("x*y의 결과는 40 미만입니다.x*y=",z,"\n")
}

score <- scan()
score
result<-"노력"
if(score >= 80){
  result <-"우수"
}

cat("당신의 학점은",result,score)

score<-scan()
if(score >= 90){
  result = "A학점"
}else if(score >= 80){
  result = "B학점"
}else if(score >= 70){
  result = "C학점"
}else if(score >=60){
  result = "D학점"
}else{
  result = "F학점"
}
cat("당신의 학점은",result)
print(result)

switch("name",id = "hong",pwd = "1234",age = 105,name="홍길동")
empname<-scan(what="")
empname
switch (empname,hong=250,lee=350,kim=200,kang=400)


x<-c(7,5,12,9,15,6)

var_sd<-function(x){
  var<-sum(x-mean(x) / 2)/(length(x)-1)
  sd<-sqrt(var)
  cat("표준분산:",var,"\n")
  cat("표본표준편차:",sd)
}
var_sd(x)

pytha<-function(s,t){
  a<-s^2-t^2
  b<-2*s*t
  c<-s^2+t^2
  cat("피타고라스 정리:3개의 변수:",a,b,c)
}

pytha(2,1)

gugu<-function(i,j){
  for(x in i){
    cat("**",x,"단**\n")
    for(y in j){
      cat(x,"*",y,"=",x*y,"\n")
    }
    cat("\n")
  }
}

i<-c(2:9)
j<-c(1:9)
gugu(i,j)

data <- c(10,20,5,4,40,7,NA,6,3,NA,2,NA)

na<-function(x){
  print(x)
  print(mean(x,na.rm = T))
  
  data = ifelse(!is.na(x),x,0)
  print(data)
  print(mean(data))
  
  data2 = ifelse(!is.na(x),x,round(mean(x,na.rm = TRUE),2))
  print(data2)
  print(mean(data2))
}

na(data)

coin<-function(n){
  r<-runif(n,min = 0,max =1)
  result <- numeric()
  for(i in 1:n){
    if(r[i]<=0.5)
      result[i] <- 0
    else
      result[i] <-1
  }
  return(result)
}

coin(10)

montaCoin<-function(n){
  cnt <- 0
  for(i in 1:n){
    cnt <- cnt+coin(1)
  }
  
  result <- cnt /n
  return(result)
}

montaCoin(10)
montaCoin(30)
montaCoin(10000)

library(RSADBE)
data("Bug_Metrics_Software")
Bug_Metrics_Software[,,1]

rowSums(Bug_Metrics_Software[,,1])
rowMeans(Bug_Metrics_Software[,,1])
colSums(Bug_Metrics_Software[,,1])
colMeans(Bug_Metrics_Software[,,1])

seq(-2,2,by=.2)
vec<-1:10
min(vec)
max(vec)
range(vec)
mean(vec)
median(vec)
sum(vec)
sd(rnorm(10))
table(vec)

n <- 1000
rnorm(n,mean = 0,sd=1)
hist(rnorm(n,mean = 0,sd=1))

n <- 1000
runif(n,min=0,max=10)
hist(runif(n,min=0,max = 10))

n <- 20

rbinom(n,1,prob = 1/2)
rbinom(n,2,0.5)
rbinom(n,10,0.5)

n <- 1000

rbinom(n,5,prob = 1/6)

rnorm(5,mean = 0,sd = 1)
set.seed(123)
rnorm(5,mean = 0,sd = 1)
set.seed(123)
rnorm(5,mean = 0,sd = 1)
set.seed(345)
rnorm(5,mean = 0,sd = 1)

vec <- 1:10
prod(vec)
factorial(5)
abs(-5)
sqrt(16)
vec
cumsum(vec)
log(10)
log10(10)

x <- matrix(1:9,nrow = 3,ncol = 3, byrow = T)
y <- matrix(1:3,nrow = 3)
ncol(x)
nrow(x)
t(x)
cbind(x,1:3)
