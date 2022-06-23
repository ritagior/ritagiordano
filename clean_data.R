## cleand world fertility rate for flourish
library(tidyverse)
library(readxl)
data <- read_excel("../../DataViz_TheGuardian/Fertility Rate Data.xlsx")
fertility <- data %>%
  filter(!is.na(`2019`)) %>%
  select(`Country Name`, Region, IncomeGroup, `2019`)

write_csv(fertility, "data/fertility_2019.csv")
