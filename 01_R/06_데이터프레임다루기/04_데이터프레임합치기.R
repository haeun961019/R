#데이터 프레임 생성
df1 <- data.frame(id=c(1, 2, 3, 4, 5), value(60, 80, 70, 90, 85))
df2 <- data.frame(id=c(1, 2, 3, 4, 5), value2(70, 83, 65, 95, 80))

df3 <- left_join(df1, df2, by= "id")
df3

#id 값이 다르게 되어 있는 데이터 프레임 합치기
df4 <-  data.frame(id = c(1, 2, 3, 4, 6), value = c(60, 80, 70, 90, 85))
df5 <- data.frame(id = c(1, 2, 3, 4, 7), value2 = c(70, 83, 65, 95, 80))

df6 <- left_join(df4, df5, by = "id")

df6

#NA 는 결측치입니다 두 개의 데이터가 합쳐지긴 하지만 ID가 매칭이 안되므로 NA가 됩니다

#기준이 되는  특성의 개수가 맞지 않을 경우
df7 <-  data.frame(id = c(1, 2, 3, 4, 5), value = c(60, 80, 70, 90, 85))
df8 <- data.frame(id = c(1, 2, 3, 4), value2 = c(70, 83, 65, 95))

df9 <- left_join(df7, df8, by = "id")
df9

#행 합치기(위아래러)

df10 <- data.frame(id = c(1, 2, 3, 4, 5), value = c(10, 20, 30, 40, 50))
df11 <- data.frame(id = c(6, 7, 8, 9, 10), value = c(60, 70, 80, 90, 100))

df12 <- bind_rows(df10, df11)
df12

#행의 이름이 다를 경우
df13 <- data.frame(id = c(1, 2, 3, 4, 5), value = c(10, 20, 30, 40, 50))
df14 <- data.frame(id = c(6, 7, 8, 9, 10), value2 = c(60, 70, 80, 90, 100))

df15 <- bind_rows(df13, df14)
df15
