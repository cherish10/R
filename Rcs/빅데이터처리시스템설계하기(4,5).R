install.packages("reshape2")
library(reshape2)
data("iris")
str(iris)

iris_melt<- melt(iris,id=("Species"),na.rm = TRUE)
head(iris_melt)

iris_dcast<-dcast(iris_melt,Species ~ variable,sum)
iris_dcast

install.packages("dplyr")
library(dplyr)

iris

ir<- iris %>% filter(Petal.Length >= 1.5)
ir
ir2 <- ir %>% select(Sepal.Length,Petal.Length,Species)
ir2
ir3 <-ir2 %>% mutate(diff = Sepal.Length - Petal.Length)%>%head()
ir3
irr<-ir3 %>% group_by(Species) %>% summarise(Sepal = mean(Sepal.Length),
                                             petal = mean(Petal.Length))
irr
