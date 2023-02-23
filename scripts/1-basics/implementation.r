# This code is a replication of code in https://towardsdatascience.com/structural-equation-modeling-dca298798f4d

### Librarys
library("readxl")
library("lavaan")
library("lavaanPlot")

# Loading data
dat <- read.csv("./data/raw/StructuralEquationModelingData.csv")

head(dat)

### Joos Korstanje Code ###

model <- '
  # measurement model
    JobPerf =~ ClientSat + SuperSat + ProjCompl
    Social =~ PsychTest1 + PsychTest2
    Intellect =~ YrsEdu + IQ
    Motivation =~ HrsTrn + HrsWrk
  # regressions
    JobPerf ~ Social + Intellect + Motivation
'

fit <- sem(model, data = dat)
summary(fit, standardized = TRUE)

### END ###


lavaanPlot(model = fit, node_options = list(shape = "box", fontname = "Helvetica"), edge_options = list(color = "grey"), coefs = FALSE)
