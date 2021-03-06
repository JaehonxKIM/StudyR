1. csv자료를 읽기 위해서 작업경로를 세팅
2. df = read.csv 명령어로 자료를 읽음(별도 옵션 없었기 때문에 가상상단은 제목, 문자는 factor로 읽음)
3. 데이터 샘플 확인(위로,아래로)
4. 데이터 구조를 확인(필드명, 성격 확인 등)
5. 기술 통계를 통해 데이터셋의 분포를 확인
  summary(df), summary(df[,c(1,3)] 등 일부데이터만 df[,c(3:12)]
6. NA값을 반드시 확인 (summary확인, is.na(df),table(is.na(df),barplot(table...))
7. 참고: 시각화도 가능
8. NA값을 처리
----------------------------------------------------------------------------------------------
9. 2018년도 자료가 3개, 2019가  12개 2020년도가 12개 나오나
summary(factor(df$연도))  or   table(df$연도)  or barplot(table(df$연도))
10. 1월,2월, 3월~12월 자료가 각 3개씩 나오나
