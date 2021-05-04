int <- 20
int
double<-20.0
double <-20.012
x <- int*double
b <- TRUE
ls()
is.numeric(double)
is.numeric(b)

x <- c(1,2,"3")
x
y<- x*3
y <- as.numeric(x)*3

x<- 5-3i

gender <- c("man","woman","woman","man","man")
plot(gender)

Ngender <-as.factor(gender)
is.factor(gender)
is.factor(Ngender)
table(Ngender)
table(gender)

plot(Ngender)

args(ggplot)


args(hist)

args(c)

args(factor)

Ogender<-factor(gender,levels = c("woman","man"),ordered = T)

Ogender

plot(Ngender)
plot(Ogender)

par(mfrow = c(1,2))
plot(Ngender)
plot(Ogender)

as.Date("21.01.21","%y.%m.%d")


