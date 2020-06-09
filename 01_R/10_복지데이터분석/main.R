# 한국복지패널 데이터 분석

#라이브러리 셋팅 
install.packages("foreign")
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

#데이터 불러오기 
row_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", to.data.frame = T)

View(row_welfare)
# 복사본을 생성한다. 

welfare <- row_welfare

# 행의 수와 특성의 수를 파악한다. 
dim(welfare)
str(welfare)

# 통계 요약 정보
summary(welfare)

View(welfare)


# 사용하고자 하는 특성의 데이터의 이름을 변경

welfare <- rename(welfare, gender = h10_g3, 
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)


welfare$gender
welfare$birth
welfare$marriage
welfare$religion
welfare$income
welfare$code_job
welfare$code_region


###################################


#성별에 따른 급여#################


################################


# 성별 특성의 타입 

class(welfare$gender)

# 성별 특성의 값 분포

table(welfare$gender)

#결측치 확인 

table(is.na(welfare$gender))

# 이상치 결측 처리
welfare$gender <- ifelse(welfare$gender ==9, NA, welfare$gender)

# 결측치 다시 확인

table(is.na(welfare$gender))

# 성별 데이터 변경
welfare$gender <- ifelse(welfare$gender ==1,"mail","female")


table(welfare$gender)

qplot(welfare$gender)




#급여 특성의 타입

class(welfare$income)

# 통계 요약 정보 확인

summary(welfare$income)

#결측치 확인

table(is.na(welfare$income))

#이상치가 확인되었기 때문에 이상치를 결측치로 변경한다. 

welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$incom)


#결측치 확인
table(is.na(welfare$income))

#데이터 프레임에서 결측치가 없는 로우를 제거하고 가져온다. 


gender_income <- welfare %>%       #전체 데이터를 가져온다.
  filter(!is.na(income)) %>%          #수입이 결측치가 아닌 로우만 추출
  group_by(gender) %>%                #  성별을 기준으로 그룹으로 묶는다. 
  summarise(mean_income =mean(income))                #  각각 그룹에서 수입의 평균을 구한다. 

gender_income

ggplot(data = gender_income, aes(x = gender, y = mean_income)) + geom_col()

#결론 :남성이 여성보다 급여가 많다 




###########################################

#나이와 월급의 관계 

# 생년 /나이 특성의 타입

class(welfare$birth)

# 통계 요약 정보- 최대 최소값을 통해 이상치 존재 여부
summary(welfare$birth)

#결측치 존재 여부
table(is.na(welfare$birth))
qplot(welfare$birth)

# 나이를 구해서 추가


welfare$age <- 2015 - welfare$birth +1
summary(welfare$age)

#통계량을 가지고 있는 데이터 프레임을 생성

age_income <- welfare %>%    #전체 데이터를 가져옴
  filter(!is.na(income))%>%     # 수입이 결측치가 아닌 것만
  group_by(age) %>%           # 나이로 그룹화
  summarise(mean_income = mean(income))  # 급여 평균 구함

age_income

ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()


# 40~50대 후반까지 수입이 가장 많다. 


##################################################

#나이대별 급여 수준


#1~19세 미성년



# 20~35 청년




# 36~45세 장년



# 46세~ 60세 중년


# 나이대별 특성을 추가한다. 

welfare <- welfare %>%
  mutate(ageg= ifelse(age <= 19, "미성년",
                      ifelse(age <= 35, "청년", 
                             ifelse(age <= 45, "중년", 
                                    
                                    ifelse(age <= 60, "장년","노년")))))


table(welfare$ageg)
qplot(welfare$ageg)

# 통계량을 가지고 있는 데이터 프레임을 생성한다
ageg_income <- welfare %>% filter(!is.na(income)) %>% group_by(ageg) %>% summarise(mean_income = mean(income))

ageg_income

ggplot(data = ageg_income, aes(x=ageg, y = mean_income)) + geom_col()
