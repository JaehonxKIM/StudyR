##cowsay함수
install.packages('cowsay')
library('cowsay')
say('hello,world',by= 'cat')


## 데이터 재구조화
##reshape패키지 함수

install.packages('reshape2')
library('reshape2')
#-------------------------------
# 자료파악: 변수의 성격과 해설
# total_bill: 전체지불비용
# tip: 팁 가격
# sex: 성별
# day: 요일
# smoker: 흡연석/비흡연석
# time: 방문시간
# size : 방문인원
#--------------------------------
head(tips)
str(tips)
unique(tips$day)
table(tips$day)

sum(is.na(tips))
unique(tips[,3])
---------------------------------
###############################################
###### 가설과 검증
######
###############################################
# 1번가설: 성별에 따르는 tips의 비용은 같다
#		0가설(귀무가설)
#		검증을 통해서 비용은 같다=> 귀무가설 선택
#		비용이 다르다=> 귀무가설 기각/대립가설 선택
#		pvalue 통해서 확인함.(통계에서는)
# 일반적인 가설검증은 데이터집계를 통해서 비교

str(tips)
table(tips[,3]) # 성별의 빈도수, 전체데이터에서 발생횟수
table(tips[,4]) # 흡연석의 빈도수
table(tips[,5]) # 요일
table(tips[,6]) # 방문시간
table(tips[,7]) # 방문인원


for(i in c(3:7)){
	print(paste('----',names(tips)[i],'----'))
 	print(table(tips[,i]))
}

dinner = subset(tips,time=='Dinner')
lunch = subset(tips,time=='Lunch')
table(dinner$day)
table(lunch$day)

table(tips$time)
table(din$day)
table(lun$day)
head(din)

colSums(din[c('total_bill','tip','size')])  # 열의 합계
colSums(lun[c('total_bill','tip','size')])

colMeans(din[c('total_bill','tip','size')]) # 열의 평균값
colMeans(lun[c('total_bill','tip','size')])

par(mfrow=c(2,1)) # ==> 여러 개의 그래프 같이 표시하기 
                  # par(mfrow=c(행의 갯수, 열의 갯수)
plot(din$tip)
plot(lun$tip)

summary(lun)
tmp= subset(lun, tip>=4)  # 임시파일 만들기
summary(tmp)

summary(lun)
summary(subset(tips,tips$day== 'Fri'))
table(tmp$size)
###미션------------------------------
# 성별별 빈도수 확인
table(tips[,3])
s.F = subset(tips,sex=='Female')
s.M = subset(tips,sex=='Male')
summary(s.F)
summary(s.M)

par(mfrow=c(2,1))
plot(s.F$tip,main=' F sum - Tips')
plot(s.M$tip,main=' M sum - Tips')

s.F
par(mfrow=c(2,1))
plot(s.F$size,main= 'F sum - Tips')
plot(s.M$size,main= 'M sum - Tips')

# 결론::방문인원에 따른 팁 규모는 비례한다 
# 결론::남녀 팁의 규모가 나는 이유는 남자가 여자보다 방문인원이 더 많다.