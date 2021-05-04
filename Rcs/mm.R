library(DBI)
library(rJava)
library(RJDBC)

install.packages("RMySQL")
library(RMySQL)

con<-dbConnect(MySQL(),user = "dda",password ="0258",
               dbname = "work", host = "localhost")

q<- "select * from goods"
db <- dbSendQuery(con,q)

data<-fetch(db,n=-1)
data

drv <- JDBC(driverClass = "com.mysql.cj.jdbc.Driver",
            "C:\\mariadb-java-client-2.7.1-sources.jar")
