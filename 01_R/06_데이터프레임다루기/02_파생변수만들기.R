#파생변수 : 데이터 프레임이 관리하는 데이터들을 가지고 계산한 값을 같은 데이터 프레임에 붙힐 때 사용

df1 <- data.frame( var1 = c(4, 3, 8), var2 = c(2, 6, 1))
df1
#df1 프레임 안에  var1 라는 변수의 값들
df1$var1
#df1 프레임 안에  var2 라는 변수의 값들
df1$var2

df1$var1 + df1$var2
df1$total <- df1$var1 + df1$var2
df1

df1$avg <- df1$total / 2
df1


##mpg 데이터 활용
mpg <- as.data.frame(ggplot2::mpg)
mpg

#~상황에서의 연비 
mpg$cty
mpg$hwy

View(mpg)
#통합연비 cty와 hwy 더하고 나누기 2

mpg$total <- (mpg$cty + mpg$hwy)/2

#조건을 주고 계산하 값을 파생변수로 추가합니다
#통합연비가 20이상이면 "pass", 아니면 "fail"
summary(mpg$total)
#조건에 만족하면 두번째 값, 만족하지 않으면 세번째 값이 결과가 된다
mpg$test <- ifelse(mpg$total >= 20, "PASS", "FAIL")
View(mpg)

mpg
#만약 PASS와 FAIL의 빈도를 확인해야 한다면 
#table은 지정된 특성 내에 저장된 값들의 개수를 파악해줌

table(mpg$test)
table(mpg$model)

#빈도수 그래프 그리기 (양 비교 : 막대그래프)
install.packages("ggplot2")
library(ggplot2)
qplot(mpg$test)
qplot(mpg$total)

#[예제] mpg$total값이 30 이상이면 "A", 20이상이면 "B", 그렇지 않으면 "C"로 하여 grade라는 파생변수를 생성


mpg$grade <- ifelse(mpg$total>=30, "A", 
                                        ifelse(mpg$total >= 20, "B", "C"))
                    
View(mpg)

#filter : 원하는 조건에 만족하는 로우만 가져온다
library(dplyr)
#class 가 1인 로우 추출
exam %>% filter ( class == 1)
exam %>% filter (class ==2)
exam %>% filter (class != 3)

#수학 점수가 50점 초과인 경우
exam %>% filter (math >50)

#& : 모든 조건을 만족 and
#| : 조건 중 하나만 만족 or

#class가 1 이면서 수학점수가 50점 이상인 경우
exam %>% filter (class == 1 & math >=50)
#class가 2 이면서 영어점수가 80점 이상인 경우
exam %>% filter (class == 2 & english >=80)
#수학점수가 90점 이상이거나 영어 점수가 90점 이상인 경우
exam %>% filter (math >=90 | english >=90)
#영어점수가 90점 미만이거나 과학점수가 50점 미만인 경우
exam %>% filter ( english < 90 | science <50)

#1반, 3반, 5반 학생들의 정보 가져온다
exam %>% filter (class == 1 | class == 3 | class == 5)

exam %>% filter (class %in% c(1, 3, 5))

#가독성이 좋은 코드가 제일 좋은 코드임 너무 압축하거나 너무 풀어쓰지말고 보기좋고 쓰기 좋은거로 쓰세요

#dplyr 패키지를 이용해 추출한 데이터들은 새로운 데이터 프레임으로 생성되어 반환된다

class1 <- exam %>% filter (class == 1)
class2 <- exam %>% filter (class ==2)

mean(class1$math)
mean(class2$math)
