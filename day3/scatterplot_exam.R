# 산점도 그래프 ==> 다중변수 데이터에서 두 변수에 포함된 값들을 점으로 표현해 분포를 관찰
tips

str(tips)
plot(tips) #서로서로 상관관계를 확인함
plot(tips[,1])
head((tips[,1]))
plot(tips[,1],tips[,2]) # 지불금액에 따른 팁의 상관관계
plot(tips[,7],tips[,1]) # 방문인원에 따른 지불금액의 상관관계

str(tips)
colNum=c(1,2,7)
par(mfrow=c(3,1))

for (i in colNum){
	plot(tips[,1],main=names(tips)[i])
}

mtcars
str(mtcars)
plot(mtcars)
plot(mtcars[,c(1,3,5,6)],main='Multi plots')
# 피어슨상관관계수(-1~1 사이값) 문자데이터 있을 시 오류
cor(mtcars[,c(1,3,5,6)]) 
# =============================================== 같은 값 나옴
#vars= c('mpg','disp','drat','wt')
#target=mtcars[,vars]
#plot(target, main='Multi plots')




