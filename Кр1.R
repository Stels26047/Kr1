# Установка пакетов для работы
install.packages('ggplot2')
install.packages('tidyverse')

#подключение библиотек ggplot2 и tidyverse
library(ggplot2)
library(tidyverse)


#подключение БД
table <- read.csv("RU_Electricity_Market_PZ_dayahead_price_volume.csv", header = TRUE, sep = ",")

# Посмотрим названия столбцов
names(table)

#Делаем авторегрессионный процесс
set.seed(49)
y <- arima.sim(n = nrow(table), table)
plot(y)


# Создаем график
ggplot(data = table)+
  geom_point(alpha = 1/2, mapping = aes(x= timestep, y = price_eur, color = consumption_eur))


ggplot(data = table)+
  geom_point(alpha = 1/4, mapping = aes(x= consumption_eur, y = price_eur))