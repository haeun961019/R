#dplyr 패키지 : 데이터 프레임으로 관리되는 데이터에 대한 가공, 추출 등 다양한 작업을 할 수 있도록 지원되는 패키지

install.packages("dplyr")

#사용할 데이터를 읽어와 데이터 프레임으로 생성한다
exam <- read.csv("csv_exam.csv")
exam
View(exam)
head(exam)

############################
exam <- read.csv("csv_exam.csv")
exam
View(exam)

install.packages("dplyr")
library(dplyr)
#select : 지정된 특성만 가져오거나 제외해서 가져옵니다.
exam
#math 특성만 추출
exam %>% select(math)
#english 특성만 추출
exam %>% select(english)

#class, math, english 특성 추출
exam %>%  select(class, math, english)

#제외하고 가져오기
exam %>% select (-math)
exam %>% select (-math, -english)

#조합하기 : class가 1인 행만 추출한 다음 english 추출

exam %>% filter(class == 1) %>% select(english)

#math가 20보다 큰 학생들의 class와 math를 10개만 가져온다

exam %>% filter (math > 20) %>% select(class, math) %>% head(10)

#10개가 아니고 상위 10개라고 되어있을 경우에는 정렬 먼저 해준 후 head해주기

#정렬 arrange() / arrange(desc())
#arrange(특성) : 주어진 특성을 기준으로 오름차순 정렬
#arrange(desc(특성)) : 주어진 특성을 기준으로 내림차순 정렬
#arrange(특성1, 특성2) : 특성1을 기준으로 정렬한 후 특성1에서 값이 같은 것끼리 특성2를 기준으로 정렬합니다.

#class 기준 오름차순 정렬
exam %>% arrange(class)

#class 기준 내림차순 정렬
exam %>% arrange(desc(class))

#class 기준 내림차순, math 기준 오름차순
exam %>% arrange(desc(class), math)

#파생변수
#수학, 영어, 과학의 총점을 가지고 있는 파생변수를 추가한다
df1 <- exam %>% mutate(total=math + english + science)
df1

#파생변수를 두개 이상 추가하겠다면 쉼표로 구분하여 작성한다

df2 <- exam %>% mutate(total = math + english + science, avg = (math + english + science)/3)
df2                       

#조건에 의해 값을 구해서 추가할 때에는 ifelse 씁니다

df3 <- exam %>% mutate(test = ifelse(math>=60, "pass", "fail"))
df3

#통계량 값을 구해서 새로운 데이터프레임으로 생성
df4 <- exam %>% summarise(mean_math = mean(math))
df4

df5 <- exam %>% summarise(mean_math = mean(math), mean_english = mean(english))
df5

df6 <- exam %>% summarise(평균=mean(math), 표준편차=sd(math), 합계=sum(math), 중앙값=median(math), 최소값=min(math), 최대값=max(math), 빈도=n())
df6





#group_by : 지정된 특성에 저장되어 있는 값이 같은 것끼리 그룹으로 묶인 후 통계량을 구할 때 사용한다
df7 <- exam %>% group_by(class) %>% summarise(평균=mean(math), 표준편차=sd(math), 합계=sum(math), 중앙값=median(math), 최소값=min(math), 최대값=max(math), 빈도=n())
View(df7)
%>% group_by(manufacturer) 
mpg <- as.data.frame(ggplot2::mpg)
View(mpg)
#각 회사별 SUV자동차의 통합연비를 기준으로 내림차순 정렬하여 상위 5개를 가져온다
df8 <- mpg %>% filter(class == "suv") %>% mutate(tot = (cty+hwy)/2) %>% group_by(manufacturer) %>% summarise(mean_tot = mean(tot)) %>% arrange(desc(mean_tot)) %>% head(5) 
df8


df8 <- mpg %>% filter(class == "suv") #suv인 차량만 추출
            %>% mutate(tot = (cty+hwy)/2) #통합연비를 구함
            %>% group_by(manufacturer) #회사별 그룹핑
            %>% summarise(mean_tot = mean(tot)) #평균 연비를 구한다
            %>% arrange(desc(mean_tot)) #평균 연비를 기준으로 정렬
            %>% head(5) #상위 5개 가져온다
df8






