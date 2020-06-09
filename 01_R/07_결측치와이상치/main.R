#결측치 : 측정이 안된 데이터, 비어있는 데이터
#일부 함수에서 오류가 발생하거나 결과를 왜곡시킴
#결측치 비율이 매우 낮다면 제거한다
#확보 하던가 무언가로 채워줘야함

#이상치 : 정상 범주를 벗어나는 값
#결과를 왜곡시킨다
#이상치 비율이 매우 낮다면 제거한다. 그렇지 않다면 보정해야 한다

df1 <- data.frame(gender = c("M", "F", NA, "M", "F"), score = c(5, 4, 3, 4, NA))

df1

#결측치를 확인
is.na(df1)

#결측치 빈도수 확인
table(is.na(df1))

#각 특성별 결측치 빈도수 확인 - table은 해당 특성에서 값이 몇개나 있는지 알려줌
table(is.na(df1$gender))
table(is.na(df1$score))
#TRUE 개수가 결측치 값

#평균산출 :  R은 통계량 계산 시 결측치 있을 떄 결과는 NA이므로 큰 문제야.
mean(df1$score)
sum(df1$score)

#결측치 제거
 install.packages("dplyr")
library(dplyr)
 
#결측치가 있는 데이터를 가져온다
df2 <- df1 %>% filter(is.na(score))
df2 

#결측치가 없는 데이터만 모아 데이터프레임으로 반환한다
df3 <- df1 %>% filter(!is.na(score))
df3

#평균과 총합을 구한다
mean(df3$score)
sum(df3$score)

#모든 특성에 대해 결측치를 제거한다
df4 <- df1 %>% filter(!is.na(gender) & !is.na(score))
df4

df5 <- na.omit(df1)
df5

#통계량을 구할 때 결측치가 있다면 제외하고 통계량 계산이 가능하다.
mean(df1$score)
sum(df1$score)
#이상태로는 결측치가 있기 때문에 계산이 안돼 그래서
mean(df1$score, na.rm = T)
sum(df1$score, na.rm = T)
#R에서 제공하고 있는 기능이지만 다른통계분석 프로그램에서는 이거 없을 수 있으니까 제거하고 계산해주는 절차를 밟으세요다른건

df1 %>% summarise(mean_score = mean(score), sum_score = sum(score))
df1 %>% summarise(mean_score = mean(score, na.rm = T))
df1 %>% summarise(sum_score = sum(score, na.rm = T))

#결측치 부분에 다른 값으로 채워준 데이터 프레임을 생성
#성별이 결측치라면 A로 설정해준다. [남자 / 여자 / 외계인]

df1
df1$gender <- ifelse(is.na(df1$gender), "A", df1$gender)
df1$gender

#점수가 결측치라면 0으로 채워준다
df1$score <- ifelse(is.na(df1$score), 0, df1$score)
df1

#########################################################

#이상치를 가지고있는 데이터프레임 생성
df10 <- data.frame(gender = c("M", "F", "A", "M", "F"), age = c(20, 40, 20, 2713, 30))
df10

#성별과 같은 데이터는 table함수로 이상치를 확인한다
table(df10$gender)
#table 쓰면 어떤 데이터가 몇개 이런식으로 나오니까 M과 F만 나와야하는 상황에서 A가 나왔다는 것을 알 수 있어요 키, 몸무게, 나이 이런거는 값의 종류 개수가 너어어어어어무 많이 나오므로.. 이런 것들은 값의 범위를 봐주면 됩니다

#주로 카테고리 데이터는 요약통계 정보로 확인하시면 됩니다
#범위 데이터는
summary(df10)
summary(df10$age)

#결측치나 이상치 데이터 나오면 골치아파져요

#데이터 프레임 복제
df11 <- df10
df11

#성별에 있는 이상치 처리 (제거)
df12 <- df10 %>% filter(df10$gender %in% c("M", "F")) 
df12

#NA로 채워준다
df11$gender <- ifelse(df11$gender %in% c("M", "F"), df11$gender, NA)
df11

#나이에 있는 잇아치 처리 (제거) 나이는 100살까지 있다고 가정 하에
df13 <- df10 %>% filter(df10$age <=100)
df13

#NA로 채워준다
df14 <- df10
df14$age <- ifelse(df14$age <=100, df14$age, NA)
df14


# 다 NA로 채우겠다 하면 이상치 하고 결측치 하면 됩니다
# 이상치에 대해 NA로 채우겠다 이상치 먼저 하고 결측치하면돼
# NA가 아닌 다른 값으로 채우겟다 = 다른 값 구할 줄 알아야대니까 결측치 먼저 하고 이상치 처리
#제거하는건 순서 별로 사실 상관없어요
#제거가 아닌 뭔가 채워주겠다 하면 상황에 따라서 뭘 먼저 처리할 지 고민해
#결측치 자리에는 중간값이나 평균 넣는게 일반적이기 때문에 이상치를 먼저 처리해서 값들을 보정한 다음에 결측치 처리해주는거야
#쩨일 좋은건 데이터가 많은 것. 그러면 모든것이해결
#공공데이터가 짱!
