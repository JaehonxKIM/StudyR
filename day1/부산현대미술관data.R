#콘솔창에 커서를 두고 
파일-작업디렉토리 변경
dir() #파이썬의 os.listdir 또는 glob
df=read.csv('파일경로')
str(df)
head(df)
names(df)
read.csv('파일경로') # 파일 읽기

# 연도만 출력
str(df) 
df[,1]#df$연도 #연도만 표시
min(df[,1]) # 최소값만 표시
max(df[,1]) # 최대값만 표시
str(df)
df[,c(1,3)]  # 1,3열만 보는 방법
df[1:12,-3] # 15개 중 위에서 12개만 보는 방법
head(데이터, 보기 원하는 개수)
tail(데이터, 보기 원하는 개수) # 밑에서 몇개만 보는 방법
df[25:36,] # 25열에서 36열까지 보는 방법 tail과 다름

df



#구글링 , R에서 NA(결측치)값 0으로
barplot()  ## 막대그래프로 보여줌
summary(df)
par(mfrow=c(3,1)) 
# par(mfrow=c(1,1))
index = 1 
barplot(table(is.na(df[index])),main=names(df)[index])
index = 2
barplot(table(is.na(df[2])),main=names(df)[index])
index = 3
barplot(table(is.na(df[3])),main=names(df)[3]) 
------------------------------------------------------
df[is.na(df)] = 0 #na값 0으로 대체
-------------------------------------------------------
plot(cars, main = "들어갈 내용") ==> 그래프에  제목달기


 