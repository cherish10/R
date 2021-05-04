install.packages("readxl")
install.packages("xlsx")

install.packages("rJava")
Sys.setenv(JAVA_HOME = "C:/Program Files/Java/jdk-15.0.1/bin")

library(rJava)
library(xlsx)

Titanic <-read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv")
Titanic

dim(Titanic)
str(Titanic)

table(Titanic$age)
table(Titanic$sex)
table(Titanic$survived)

head(Titanic)
tail(Titanic)
tab<-table(Titanic$survived,Titanic$sex)
tab

barplot(tab,col = rainbow(2),main = "성별에 따른 생존 여부")

setwd("C:/Rcs")
write.table(Titanic,"titanic.txt",row.names = FALSE)

Titanic_df <- read.table(file = "titanic.txt",sep = "",header = T)
Titanic_df


num<-scan()

num
sum(num)

name<-scan(what = character())
name

df=data.frame()
df=edit(df)
df

student1<-read.table(file.choose(),header = TRUE)

x<-10
y<-20
z<- x*y
cat("x*y의결과는",z,"입니다\n")
cat("x*y=",z)

print(z)
