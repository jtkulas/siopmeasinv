library(foreign)
library(careless)


masterdata <- read.spss("Dirty Dozon data for SIOP.sav")
DDdata <- data.frame(masterdata[c(1:3,34:45)])

psych::describe(DDdata)
table <- descr::freq(DDdata$selection)
dtable <- cbind(sample = rownames(table), table)

careless_long <- longstring(DDdata[4:15])
careless_irv <- irv(DDdata[4:15])

careless_long <- data.frame(careless_long)
careless_irv  <- data.frame(careless_irv)

DDdata <- cbind(DDdata, careless_long, careless_irv)

descr::freq(DDdata$careless_long)
descr::freq(DDdata$careless_irv)

use <- DDdata[ which(DDdata$careless_long<7), ]

library(lavaan)
library(semTools)

DD.model <-'mach   =~ A30 + A31 + A32 + A33
            narc   =~ A34 + A35 + A36 + A37
            psyc   =~ A38 + A39 + A40 + A41 '

measurementInvariance(model=DD.model, data=use, group="selection")
