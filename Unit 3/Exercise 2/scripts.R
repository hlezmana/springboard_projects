
titanic3 <- read.csv("c:\\users\\hlesmana\\documents\\springboard_projects\\Unit 3\\EXercise 2\\titanic_original.csv")

titanic_tbl <- tbl_df(titanic3)

titanic_tbl %>% 
  mutate(embarked = ifelse(embarked == '', 'S', embarked)) %>% 
  mutate(age = ifelse(is.na(age), mean(age, na.rm=TRUE), age)) %>% 
  mutate(boat = ifelse(boat == '', 'None', boat)) %>%
  mutate(has_cabin_number = ifelse(cabin == '', 0, 1)) %>% 
  write.csv("c:\\users\\hlesmana\\documents\\springboard_projects\\Unit 3\\EXercise 2\\titanic_clean.csv")
