library(Hmisc)
library(careless)

data <- spss.get("TD-12 Research 2020 ADDITIONAL.sav")

write.csv(data, "SIOP.csv")

table <- longstring(data[2:13], avg = FALSE) ## then sort and screen

