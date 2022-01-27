# box plot(상자그림)
str(cars)
dist = cars[,2]
boxplot(dist, main= '자동차 제동거리')
boxplot.stats(dist)
install.packages('reshape2')
library(reshape2)
str(tips)


tt=subset(tips,tip<5)
summary(tt)
boxplot(tt$tip)

str(tt)
boxplot(tip~day,data=tt)

par(mfrow=c(2,2))
tmp=subset(tips,day=='Fri') # 토요일은 Sat 대입
boxplot(tip~size,data= tmp)
boxplot(tip~sex,data= tmp)
boxplot(tip~smoker,data= tmp)
boxplot(tip~time,data= tmp)
