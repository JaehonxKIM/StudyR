dir()
df=read.csv('C:/Sources/학습자료/CUST_ORDER_OUTPUT2.utf8.csv',header=TRUE)
str(df)
df=df[df$SEX != "*",]
head(df,10)

sex1= subset(df, select=c(ORDER_DATE,SEX,QTY)) #구매일자, 성별, 구매 건수만 추출해 별도의 데이터 만듦
sex1

str(sex1)  # 잘됨
table(sex1$SEX)   # 남,여,* 모두 있음.

-------------------------------------------------------------------------------
#lubridate 함수 구매일자에서 월 정보만 추출하기 위한 라이브러리
install.packages('lubridate')
library(lubridate)
sex2 =cbind(sex1, month=month(sex1$ORDER_DATE))
head(sex2,5)   # 잘됨



subset(sex2,ORDER_DATE == "female")
apply(sex2,2,mean)





install.packages('reshape2')
library(reshape2)
dcast(sex2, SEX ~ month,value.var="QTY",sum) 
------------------------------------------------------------------
#changeGender= function(x) { if (x[2] == "M") { return("male") } else { return("female") } }
# sex2$gender <- apply(sex2,2,changeGender)

sex2$gender=ifelse(sex2$SEX=='M', 'male','female')
head(sex2)
table(sex2$gender)


head(sex2)
library(ggplot2)

str(sex2)

sex2=subset(sex2,sex2$SEX!='*')
table(sex2$SEX)


# qplot(month,data=sex2,geom="bar",fill=gender)
qplot(month,data=sex2,geom="bar",fill=SEX)

ggplot(sex2,aes(month))+geom_bar()+facet_wrap(~gender)
ggplot(sex2,aes(month))+geom_bar()+facet_wrap(~SEX)
str(df)







