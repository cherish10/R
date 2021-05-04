library(DBI)
Sys.setenv(JAVA_HOME = "C:/Program Files/Java/jdk-15.0.1")
library(rJava)
library(RJDBC)

drr <- JDBC(driverClass = "com.mysql.cj.jdbc.Driver",
            "C:/Rcs/mysql-connector-java-8.0.23.jar")
conn <- dbConnect(drr,"jdbc:mysql://127.0.0.1:3306/work","dda","0258")

query =  "select * from goods"
goodsAll<- dbGetQuery(conn,query)
goodsAll

query = "select * from goods where su >=3"
goodsOne <- dbGetQuery(conn,query)
goodsOne

query = "SELECT * FROM goods order by dan desc"
dbGetQuery(conn,query)
insert.df<- data.frame(code=5,name = '식기세척기',su = 1,dan = 250000)
dbWriteTable(conn,"goods",insert.df)
dbWriteTable(conn,"goods1",insert.df)
query = "select * from goods1"
goodsAll<-dbGetQuery(conn,query)
goodsAll

recode<-read.csv("C:/Users/user/Desktop/Rcs/Rwork-2nd/Part-II/recode.csv")
dbWriteTable(conn,"goods2",recode)

query = "select * from goods2"
goodsAll<- dbGetQuery(conn,query)
goodsAll

guery = "insert into goods2 values(6,'test',1,1000)"
dbSendUpdate(conn,query)
query = "select * from goods2"
goodsAll<-dbGetQuery(conn,query)
goodsAll

dbDisconnect(conn)
