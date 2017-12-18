
toys <- read.csv("c:\\users\\hlesmana\\downloads\\refine_original.csv")
toys %>% 
  mutate(company = tolower(company)) %>%
  mutate(company = ifelse(company == 'phillips' | 
                company == 'fillips' |
                company == 'phllips' |
                company == 'phillps' |
                company == 'phlips', "philips",
                ifelse(company == 'akz0' | company == 'ak zo', 'akzo',
                       ifelse(company == 'unilver', 'unilever', company)))) %>%  
  separate("Product.code...number", c("product_code", "product_number"), sep="-", remove=FALSE) %>% 
  mutate(product_category = ifelse(product_code == 'p', 'Smartphone', 
                            ifelse(product_code == 'v', 'TV',
                            ifelse(product_code == 'x', 'Laptop',
                            ifelse(product_code == 'q', 'Tablet', product_code))))) %>%
  unite(address:country, col="full_address", sep=",", remove=FALSE) %>% 
  mutate(company_philips = ifelse(company == 'philips', 1, 0)) %>% 
  mutate(company_akzo = ifelse(company == 'akzo', 1, 0)) %>% 
  mutate(company_van_houten = ifelse(company == 'van houten', 1, 0)) %>% 
  mutate(company_unilever = ifelse(company == 'unilever', 1, 0)) %>% 
  mutate(product_smartphone = ifelse(product_category == 'Smartphone', 1, 0)) %>% 
  mutate(product_tv = ifelse(product_category == 'TV', 1, 0)) %>% 
  mutate(product_laptop = ifelse(product_category == 'Laptop', 1, 0)) %>% 
  mutate(product_tablet = ifelse(product_category == 'Tablet', 1, 0)) %>% 
  write.csv("c:\\users\\hlesmana\\downloads\\refine_clean.csv")

