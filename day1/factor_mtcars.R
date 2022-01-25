# 리스트 팩터 정리

R에는 내장데이터를 많이 제공한다 
자동차 연비와 관련된 mtcars
mtcars	# read 없는 자료는 내장자료	
str(mtcars) 
head(mtcars,3)
summary(mtcars)
# 제목이 빈칸 = 인덱스 열

plot(mtcars$cyl)
plot(mtcars$vs)
plot(mtcars$mpg)
summary(factor(mtcars$cyl))
names(summary(factor(mtcars$cyl))) #위에 있는 제목을 가져오기
levels(factor(mtcars$cyl)) #위에 있는 제목을 가져오기
unique(mtcars$cyl) #맨 위에 있는 데이터부터 중복제거 


tmp =summary(factor(mtcars$cyl))
tmp
names(tmp)=c('cyl:4','cyl:6','cyl:8')
str(tmp)
tmp[3]

### split(자료,기준)작업하면 리스트화 됨
split(mtcars,mtcars$cyl)
tmp=split(mtcars,mtcars$cyl)
str(tmp)
tmp[[1]]
split(tmp[[1]],tmp[[1]]$am)
