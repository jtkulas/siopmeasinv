library(Hmisc)

data <- spss.get("TD-12 Research 2020 ADDITIONAL.sav")

write.csv(data, "SIOP.csv")
