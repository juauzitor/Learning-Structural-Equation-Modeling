### Librarys
library("readxl")
library("lavaan")
library("lavaanPlot")

# Loading data
dat <- read.csv("./data/raw/StructuralEquationModelingData.csv")

head(dat)

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

lavaanPlot(model = fit, node_options = list(shape = "box", fontname = "Helvetica"), edge_options = list(color = "grey"), coefs = FALSE)
