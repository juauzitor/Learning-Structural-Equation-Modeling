library(seminr)
library(semPlot)
library(ltm)

dat = read.csv("data/raw/SongEtAl.csv")

mydata = dat[,c(8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32)]

cronbach.alpha(mydata[,c(1,2,3,4)]) #PE

measurements <- constructs(
    composite("Performance expectancy",     multi_items("PE", 1:4)),
    composite("Effort expectancy",          multi_items("EE", 1:4)),
    composite("Social influence",           multi_items("SI", 1:3)),
    composite("facilitating conditions",    multi_items("FC", 1:4)),
    composite("Hedonic motivation",         multi_items("HM", 1:3)),
    composite("Habit ",                     multi_items("HA", 1:4)),
    composite("Behavioral intention",       multi_items("BI", 1:3))
)

structure <- relationships(
        paths(from = c("Performance expectancy", "Effort expectancy", "Social influence", 
                       "facilitating conditions", "Hedonic motivation", "Habit "
        ), 
        to = "Behavioral intention"
        )
)


pls_model <- estimate_pls(data = dat, measurements, structure)

#cbsem_model <- estimate_cbsem(data = dat, as.reflective(measurements))


model_sum = summary(pls_model, standardized = TRUE)
model_sum
model_sum$loadings
plot(pls_model, title = "PLS Model")
