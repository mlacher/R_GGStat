library(readxl)
library(psych)
library(ggplot2)
library(ggpubr)
library(grid)
library(cowplot)
PilotBuild <- read_excel("C:/Users/maximilian.lacher/Documents/GitHub/R_Shares/R_GGStat/333043930_protocol.xlsx", 
                         sheet = "Gauting Head Data", col_types = c("text", 
                                                               "text", "numeric", "numeric", "numeric", 
                                                               "numeric", "numeric", "numeric", 
                                                               "numeric", "numeric", "numeric"))

PilotBuild <- na.omit(PilotBuild)
"darkturquoise"


des<-describe(PilotBuild$`Min Frequency Tube`)

#1 ---------------------check for normal distribution-----------------------------------------
#skew pos = distribution skewed to left side, neg = distribution skewed to right side
# kurtosis pos = distribution thin and steep, neg = wide and flat

histo<-ggplot(PilotBuild, aes(x=`Min Frequency Tube`))+
  geom_histogram(colour="white", fill= "deepskyblue3", aes(y= ..density..))+
  geom_density(alpha = 0.1, colour = "black", aes(y= ..density..))+
  geom_point(aes(x=des$mean,y=0),size = 7, shape =3)+
  theme_bw()+
  theme(panel.background = element_rect(fill = NA),
    panel.grid = element_blank(),
    panel.grid.major.y = element_line(colour = "White"),
    panel.grid.minor.y = element_line(colour = "White"),
    panel.ontop = TRUE)+scale_color_brewer(palette = "Set2")+
  annotate("text", x = des$mean+2*des$sd, y = 0.00065, label = paste("n=", sep = "", des$n))+
  xlim(87000,90000)

#2 boxplot

bxplot<-ggplot(PilotBuild, aes(y=`Min Frequency Tube`, x = "plot"))+
  geom_boxplot(fill="deepskyblue3")+
  theme_bw()+
  ylim(87000,90000)+
  coord_flip()

#1/2 combination plot
windows()
ggarrange(histo,bxplot, heights = c(2, 0.5),
          ncol = 1, nrow = 2, align = "v")

#3 qq plot
qq<-qplot(sample = PilotBuild$`Min Frequency Tube`, stat="qq")






pnt <- ggplot(PilotBuild, aes(x=`Min Frequency Tube`, y =`Min Frequency Mem`))+
  geom_point()+
  geom_smooth(method = "lm", se = T, colour = "deepskyblue3", alpha=0.3)+
  theme_bw()

pnt

