library(lavaan)
library(semPlot)
library(ltm)

dat = read.csv("data/raw/SongEtAl.csv")

cronbach.alpha(dat[,c(8,9,10,11)]) #PE
cronbach.alpha(dat[,c(12,13,14,15)]) # EE
cronbach.alpha(dat[,c(16,17,18)]) # SI
cronbach.alpha(dat[,c(19,20,21,22)]) # FC
cronbach.alpha(dat[,c(23,24,25)]) # HM
cronbach.alpha(dat[,c(26,27,28,29)]) # HA
cronbach.alpha(dat[,c(30,31,32)]) # BI

User1 = dat[dat$UsageExperience == '1', c(8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32)]
User2 = dat[dat$UsageExperience == '2', c(8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32)]

# Definir o modelo SEM
model <-   '
  BI =~ BI1 + BI2 + BI3
  BI ~ PE + EE + SI + FC + HM + HA
  PE =~ PE1 + PE2 + PE3 + PE4
  EE =~ EE1 + EE2 + EE3 + EE4
  SI =~ SI1 + SI2 + SI3
  FC =~ FC1 + FC2 + FC3 + FC4
  HM =~ HM1 + HM2 + HM3
  HA =~ HA1 + HA2 + HA3 + HA4
'

# Ajustando o modelo SEM
fit <- sem(model, data = User2)

summary(fit, standardized = TRUE)

# Plotando o modelo
plot <- semPaths(fit, "std", layout = "tree")

# Salvando o gráfico em formato PNG
ggsave("meu_modelo_SEM.png", plot)
