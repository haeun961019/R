#데이터 프레임 : 행렬구조로 되어있는 데이터 관리 단위
#데이터 저장뿐만 아니라 데이터 가공, 추가 등 다양한 처리가 가능하고 데이터 시각화도 처리할 수 있다.

#데이터 프레임 생성
 eng <- c(90, 80, 70, 60)
 math <- c(50, 60, 70, 80) 

 #변수의 이름이 데이터 프레임의 특성 이름이 된다!
df1<- data.frame(eng, math) 
df1


class <- c(1, 1, 2, 2)
df2 <- data.frame(eng, math, class)
df2

age <- c(16,17,15, 18)
df3 = data.frame(eng, math, class, age)
df3

#다른 벡터들과 개수가 맞지 않는 것이 있으면 오류가 발생합니다



#특성 데이터를 가져온다. 특성 하나의 데이터가 벡터로 반환한다.
df1$eng
df1$math

#직접 지정
df4 <- data.frame(a1 = eng, a2 = math, a3 = class)
df4
df4 <- data.frame("영어"=eng, "수학"=math, "반"=class)
df4

install.packages("readxl")

##########################################################################

# 엑셀 파일을 통해 데이터프레임 생성하기
 library(readxl)
qplot(x)
library(ggplot2)
qplot(x)
library(readxl)

#엑셀 파일에서 데이터를 읽어온다 (sheet 1개짜리)
df5 <- read_excel("excel_exam.xlsx")
df5

df5$english
df5$math
df5$id
df5$science

#특성 이름이 없는 엑셀 파일

df6 <- read_excel("excel_exam_novar.xlsx")
df6
#데이터프레임의 특성이 숫자로되어있으니까 잘못되었다
#엑셀 파일에서 데이터를 읽어오면 첫번째 줄은 특성의 이름으로 취급합니다
#만약 첫 줄부터 데이터라면  col_names 에 F를 넣어준다

df7<-read_excel("excel_exam_novar.xlsx", col_names = F)
df7

#데이터 프레임 시트 여러개

#엑셀 파일을 이용해 데이터 프레임 생성 시 시트 번호를 지정하지 않으면 첫 번째 시트를 가지고 만드네요 시트 번호를 저장해야 한다면 sheet에 시트 번호(1번 부터)를 지정해줍니다

df8 <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df8

################################3
#csv파일 : 데이터를 쉼표(,)로 구분하는 양식
#데이터의 총양이 적다는 장정ㅁ을 가지고 있다


df9 <- read.csv("csv_exam.csv")
df9

#Rdata파일 : R전용 데이터 양식
#데이터 프레임을 저장할 때 데이터 프레임을 가지고 있던 변수 명까지 같이 저장된다
# rm()은 변수 제거 하는 거
save(df9, file = "df9_rdata.rda")

#df9를 제거합니다.
rm(df9)
df9


load("df9_rdata.rda")
df9

#파일을 저장했을 때 사용한 변수 이름인 df9라는 변수가 자동으로 만들어지고 거기에 데이터 프렘임이 담긴다