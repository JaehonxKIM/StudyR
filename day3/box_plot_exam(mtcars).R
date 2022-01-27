str(mtcars)
par(mfrow=c(2,1))
boxplot(mtcars$mpg~mtcars$am)
plot(mtcars$mpg,mtcars$am)
cor(mtcars$mpg,mtcars$am) #피어슨 상관계수 구하기

boxplot(mtcars)
tmp=scale(mtcars)
summary(tmp)
boxplot(tmp)
