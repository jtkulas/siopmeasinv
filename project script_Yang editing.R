library(foreign)
library(careless)

getwd()

masterdata <- read.spss("C://Users//yangy//Documents//Git//siopmeasinv//Dirty Dozon data for SIOP.sav")
DDdata <- data.frame(masterdata[c(1:3,34:46)])

careless_long <- longstring(DDdata[4:16])
careless_irv <- irv(DDdata[4:16])

careless_long <- data.frame(careless_long)
careless_irv  <- data.frame(careless_irv)

DDdata <- cbind(DDdata, careless_long, careless_irv)
