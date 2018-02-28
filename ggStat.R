library(readxl)
library(psych)
library(ggplot2)
PilotBuild <- read_excel("C:/Users/maximilian.lacher/Documents/GitHub/R_Shares/R_GGStat/333043930_protocol.xlsx", 
                         sheet = "Gauting Head Data", col_types = c("text", 
                                                               "text", "numeric", "numeric", "numeric", 
                                                               "numeric", "numeric", "numeric", 
                                                               "numeric", "numeric", "numeric"))


describe(PilotBuild$Damping)
#skew pos = distribution skewed to left side, neg = distribution skewed to right side
# kurtosis pos = distribution thin and steep, neg = wide and flat

histo<-ggplot(PilotBuild, aes(x=Damping))+
  geom_histogram(aes (y=..density..),colour="black", fill="white")+
                   geom_density() +
  theme_bw()

histo

qq<-qplot(sample = PilotBuild$Damping, stat="qq")


qq