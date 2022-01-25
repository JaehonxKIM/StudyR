# factor 예제

직업명 = c('데이터 과학자', '엔지니어', '엔지니어', '세금관리자', '분석관리자')
채용수 = c(4184, 2775, 2599, 3317, 1958)
평균급여 = c(110, 110, 106, 110, 112)
만족도 = c(4.4, 4.0, 4.3, 4.0, 4.1)
평가점수 = c(4.8, 4.7, 4.7, 4.7, 4.6)

str(직업명)
summary(직업명)

str(채용수)
summary(채용수)

str(만족도)
summary(만족도)

str(평가점수)
summary(평가점수)

직업명fa = as.factor(직업명)
summary(직업명fa)
# pie(직업명fa)

data = data.frame(직업명, 채용수, 평균급여, 만족도)

summary(data)
plot(data)

# strsplit(변수/글자를 나눌 기준)
a= c('파이썬-20,데이터분석가,인공지능-20','R,데이터분석가,빅데이터')
tmp = strsplit(a,',')
tmp
summary(tmp)
tmp1 = unlist(tmp)
tmp1
tmp2 = as.factor(tmp1)
summary(tmp2)

# plot(a) # 에러


# factor형은 strsplit안 됨
b = as.factor(a)
strsplit(b"/") #에러 뜸






#예제 
bt = c('A','B','B','0','AB','A') # 문자형 벡터 bt 정의
bt.new = factor(bt)       	    # 팩터 bt.new 정의
bt 	  	                # 벡터 bt의 내용 출력
bt.new                                # 팩터 bt.new의 내용 출력
bt[5]   			   # 벡터 bt의 5번째 값 출력     
bt.new[5]			   # 팩터 bt.new의 5번째 값 출력                        
levels(bt.new)                       # 팩터에 저장된 값의 종류를 출력
as.integer(bt.new)                  # 팩터의 문자값을 숫자로 바꾸어 출력
bt.new[7] = 'B'                      # 팩터 bt.new의 7번째에 'B'지정
bt.new[8] = 'C' 	                # 팩터 bt.new의 8번째에 'C'지정
bt.new			   # 팩터 bt.new의 내용 출력
# **팩터는 사전에 정의된 값 외에 다른 값들은 입력을 못한다.



 