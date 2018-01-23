
setwd("C:\\Users\\hlesmana\\Documents\\springboard_projects\\capstone")

library(readr)

#housing data a
hus <- read_csv(".\\ss13husa.csv")
hus_tbl <- tbl_df(hus)

#housing data b
husb <- read_csv(".\\ss13husb.csv")
husb_tbl <- tbl_df(husb)

#population data a
pus <- read_csv(".\\ss13pusa.csv")
pus_tbl <- tbl_df(pus)

#population data b
pusb <- read_csv(".\\ss13pusb.csv")
pusb_tbl <- tbl_df(pusb)

#northeast data a
northeast <- hus_tbl %>%
  filter(REGION == 1) %>% 
  select(SERIALNO, REGION, ST, HINCP, HHT, FINCP, FES, VEH) %>% 
  left_join(pus_tbl, by=c("SERIALNO" = "SERIALNO"))

write_csv(northeast, ".\\northeast.csv")

#northeast data b
northeastb <- husb_tbl %>%
  filter(REGION == 1) %>% 
  select(SERIALNO, REGION, ST, HINCP, HHT, FINCP, FES, VEH) %>% 
  left_join(pusb_tbl, by=c("SERIALNO" = "SERIALNO"))

write_csv(northeastb, ".\\northeast_b.csv")

northeastb <- read_csv(".\\northeast_b.csv")

colnames(northeastb)

library(dplyr)
northeastb_clean <- northeastb %>% 
  select(-starts_with("pwgtp"))

write_csv(northeastb_clean, ".\\northeast_b.csv")

northeastb <- read_csv(".\\northeast_b.csv")

NorthEast_IncomeTravelTime <- northeastb_clean %>% 
  filter(is.na(HINCP) != TRUE & is.na(JWMNP) != TRUE) %>% 
  mutate(Income = as.numeric(HINCP)/10, TravelTime = as.numeric(JWMNP)/10, Age = as.numeric(AGEP), NoVehicles = VEH) %>% 
  mutate(IncomeRange = ifelse(Income <= 50000, 'less than 50k', ifelse(Income <= 100000, '50k to 100k', '100k and up')) )


NorthEast_IncomeTravelTime %>% 
  filter(Income >= 100000)
#library(ggplot2)

ggplot(data=NorthEast_IncomeTravelTime, aes(x=factor(NoVehicles), y=TravelTime)) +
  geom_bar(stat="identity")

ggplot(data=NorthEast_IncomeTravelTime, aes(x=factor(IncomeRange), y=TravelTime)) +
  geom_bar(stat="identity")


ggplot(data=NorthEast_IncomeTravelTime, aes(x=Income, y=TravelTime)) +
  geom_point(shape=2, size=2)

ggplot(data=NorthEast_IncomeTravelTime, aes(x=Age, y=TravelTime)) +
  geom_point(shape=1, size=2)


plot(NorthEast_IncomeTravelTime[c("Age", "TravelTime")])





