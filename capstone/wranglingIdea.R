
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



