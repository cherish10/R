install.packages("rJava")
install.packages("DBI")
install.packages("RJDBC")
library(DBI)
Sys.setenv(JAVA_HOME = "C:/Program Files/Java/jdk-15.0.1")
library(rJava)
library(RJDBC)
drv <-JDBC("oracle.jdbc.driver.OracleDriver",
           "C:/oraclexe/app/oracle/product/11.2.0/server/jdbc/lib/ojdbc6_g.jar")

conn<-dbConnect(drv,
                "jdbc:oracle:thin:@//127.0.0.1:1521/xe","dda","0258")
query = "SELECT * FROM test_table"
dbGetQuery(conn,query)
query = "SELECT * FROM test_table order by age desc"
dbGetQuery(conn,query)

query = "insert into test_table values('lee','1234','강감찬',25)"
dbSendUpdate(conn,query)
query = "insert into test_table values('park','4564','박이리',33)"
dbSendUpdate(conn,query)
query = "insert into test_table values('kee','7895','기미리',41)"
dbSendUpdate(conn,query)
query = "insert into test_table values('yoon','4561','윤가나',32)"
dbSendUpdate(conn,query)
query = "insert into test_table values('lee','7859','이순신',46)"
dbSendUpdate(conn,query)
query = "insert into test_table values('kang','1265','강마음',47)"
dbSendUpdate(conn,query)
query = "insert into test_table values('ha','7512','하늘보',36)"
dbSendUpdate(conn,query)
query = "insert into test_table values('bae','9654','배고파',38)"
dbSendUpdate(conn,query)

query<-"delete from test_table where name = '김길동'"
dbSendUpdate(conn,query)
query = "SELECT * FROM test_table"
dbGetQuery(conn,query)

query ="select * from test_table where age >= 40"
result<-dbGetQuery(conn,query)
result

query ="insert into test_table values('as','6666','dkdk',34)"
dbSendUpdate(conn,query)
query = "SELECT * FROM test_table order by id desc"
dbGetQuery(conn,query)

query = "update test_table set age = 30 where name ='강감찬'"
dbSendUpdate(conn,query)

query = "select * from test_table where name ='강감찬'"
dbGetQuery(conn,query)

query = "SELECT * FROM test_table"
dbGetQuery(conn,query)

query = "delect from test_table where name = 'dkdk'"
dbSendUpdate(conn,query)
