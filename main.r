### Librarys
library("readxl")

# Loading data
dat <- read_excel("./data/raw/sample.xlsx")

clean <- dat[c(
            10,11,12,13,14,15,16,
            17,18,19,20,21,22,23,
            24,25,26,27,28,29,30,
            31,32,33,34,35,36,37,
            38,39,40,41,42,43,44,
            45,46,47,48,49,50,51,
            52,53
            )]

table(dat$gender)
table(dat$age)
table(dat$bususefrequency)
nomissing=na.omit(dat)

subsetn = data.frame(subset(dat, c(
                                BT1,BT2,BT3,BT4,BT5,BT6,BT7,
                                BD1,BD2,BD3,BD4,
                                BCM1,BCM2,BCM3,BCM4,
                                BTER1,BTER2,BTER3,BTER4,BTER5,
                                EMP1,EMP2,EMP3,EMP4,EMP5,
                                CS1,CS2,CS3,
                                PV1,PV2,PV3,
                                WOM1,WOM2,WOM3,
                                EP1,EP2,EP3,EP4,
                                LS1,LS2,LS3,LS4,LS5

  
)))

