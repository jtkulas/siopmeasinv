library(Hmisc)
library(careless)

data <- spss.get("TD-12 Research 2020 ADDITIONAL.sav")

write.csv(data, "SIOP.csv")

data$long <- longstring(data[2:13], avg = FALSE) ## then sort and screen

newdata <- data[ which(data$long < 9), ]

write.csv(newdata, "cleanedSIOP.csv")
