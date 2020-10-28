library(Hmisc)
library(careless)

data <- spss.get("TD-12 Research 2020 ADDITIONAL.sav")

write.csv(data, "SIOP.csv")

data$long <- longstring(data[2:13], avg = FALSE) ## then sort and screen

newdata <- data[ which(data$long < 9), ]

write.csv(newdata, "cleanedSIOP.csv")

## Tutorial on MI in R here: https://www.frontiersin.org/articles/10.3389/fpsyg.2019.01507/full

data$group[data$long < 3 ] <- "Low Stakes"   ## temporary placeholder for real groups
data$group[data$long >= 3 ] <- "High Stakes"
data$group <- as.factor(data$group)


library(lavaan)   ## CFAs
data2 <- data[,c(2:13,15)]    ## getting rid of non-group/non-items

model <- '  mach   =~ R30 + R31 + R32 + R33
            narc   =~ R34 + R35 + R36 + R37
            psyc   =~ R38 + R39 + R40 + R41 '

fit <- cfa(model, 
           data = data2, 
           group = "group")
summary(fit)

## MI below: https://www.rdocumentation.org/packages/semTools/versions/0.5-1/topics/measEq.syntax

## Another resource: https://jslefche.github.io/sem_book/multigroup-analysis.html

library(semPlot)
layout(t(1:2))
semPaths(fit,what="std",layout="tree")



library(semTools)
MI <- measEq.syntax(model, 
              data = data2, 
              group = "group")
summary(MI)
