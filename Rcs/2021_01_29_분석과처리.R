chart_data <- c(305,450,320,460,660,480,380,520)
names(chart_data) <- c("2018 1분기","2019 1분기",
                       "2018 2분기","2019 2분기",
                       "2018 3분기","2019 3분기",
                       "2018 4분기","2019 4분기"
                       )
str(chart_data)
chart_data
barplot(chart_data, ylim = c(0,600),
        col = rainbow(8),
        main = "2018년도 vs 2019년도 매출현황 비교")
barplot(chart_data,xlim = c(0,600),horiz = T,
        ylab = "매출액(단위:만원)",
        xlab = "년도별 분기 현황",
        col = rainbow(8),
        main = "2018년도 vs 2019년도 매출현황 비교")
barplot(chart_data,xlim = c(0,600),horiz = T,
        ylab = "매출액(단위:만원)",
        xlab = "년도별 분기 현황",
        space = 1,cex.names=0.8,
        main = "2018년도 vs 2019년도 매출현황 비교",
        col = rep(c(2,4),4))
data(VADeaths)
VADeaths
str(VADeaths)
mode(VADeaths)

par(mfrow = c(1,2))
barplot(VADeaths, beside = T, col = rainbow(5),
        main = "미국 버지니아주 하위계층 사망비율")

legend(19,71,c("50-54","55-59","60-64","65-69","70-74"),
       cex = 0.8, fill = rainbow(5))

barplot(VADeaths,beside = F,col = rainbow(5))

title(main = "미국 버지니아주 하위계층 사망비율",font.main = 4)
legend(3.8,200,c("50-54","55-59","60-64","65-69","70-74"),
       cex = 0.8,fill = rainbow(5))

par(mfrow = c(1,1))
dotchart(chart_data, color = c("blue","red"),
         lcolor = "black",pch = 1:2,
         labels = names(chart_data),
         xlab = "매출액",
         main = "분기별 판매현황: 점차트 시각화",
         cex =1.2)
par(mfrow = c(1,1))
pie(chart_data,labels = names(chart_data),col = rainbow(8),cex = 1.2)
title("2018~2019년도 분기별 매출현황")

boxplot(VADeaths,range=0)
boxplot(VADeaths,range=0,noth=T)
abline(h=37,lty=3,col="red")
summary(VADeaths)

summary(iris$Sepal.Length)
hist(iris$Sepal.Length,xlab = "iris$Speal.Length",col = "magenta",
     main = "iris 꽃받침 길이 Histogram",xlim=c(4.3,7.9))
summary(iris$Sepal.Width)
hist(iris$Sepal.Width,xlab = "iris$Speal.Width",col = "mistyrose",
     main = "iris 꽃받침 너비 Histogram",xlim=c(2.0,4.5))

library(UsingR)
data(galton)
galtonData<-as.data.frame(table(galton$child,galton$parent))
head(galtonData)
names(galtonData)=c("child","parent","freq")
head(galtonData)
parent<-as.numeric(galtonData$parent)
child<-as.numeric(galtonData$child)

plot(parent,child,
     pch=21,col="blue",bg="green",
     cex =0.2*galtonData$freq,
     xlab = "parent",ylab = "child")

