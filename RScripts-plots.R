#################################################################
####### Sperm-storage complexity plots ##########################
#### The evolution of complex female sperm-storage organs #######
#################################################################


####### Female fertility decline post-mating ########
# females are mated once at the start and we are looking at how within 8 days (in 2-day blocks, fertility declines, no re-mating)
# these are T. castaneum females
# Eclosion success = number of offspring / number of eggs produced..all at 30C

##### Figure 2A #####

rm(list=ls()) # clear memory

setwd("XXXXXX") # set the working directory
FD <- read.csv ("Female sperm shotage_6 days_Fig 2A.csv") # FD = fertility decline
str(FD)

FD$Block<-as.factor(FD$Block)

FD.s<-FD%>%filter(Block=="1"|Block=="2"|Block=="3"|Block=="4")

attach(FD.s)

library(ggplot2)
library(Rmisc)
library(tidyverse)
library(ggpmisc)
library(dplyr)
library(ggpubr)


FD.p<-ggplot(data=FD.s, aes(x=Block, y=Eclosion.Success))+
  geom_point(size=6, fill="grey",shape=22) + ylim(0.6,1.0)+
  xlab("2-Day Blocks")+ylab("Female fertility (Eclosion success)")+ theme_pubclean() +
  theme(axis.line.x = element_line(size = 1, colour = "black"),
        axis.line.y = element_line(size = 1, colour = "black"),
        axis.text.x=element_text(colour="black", size = 12, family = "Times", face = "bold"),
        axis.text.y=element_text(colour="black", size = 12, face = "bold", family = "Times"))+
  theme(axis.title.x = element_text(colour= "black", face = "bold", size = 14, family = "Times"),
        axis.title.y = element_text(colour= "black", face = "bold", size = 14, family = "Times"))
FD.p


######## male fertility declines after sequentially mating with females #######

##### FIGURE 2B #######
#####################################################################################################
###### Sperm management supporting data, sperm limitation among males #######
###### males mated through sequential mates N=13 females, 2 blocks' worth of offspring produced #####
#####################################################################################################

rm(list=ls())


setwd(XXXXXX)
SM <- read.csv ("Male sperm depletion.F1-4_Fig 2B.csv", fileEncoding = "Latin1", check.names = F)

str(SM)

SM$Male.ID<-as.factor(SM$Male.ID)
SM$Fem.ID<-as.factor(SM$Fem.ID)
SM$Block.ID<-as.factor(SM$Block.ID)

library (ggplot2)
library(Rmisc)     #To use summarySE function
library(tidyverse)
library(ggpubr)

##### summary ######

SM2<- summarySE (SM, measurevar = "Off.Counts", groupvars = c("Fem.ID","Male.ID"))
SM2B<- summarySE (SM, measurevar = "Off.Counts", groupvars = c("Fem.ID"))


#### subset data to upto Female 4 #####

SM.fil<-SM %>% filter(Fem.ID=="F1"|Fem.ID=="F2"|Fem.ID=="F3"|Fem.ID=="F4")

SM.fil.summ<-summarySE(SM.fil, measurevar = "Off.Counts", groupvars = c("Fem.ID"))

str(SM.fil)
str(SM.fil.summ)

SM3b<-ggplot(SM.fil.summ, aes(y=Off.Counts, x=Fem.ID))+
  geom_point(size = 2.0, stroke=1.9, alpha=0.70,
             position=position_dodge(0.5))+
  geom_line(aes(group=1))+
  #geom_line(aes(group=Male.ID, colour=Male.ID), alpha=0.12, position=position_dodge(0.5), data=SM.fil)+
  geom_point(aes(group=Male.ID), size=2, shape=0, alpha=0.12, data=SM.fil)+
  geom_errorbar(aes(ymin=Off.Counts-se, ymax=Off.Counts+se), width=0.1,
                position=position_dodge(0.5))+
  labs(x="Female number", y = "Male fertility (Offspring number)")+
  scale_x_discrete(labels=c("Fem.ID"="Female ID"), limits=c("F1","F2","F3","F4"))+
  #scale_colour_manual(values = cbPalette)+
  #theme(axis.title.x = element_blank())+ 
  ylim(-10,240)+theme_pubclean()+
  theme(axis.line.x = element_line(size = 1, colour = "black"),
        axis.line.y = element_line(size = 1, colour = "black"),
        axis.text.x=element_text(colour="black", size = 12, family = "Times", face = "bold"),
        axis.text.y=element_text(colour="black", size = 12, face = "bold", family = "Times"))+
  theme(axis.title.x = element_text(colour= "black", face = "bold", size = 14, family = "Times"),
        axis.title.y = element_text(colour= "black", face = "bold", size = 14, family = "Times"))+
  #annotate("rect", xmin = 0.80, xmax = 1.20, ymin = 82, ymax = 90, alpha = 0.02, colour="black", fill="lightblue")+
  theme(legend.position = "none")

SM3b


##### combining these plots #######
library(ggpubr)

Plot1<-ggarrange(FD.p, SM3b, ncol=2, nrow=1, labels=c("A","B"))
Plot1


####################################
#### Figure 4 #####
#### spermathecal tubule counts ####
####################################

rm(list=ls())
setwd(XXXXXXX)


Sel.1 <- read.csv ("SS treatments_Sperm store complexity_tubule numbers_Fig 4.csv") # selection lines Male- and Female-bias
Anc.1 <- read.csv ("GA1 Sperm store complexity_tubule numbers_Fig 4") # ancestral strain- GA1

library (ggplot2) # To use ggplot
library(Rmisc)     #To use summarySE function
library(car)
library(MASS)
library(tidyverse)

str(Sel.1)
str(Anc.1)

Sel.1$Treatment<-as.factor(Sel.1$Treatment)
Sel.1$Line<-as.factor(Sel.1$Line)
Anc.1$Treatment<-as.factor(Anc.1$Treatment)

GA1<-summarySE(Anc.1, measurevar = "Tubule_number", groupvars = c("Treatment"))
Sel.2<-summarySE(Sel.1, measurevar = "Tubule_number", groupvars = c("Treatment", "Line"))
Sel.2b<-summarySE(Sel.1, measurevar = "Tubule_number", groupvars = c("Treatment"))


str(Sel.2)
str(Sel.2b)
str(GA1)


ggplot(Sel.2, aes(x = Treatment, y = Tubule_number, fill = Treatment)) +
  geom_boxplot(width=0.20,size=0.50, position=position_nudge(x = 0.36))+ #position=position_nudge(x = 0.35), width = 0.20,size = 1)
  stat_summary(geom = "point", colour = "black", aes(group=Treatment), 
               fun.y = "mean", size = 6, position=position_nudge(x = 0.36))+
  geom_point(aes(fill = Treatment, shape = Line, group = Line), position=position_jitterdodge(dodge.width=0.48, jitter.width=0.1), alpha=0.18, size= 2, data=Sel.1)+
  geom_point(aes(fill = Treatment, shape = Line), position=position_jitterdodge(dodge.width=0.543, jitter.width=0.48), size= 6, alpha=0.72, data=Sel.2)+
  geom_boxplot(aes(x = Treatment, y = Tubule_number), position=position_nudge(x = 0.36), size=0.50, width=0.20, shape = 21, alpha=0.81, fill="green", data=Anc.1)+
  stat_summary(geom = "point", colour = "black", aes(group=Treatment), fun.y = "mean", size = 6, position=position_nudge(x = 0.36), data=GA1)+
  #geom_errorbar(aes(ymin=Tubule_number-se, ymax=Tubule_number+se), width=0.1,
  #              position=position_nudge(x = -0.12), data=GA1)+
  geom_point(aes(x = Treatment, y = Tubule_number, fill = Treatment), position=position_jitterdodge(dodge.width=0.2, jitter.width=0.1), 
             size= 1, shape = 21, alpha=0.18, fill="green", data=Anc.1)+
  scale_shape_manual(values=c(22,23,24,22,23,24))+
  #geom_smooth(method = "lm",  linetype="dashed", color="black",se=TRUE, aes(group=1))+
  theme_classic()+ labs(x = "Treatment", y = "Tubule number (counts)")+ ylim(1.5,10)+
  theme(axis.line.x = element_line(size = 1, colour = "black"),
        axis.line.y = element_line(size = 1, colour = "black"),
        axis.text.x=element_text(colour="black", size = 12, family = "Times", face = "bold"),
        axis.text.y=element_text(colour="black", size = 12, face = "bold", family = "Times"))+
  theme(axis.title.x = element_text(colour= "black", face = "bold", size = 14, family = "Times"),
        axis.title.y = element_text(colour= "black", face = "bold", size = 14, family = "Times"))+
  #stat_summary(fun.y=mean, geom  = "point")+ # if legend needs removing then use, theme(legend.position="none")
  scale_fill_manual(values=c(FemBias = "#53A6F9", MaleBias = "#E20000"))+
  scale_x_discrete(labels=c("GA1" = "GA1 \n (Ancestral)",
                            "FemBias" = "Female Bias",
                            "MaleBias" = "Male Bias"), 
                   limits=c("FemBias", "GA1", "MaleBias"))+
  theme(legend.position="none")


#######################################################################
##### Figure 5 #######
###### plotting the GFP sperm intensity within the female tracts ######
#######################################################################

rm(list=ls())
setwd(XXXXXX)
GFP.I <- read.csv ("Sperm stored_GFP tagged sperm_10 days_Fig 5.csv")

str(GFP.I)

library(ggplot2)
library(tidyverse)
library(Rmisc)
library(ggpubr)

GFP.I$Selection.Regime<-as.factor(GFP.I$Selection.Regime)
GFP.I$Reg.Line<-as.factor(GFP.I$Reg.Line)
GFP.I$Day<-as.factor(GFP.I$Day)

GFP.Ib<-GFP.I %>% filter(Day==10)
str(GFP.Ib)

GFP.s<-summarySE(GFP.Ib, measurevar = "Mean.Mean", groupvars = c("Selection.Regime","Reg.Line"))
GFP.s2<-summarySE(GFP.s, measurevar = "Mean.Mean", groupvars = c("Selection.Regime"))


IT<-ggplot(GFP.s, aes(x = Selection.Regime, y = Mean.Mean)) +
  geom_boxplot(aes(fill=Selection.Regime), width=0.20,size=0.60, position= position_nudge(x=.30))+ #position=position_nudge(x = 0.35), width = 0.20,size = 1)
  stat_summary(geom = "point", colour = "black", fun.y = "mean", size = 6, position= position_nudge(x=.30), data=GFP.s2)+
  geom_point(aes(fill=Selection.Regime, shape = Reg.Line), position=position_jitterdodge(dodge.width=0.48, jitter.width=0.1), alpha=0.18, size= 2, data=GFP.Ib)+
  geom_point(aes(fill=Selection.Regime, shape = Reg.Line), position=position_jitterdodge(dodge.width=0.366, jitter.width=0.36), size= 6, alpha=0.72, data=GFP.s)+
  scale_shape_manual(values=c(22,23,24,22,23,24))+
  theme_classic()+ labs(x= "Treatment", y = "GFP sperm intensity\nin female tracts")+ ylim(0,9600)+
  theme(axis.line.x = element_line(size = 1, colour = "black"),
        axis.line.y = element_line(size = 1, colour = "black"),
        axis.text.x=element_text(colour="black", size = 12, family = "Times", face = "bold"),
        axis.text.y=element_text(colour="black", size = 12, face = "bold", family = "Times"))+
  theme(axis.title.x = element_text(colour= "black", face = "bold", size = 14, family = "Times"),
        axis.title.y = element_text(colour= "black", face = "bold", size = 14, family = "Times"))+
  #stat_summary(fun.y=mean, geom  = "point")+ # if legend needs removing then use, theme(legend.position="none")
  scale_fill_manual(values=c("#53A6F9", "#E20000"))+
  scale_x_discrete(labels=c( "Fem.Bias" = "Female Bias",
                             "Male.Bias" = "Male Bias"), 
                   limits=c("Fem.Bias","Male.Bias"))+
  theme(legend.position="none")
IT



###################################
##### Figure 6 ######

##### Figure 6A #####
######## SS 160 days total ########


rm(list=ls())
setwd(XXXXXXX)


TO <- read.csv("Offspring counts 160 days_number of sperm stored_Fig 6A.csv") # 160 day offspring) # Figure 6A

str(TO)
TO$Treatment<-as.factor(TO$Treatment)
TO$Line<-as.factor(TO$Line)
TO$ID<-as.factor(TO$ID)


library(ggplot2)
library(tidyverse)
library(Rmisc)
library(ggpubr)



###### comparing total offspring numbers ######
str(TO)

sum.TO<-summarySE(TO, measurevar="Offspring", groupvars=c("Line","Treatment"))
sum.TOb<-summarySE(TO, measurevar="Offspring", groupvars=c("Treatment"))
sum.TOc<-summarySE(sum.TO, measurevar="Offspring", groupvars=c("Treatment"))

(284.5+285.3+157.9)/3
(157.3+203.9+191.9)/3

#write.csv(sum.TO, "SS_lifetime_Offs_for_Dave.csv")

str(sum.TO)

TO.p<-ggplot(sum.TO, aes(x = Treatment, y =Offspring)) +
  geom_boxplot(aes(fill=Treatment), width=0.20,size=0.60, position= position_nudge(x=.30))+ #position=position_nudge(x = 0.35), width = 0.20,size = 1)
  stat_summary(geom = "point", colour = "black", fun.y = "mean", size = 6, position= position_nudge(x=.30), data=sum.TOb)+
  geom_point(aes(fill=Treatment, shape=Line), position=position_jitterdodge(dodge.width=0.366, jitter.width=0.36), size= 6, alpha=0.72, data=sum.TO)+
  geom_point(aes(fill=Treatment, shape=Line), position=position_jitterdodge(dodge.width=0.48, jitter.width=0.1), alpha=0.18, size= 2, data=TO)+
  scale_shape_manual(values=c(22,23,24,22,23,24))+
  theme_classic()+ labs(x= "Treatment", y = "Lifetime Offspring\n(160 day counts)")+ ylim(0,810)+
  theme(axis.line.x = element_line(size = 1, colour = "black"),
        axis.line.y = element_line(size = 1, colour = "black"),
        axis.text.x=element_text(colour="black", size = 12, family = "Times", face = "bold"),
        axis.text.y=element_text(colour="black", size = 12, face = "bold", family = "Times"))+
  theme(axis.title.x = element_text(colour= "black", face = "bold", size = 14, family = "Times"),
        axis.title.y = element_text(colour= "black", face = "bold", size = 14, family = "Times"))+
  #stat_summary(fun.y=mean, geom  = "point")+ # if legend needs removing then use, theme(legend.position="none")
  scale_fill_manual(values=c("#53A6F9", "#E20000"))+
  scale_x_discrete(labels=c( "FemBias" = "Female Bias",
                             "MaleBias" = "Male Bias"), 
                   limits=c("FemBias","MaleBias"))+
  theme(legend.position="none")
TO.p


######################################################
##### tubule count + offspring produced analysis #####
######## Figure 6B ##########
  
rm(list=ls())
setwd(XXXXXXX)
SR <- read.csv ("Offspring counts 160 days_number of sperm stored_Fig 6A.csv") # Figure 6B

library(ggplot2)
library(tidyverse)
library(Rmisc)
library(ggpubr)


str(SR)
SR$Treatment<-as.factor(SR$Treatment)
SR$Line<-as.factor(SR$Line)
SR$Replicate<-as.factor(SR$Replicate)

SR.0<-SR %>% filter(!row_number() %in% c(8,12))




###### comparing spermathecal tubules numbers 3 and 7 ######
SR.1 <- SR.0 %>% filter(Tubule_number == 3 | Tubule_number == 7)

#write.csv(SR.1, "SS_Tubule_num_Offs_for_Dave.csv") # data frame to csv, write csv

SR.1$Tubule_number<-as.factor(SR.1$Tubule_number)

SR.1b<- summarySE (SR.1, measurevar = "Offspring", groupvars = c("Line","Treatment", "Tubule_number"))
SR.1b2<- summarySE (SR.1b, measurevar = "Offspring", groupvars = c("Treatment","Tubule_number"))
SR.1b2A<- summarySE (SR.0, measurevar = "Tubule_number", groupvars = c("Treatment"))
SR.1b2B<- summarySE (SR.0, measurevar = "Tubule_number", groupvars = c("Treatment", "Line"))
SR.1c<- summarySE (SR.1, measurevar = "Offspring", groupvars = c("Tubule_number"))
SR.1d<- summarySE (SR.1, measurevar = "Offspring", groupvars = c("Line","Tubule_number","Treatment"))
#SR.1d.s<- SR.1d %>% filter(!row_number() %in% c(4))
SR.1e<- summarySE (SR.1, measurevar = "Offspring", groupvars = c("Line"))

SR.1s<-summarySE (SR.1, measurevar = "Offspring", groupvars = c("Line","Tubule_number")) # to send to Dave
SR.bs<-summarySE (SR, measurevar = "Body.Size", groupvars = c("Line"), na.rm=TRUE) # to send to Dave

str(SR.1b)
str(SR.1d)
str(SR.1)

T3vT7<-ggplot(SR.1b, aes(x = Tubule_number, y = Offspring)) +
  geom_boxplot(aes(fill = Tubule_number), width=0.20,size=0.60, position= position_nudge(x=.30))+ #position=position_nudge(x = 0.35), width = 0.20,size = 1)
  stat_summary(geom = "point", colour = "black", fun.y = "mean", size = 6, position= position_nudge(x=.30), data=SR.1b2)+
  geom_point(aes(fill = Tubule_number, colour = Line, shape = Line),
             position=position_jitterdodge(dodge.width=0.48, jitter.width=0.1), alpha=0.36, size= 2, data=SR.1)+
  geom_point(aes(y = Offspring, x = Tubule_number, fill = Tubule_number, shape = Line, colour = Line),
             position=position_jitterdodge(dodge.width=0.420, jitter.width=0.18), size= 6, alpha=0.72, data=SR.1d)+
  scale_shape_manual(values=c(22,23,24,22,23,24))+
  scale_colour_manual(values=c("#53A6F9","#53A6F9","#53A6F9", "#E20000","#E20000","#E20000"))+
  theme_classic()+ labs(x = "Spermatheca type" , y = "Lifetime Offspring\n(160 day counts)")+ ylim(0,840)+
  theme(axis.line.x = element_line(size = 1, colour = "black"),
        axis.line.y = element_line(size = 1, colour = "black"),
        axis.text.x=element_text(colour="black", size = 12, family = "Times", face = "bold"),
        axis.text.y=element_text(colour="black", size = 12, face = "bold", family = "Times"))+
  theme(axis.title.x = element_text(colour= "black", face = "bold", size = 14, family = "Times"),
        axis.title.y = element_text(colour= "black", face = "bold", size = 14, family = "Times"))+
  #stat_summary(fun.y=mean, geom  = "point")+ # if legend needs removing then use, theme(legend.position="none")
  scale_fill_manual(values=c("#53A6F9", "#E20000"))+ 
  scale_x_discrete(labels=c( "3" = "3-Tubules",
                             "7" = "7-Tubules"), 
                   limits=c("3","7"))+
  theme(legend.position="none")
T3vT7


##### combining the plots #####

library(ggpubr)
Plot.c<-ggarrange(TO.p, T3vT7, ncol=2, nrow=1, labels=c("A","B"))
Plot.c 



############################
##### FIGURE 7 #####
##### % Conspecific #######

rm(list=ls())

setwd(XXXXXX)
Con.1<- read.csv ("P2_Conspecific data_Fig 7A.csv") # P2 data: SS sex ratio female paired with T. freemani heterospecific and then a reindeer conspecific male

str(Con.1)
Con.1$Treat<-as.factor(Con.1$Treat)
Con.1$Line<-as.factor(Con.1$Line)

library(ggplot2)
library(tidyverse)
library(Rmisc)
library(ggpubr)


###### comparing P2: conspecific offspring % ######
str(Con.1)

sum.a<-summarySE(Con.1, measurevar="Conspecific", groupvars=c("Line", "Treat"))
sum.a2<-summarySE(Con.1, measurevar="Conspecific", groupvars=c("Treat"))


Con.2<-ggplot(sum.a, aes(x = Treat, y =Conspecific)) +
  geom_boxplot(aes(fill=Treat), width=0.20,size=0.60, position= position_nudge(x=.30))+ #position=position_nudge(x = 0.35), width = 0.20,size = 1)
  stat_summary(geom = "point", colour = "black", fun.y = "mean", size = 6, position= position_nudge(x=.30))+
  geom_point(aes(fill=Treat, shape=Line), position=position_jitterdodge(dodge.width=0.366, jitter.width=0.36), size= 6, alpha=0.72, data=sum.a)+
  geom_point(aes(fill=Treat, shape=Line), position=position_jitterdodge(dodge.width=0.48, jitter.width=0.1), alpha=0.24, size= 2, data=Con.1)+
  scale_shape_manual(values=c(22,23,24,22,23,24))+
  theme_classic()+ labs(x= "Treatment", y = "% Offspring sired by conspecific")+ ylim(20,100)+
  theme(axis.line.x = element_line(size = 1, colour = "black"),
        axis.line.y = element_line(size = 1, colour = "black"),
        axis.text.x=element_text(colour="black", size = 12, family = "Times", face = "bold"),
        axis.text.y=element_text(colour="black", size = 12, face = "bold", family = "Times"))+
  theme(axis.title.x = element_text(colour= "black", face = "bold", size = 14, family = "Times"),
        axis.title.y = element_text(colour= "black", face = "bold", size = 14, family = "Times"))+
  scale_fill_manual(values=c("#53A6F9", "#E20000"))+
  scale_x_discrete(labels=c( "Female.Bias" = "Female Bias",
                             "Male.Bias" = "Male Bias"), 
                   limits=c("Female.Bias", "Male.Bias"))+
  theme(legend.position="none")
Con.2


##### FIGURE 7B #######
##### % Hybrid Offspring ####### 

Hyb.1<- read.csv ("P2_Not producing Hybrid Off Data_Fig 7B.csv") # P2 data: SS sex ratio female paired with T. freemani heterospecific and then a conspecific male

str(Hyb.1)
Hyb.1$Treat<-as.factor(Hyb.1$Treat)
Hyb.1$Line<-as.factor(Hyb.1$Line)

library(ggplot2)
library(tidyverse)
library(Rmisc)
library(ggpubr)


###### comparing Hybrid offspring % ######
str(Hyb.1)

sum.Hyb<-summarySE(Hyb.1, measurevar="No.Hybrids_.", groupvars=c("Treat"))

Hyb.2<-ggplot(Hyb.1, aes(x = Treat, y =No.Hybrids_.)) +
  geom_boxplot(aes(fill=Treat), width=0.20,size=0.60, position= position_nudge(x=.18))+ #position=position_nudge(x = 0.35), width = 0.20,size = 1)
  stat_summary(geom = "point", colour = "black", fun.y = "mean", size = 6, position= position_nudge(x=.18))+
  #geom_point(aes(fill=Treat), position=position_jitterdodge(dodge.width=0.12, jitter.width=0.2), size= 6, alpha=0.96, data=sum.Hyb)+
  geom_point(aes(fill=Treat, shape=Line), position=position_jitterdodge(dodge.width=0.1, jitter.width=0.1), size= 6, alpha=0.66, data=Hyb.1)+
  scale_shape_manual(values=c(22,23,24,22,23,24))+
  theme_classic()+ labs(x= "Treatment", y = "% Females NOT producting\nhybrid offspring")+ ylim(20,100)+
  theme(axis.line.x = element_line(size = 1, colour = "black"),
        axis.line.y = element_line(size = 1, colour = "black"),
        axis.text.x=element_text(colour="black", size = 12, family = "Times", face = "bold"),
        axis.text.y=element_text(colour="black", size = 12, face = "bold", family = "Times"))+
  theme(axis.title.x = element_text(colour= "black", face = "bold", size = 14, family = "Times"),
        axis.title.y = element_text(colour= "black", face = "bold", size = 14, family = "Times"))+
  #stat_summary(fun.y=mean, geom  = "point")+ # if legend needs removing then use, theme(legend.position="none")
  scale_fill_manual(values=c("#53A6F9", "#E20000"))+
  scale_x_discrete(labels=c( "Female.Bias" = "Female Bias",
                             "Male.Bias" = "Male Bias"), 
                   limits=c("Female.Bias", "Male.Bias"))+
  theme(legend.position="none")
Hyb.2


library(ggpubr)
Plot.f<-ggarrange(Con.2, Hyb.2, ncol=2, nrow=1, labels=c("A","B"))
Plot.f 

