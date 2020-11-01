library(dplyr)
library(tidyverse)

#DELIVERABLE 1
#Import and read MechaCar_mpg.csv file
MechaCar <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#Linerar regression 
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar)
#Summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar))


#DELIVERABLE 2
#Import and read Suspension_Coil.csv file
Suspension_Coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#Total summary of PSI
total_summary <- Suspension_Coil %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')

#Lot summary of PSI
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI), .groups = 'keep')


# DELIVERABLE 3
#sample
sample_Suspension <- Suspension_Coil %>% sample_n(50)
# all manufacturing lots against mean PSI of the population
t.test(log10(sample_Suspension$PSI),mu=mean(log10(Suspension_Coil$PSI)))

#Lot1
Lot1 <- Suspension_Coil %>% filter(Manufacturing_Lot=="Lot1")
# Lot1 against mean PSI of the population
t.test(log10(Lot1$PSI),mu=mean(log10(Suspension_Coil$PSI)))

#Lot2
Lot2 <- Suspension_Coil %>% filter(Manufacturing_Lot=="Lot2")
# Lot2 against mean PSI of the population
t.test(log10(Lot2$PSI),mu=mean(log10(Suspension_Coil$PSI)))

#Lot3
Lot3 <- Suspension_Coil %>% filter(Manufacturing_Lot=="Lot3")
# Lot3 against mean PSI of the population
t.test(log10(Lot3$PSI),mu=mean(log10(Suspension_Coil$PSI)))
