score <- c(80, 60, 70, 50, 90)

#data.frame()과 c()를 조합해서 표의 내용을 데이터 프레임으로 만들어 출력해보세요. 

#제품 가격 판매량
#사과 1800 24
#딸기 1500 38 
#수박 3000 13


product <- c('사과', '딸기', '수박')
price <- c(1800, 1500, 3000)
sales <- c(24, 38, 13)

df <- data.frame(product, price, sales)
View(df)

price_mean <- mean(df$price)
sales_mean <- mean(df$sales); 

df <- data.frame(product, price, sales, price_mean, sales_mean)