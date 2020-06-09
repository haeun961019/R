#ggplot2 : R에서 사용하는 데이터 시각화용 패키지
#비교적 사용하기 간단하고 다양한 그래프를 제공하고 있어서 가장 많이 사용함

install.packages("ggplot2")
library(ggplot2)

#산점도 : 두가지 특성을 이용해 점으로 표현한 그래프
#데이터의 분포를 확인하는 용도로 많이 사용함

#ggplot2::mpg 이거는 라이브러리 따로 안불러도 불러주는 경우에 / 이번에는 라이브러리 불러줬기 때문에 그냥 바로 data=mpg 써주어도 가능

#그래프의 배경을 설정정
ggplot(data = mpg, aes(x = displ, y = hwy))

#산점도를 그림
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

#데이터의 정확한 수치를 보려는 것이 아닌 '패턴'을 보려고 하는 것

#추가 옵션 설정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3, 6) + ylim(10, 30)

#막대그래프 : 데이터들을 막대로 표현한 그래프
#어떤 특성의 값을 그룹 별로 비교하기 위해 사용
#양을 비교하는 용도

library(dplyr)
#그래프를 그리기 위한 데이터 준비
df_mpg <- mpg %>% group_by(drv) %>% summarise(mean_hwy = mean(hwy))
df_mpg

#막대그래프를 그린다
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) +geom_col()

#막대그래프 순서 재정렬
ggplot(data = df_mpg, aes(x = reorder(drv, mean_hwy), y = mean_hwy)) +geom_col()
# reorder해주면 작은게 앞으로가고 큰게 뒤로갑니다

ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) +geom_col()
# y 에 - 붙여주면 큰게 앞으로가고 작은게 뒤로갑니다

#해당 특성에 저장되어 있는 값의 개수 비교하는 용도로 사용합니다
ggplot(data = mpg, aes(x = drv)) + geom_bar()
ggplot(data = mpg, aes(x = hwy)) + geom_bar()

#선 그래프 : 흐름에 따른 데이터 변화 추이를 보기 위해 사용
# 시계열 데이터 : 시간의 흐름에 따라 변화된 데이터

economics
View(economics)

ggplot(data = economics, aes(x=date, y=unemploy)) + geom_line()

#박스플롯 : 다수의 특성의 데이터 범위를 확안할 때 사용
ggplot(data = mpg, aes(x= drv, y= hwy)) + geom_boxplot()
