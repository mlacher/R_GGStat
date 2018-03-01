library(readxl)
library(psych)
library(ggplot2)
PilotBuild <- read_excel("C:/Users/maximilian.lacher/Documents/GitHub/R_Shares/R_GGStat/333043930_protocol.xlsx", 
                         sheet = "Gauting Head Data", col_types = c("text", 
                                                               "text", "numeric", "numeric", "numeric", 
                                                               "numeric", "numeric", "numeric", 
                                                               "numeric", "numeric", "numeric"))


"darkturquoise"

describe(PilotBuild$Damping)
#skew pos = distribution skewed to left side, neg = distribution skewed to right side
# kurtosis pos = distribution thin and steep, neg = wide and flat

histo<-ggplot(PilotBuild, aes(x=Damping))+
  geom_histogram(aes (y=..density..),colour="white", fill= "deepskyblue3")+
  geom_density() +
  theme_bw()+
  theme(panel.background = element_rect(fill = NA),
    panel.grid = element_blank(),
    panel.grid.major.y = element_line(colour = "White"),
    panel.grid.minor.y = element_line(colour = "White"),
    panel.ontop = TRUE)+scale_color_brewer(palette = "Set2")


histo

qq<-qplot(sample = PilotBuild$Damping, stat="qq")


qq