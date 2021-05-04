library(DBI)
library(rJava)
library(RJDBC)

Sys.setenv(JAVA_HOME = "C:/Program Files/Java/jdk-15.0.1")
drv <-JDBC("oracle.jdbc.driver.OracleDriver",
           "C:/oraclexe/app/oracle/product/11.2.0/server/jdbc/lib/ojdbc6_g.jar")

conn<-dbConnect(drv,
                "jdbc:oracle:thin:@//127.0.0.1:1521/xe","dda","0258")
query = "SELECT * FROM Customer"
dbGetQuery(conn,query)

query = "SELECT * FROM order_table"
dbGetQuery(conn,query)
query = "insert into order_table('customerID')"
dbSendQuery(conn,query)

query = "insert into order_items values('kang','pd522','sdfs',0208,25)"
dbSendUpdate(conn,query)

query = "insert into contacts values('hong','kildong','',052565,'hong')"
dbSendUpdate(conn,query)




