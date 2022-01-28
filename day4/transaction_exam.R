# 트랜잭션 패키지
--------------------------------------------------------------
install.packages('arules')
library(arules)

# 1. 트랜잭션파일 : 변동적인 파일
# 2. 마스터 파일 : 변하지 않는 주 파일
tran= read.transactions('train.txt',format='basket',sep=',')
tran
head(tran)
str(tran)
class(tran)

tran@data@i
inspect(tran)#내용보기
str(inspect(tran))

----------------------------------------------------------------------
rule=apriori(tran,parameter=list(supp=0.3,conf=0.1)) # 지지도가 30% rule이 18개
rule=apriori(tran,parameter=list(supp=0.8,conf=0.1)) # 지지도가 80% rule이 0개
str(rule)
inspect(rule) # 내용보기
----------------------------------------------------------------------
#넥타이(A), 셔츠(B) 신뢰도
#넥타이와 셔츠의 지지도/넥타이의 지지도

0.50/0.50=> 1
셔츠(B), 넥타이(B) 신뢰도
셔츠와 넥타이의 지지도/셔츠의 지지도 
0.50/0.75 => 0.6666
-----------------------------------------------------------------------
# Arules 시각화패키지

install.packages("arules")
library(arules)
library(arulesViz)
Arule.list <- as(tran,"transactions")
Arule.result <- apriori(Arule.list,parameter=list(supp=0.0001,confidence=0.0001))
plot(Arule.result,method="graph",control=list(type="items"))
-------------------------------------------------------------------------------
test <- subset(Arule.result, subset = rhs %in% "양말")
plot(test,method="graph",control=list(type="items")) 
--------------------------------------------------------------------------------

