# setwd("파일경로")
# getwd("파일경로")

# df = read.csv("전국무인교통단속카메라표준데이터.csv")
filename = "파일명"
df = read.csv ("파일명") 
head(df)  # 위의 일부만 보여주기 
str(df)   # 문자로 보여주기
barplot(table(df$시도명)) # 막대그래프로 데이터 나타내기 

# subset() # 조건에 맞는 행과 추출하기
tmp= subset(df,시도명=='10')
head(subset(df,시도명=='10')) 
str(tmp)

## 01, 03, 10 ,9
## 시군구명이 과연 '서초구' 있나
tmp= subset(df,시도명=='9')
str(tmp)
#----------------------------
# 중복제거
summary(factor(tmp$시군구명))
table(tmp$소재지지번주소)
unique(tmp$소재지지번주소)
########################################
### 데이터 형 변환
### 1. character를  factor로 변환
### 시도명, 시군구명, 도로종류, 도로노선명
########################################
### 2. 숫자를 factor로 변환하는 파생변수
### 설치연도, 제한속도
########################################
df$시도명 = factor(df$시도명)
df[,3] = factor(df[,3])
df[,4] = factor(df[,4])
df[,6] = factor(df[,6])
str(df)
summary(df)
levels(df[,2])
df$시군구명 = factor(df$시군구명)


# 숫자를 factor로 변환하는 파생변수
df$설치연도Factor=factor(df$설치연도)
df[,25]=factor(df$제한속도)
str(df)

summary(df)
table(df[,24]) # 열 별로 데이터 셋
# str(df)  열 갯수 보여주기
# ncol(df) 열 갯수 보여주기
#############################################
## 복습용 p.176 매트릭스구조가 필요한 이유
#############################################

##############################################

# 

ma=df[,c(10:11)]
head(ma)
colSums(ma)
rowSums(ma)

###############################################
### 2. 컬럼명 정의
### names(df) 작업해서 인덱싱번호에다 컬럼명 변경
### names(df)= c('','')...
###############################################
names(df)[1] = '카메라Num'
names(df)[25] = '제한속도factor'
names(df)
names(df)[1]= paste(names(df)[1],'-bu',sep= '')
#### names(df)[1]+'bu' #연결연산자 #R은 문자열 연결을 +로 못함
# R에서의 문자열 합치기 OR 연결
 paste('e','k',sep= '')
# paste('e','k',sep= '조건')

#######################################################
###3. 필요한 컬럼만 모아서 별도의 데이터셋 제작
###첫번째: 불필요한 컬럼을 제거함으로써 수행속도 높임
###두번째: 분석하고자 하는 내용에 맞게끔 새로운 데이터프레임 구성
#######################################################
names(df)
df1= df[,c(1,3,5)]
str(df1)
######################################################
###4. 조건에 맞는 자료만 필터링해서 새로운 데이터셋 제작
####subset으로
######################################################
str(df1)
# 미션, 단속구분을 unique하게 받아봄
unique(df$단속구분)

# subset을 이용해서 단속구분이 1인 자료만 필터링 해보시오
subset(df1,df1$단속구분=='1')
# subset을 이용해서 제한속도가 50인 자료만 필터링
subset(df1,df1$제한속도== 50)
# subset을 이용해서 단속구분이 1 제외하고 필터링
subset(df1,df1$단속구분!= '1')
# 교재 179쪽 참조 (두개의 조건 모두 만족은 and연산(&) 두개중 한개만 만족해도 되면 or(!)
# subset을 이용해서 단속구분이 1이면서 (&)
# 시군구명이 '경기도'인 자료

시도.경기도 = subset(df1.시도명=='경기도')
table(df$시군구명)

########################################################
### 5.자료셋을 새로 제작해서 csv로 저장하기
###
########################################################

sido = unique(df1$시군구명)
cnt = length(sido)

for(index in 1:cnt){
tmp = subset(df1,시군구명==sido[index])
fileName=paste(sido[index],'.csv',sep ='')
write.csv(tmp,fileName)}
-----------------------------------------------------------
###############################################
 R 메모리 변수 모두 제거 
 rm(list= ls())
################## 데이터 로드 ################
df = read.csv("전국무인교통단속카메라표준데이터.csv", stringsAsFactors = TRUE)
str(df)
#df의 1~9번열만 df1 에 할당
df1 = df[,c(1:9)]
write.csv(df1,'작업자료.csv') ### 폴더에 데이터 파일 추가
dir()
rm(list=ls()) # 리스트 없애기
df= read.csv('작업자료.csv',stringsAsFactors= TRUE) #다시 데이터 불러오기
str(df)
df=df[,-1]
str(df)
names(df)[2]
summary(df[,2])
data.frame(빈도수=summary(df[,2]))
----------------------------------------------------------
기술통계
----------------------------------------------------------
############### na값 확인 ##################
sum(is.na(df))
colName=names(df)
 #cnt=length(colName)
for(i in 1:cnt){
print(colName[i])
print(sum(is.na(df[,i])))
}
-------------패키지-------------------------
install.packages('naniar') ### 결측치 시각화 패키지
library(naniar)
naniar::miss_case_summary(df)
naniar::miss_var_summary(df)
naniar::vis_miss(df)
naniar::gg_miss_var(df)#=================== 같음
naniar::gg_miss_var(df, show_pct = TRUE)#====
naniar::gg_miss_upset(df) # 최소 2개이상의 변수가 있어야 함
----------------------------------------------------
install.packages('VIM')
library(VIM)
VIM::aggr(df)

install.packages('Amelia') #결측값 처리 다중대치
library(Amelia)
missmap(df)
savePlot("무인카메라결측치",type='png')  # 클립보드 복사 명령어



complete.cases(df)
# 각 행별로 NA가 포함된 행인지 아닌지를 반환
# NA가 있을 경우 FALSE, NA가 없을 경우 TRUE로 is.na()와는 반대
sum(complete.cases(df))
# sum()함수를 통해 NA가 없는 행의 개수를 확인

sum(!complete.cases(df))
# 반대로 NA가 있는 행의 개수를 알고 싶다면 앞에 !를 붙인다

##### 패키지는 R 실행할때 한번만 실행됨 재시작할때는 다시 해야함 #####
--------------------------------------------------------------







