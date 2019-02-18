library(tidyverse)

#import CSV from OpenDataDC
raw_data <- read_csv("Certified_Business_Enterprise.csv")

#filter to just ward 8
sample_data <- raw_data %>%
  filter(WARD == 8)

#arrange the data alphabetically
sample_data_1 <- sample_data %>%
  arrange(BUSINESSNAME)

#just choose three columns
sample_data_2 <- sample_data_1 %>%
  select(BUSINESSNAME, PRINCIPALOWNER, DATEESTABLISHED)

#create a `year` column from the date column
sample_data_3 <- sample_data_2 %>%
  mutate(year = substr(DATEESTABLISHED, 1, 4))

#count how many businesses started by year
sample_data_4 <- sample_data_3 %>%
  group_by(year) %>%
  summarize(n()) %>%
  ungroup()

#export process CSV
write_csv(sample_data_4, "CBE_by_year.csv")