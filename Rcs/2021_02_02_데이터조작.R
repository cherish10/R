install.packages("dplyr")
library(dplyr)
iris%>%head()
iris%>%head()%>%subset(Sepal.Length>=5.0)

install.packages(c("dplyr","hflights"))
library(dplyr)
library(hflights)
str(hflights)
hflights_df<-tbl_df(hflights)
hflights_df

filter(hflights_df,Month == 1 & DayofMonth ==2)
filter(hflights_df,Month ==1 | Month ==2)

install.packages("reshape2")
data<-read.csv("C:/Rcs/data.csv")
data()
library(reshape2)
wid<-dcast(data,Customer_ID ~ Date,sum)

data('airquality')
str(airquality)
names(airquality)<-toupper(names(airquality))
head(airquality)

air_melt <- melt(airquality,id=c("MONTH","DAY"),na.rm=TRUE)
head(air_melt)
names(air_melt)<-tolower(names(air_melt))
acast<-acast(air_melt,day~month~variable)
acast
class(acast)
acast(air_melt,month~variable,sum,margins=TRUE)


