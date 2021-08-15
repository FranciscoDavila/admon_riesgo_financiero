library(gmodels) 
library(ggplot2) 
library(tidyr) 
library(dplyr) 
library(pROC)
library(knitr) 
library(Sim.DiffProc)
library(bazar)
library(scatterplot3d)
library(MASS)
loan_data_ch1 <- readRDS("~/Desktop/R:STATA/R/Admon. Riesgo Financiero/loan_data_ch1.rds")
str(loan_data_ch1)
head(loan_data_ch1)
CrossTable(loan_data_ch1$home_ownership)
#41.3% posee hipoteca, 0.3% tiene otro, 7.9% posee casa y 50.5% renta#
CrossTable(loan_data_ch1$home_ownership, loan_data_ch1$loan_status, prop.r=TRUE, prop.c=FALSE, prop.t=FALSE, prop.chisq = FALSE) 
ggplot(loan_data_ch1,aes(x=int_rate))+ 
  geom_histogram(aes(y=..density..),binwidth=0.5,colour="black", 
                 fill="white")+ 
  labs(y="Density", 
       x="Interest rate", 
       title="Interest rate histogram", 
       subtitle=NULL)+ 
  theme(legend.position="bottom",legend.title=element_blank())
ggplot(loan_data_ch1,aes(x=annual_inc))+ 
  geom_histogram(aes(y=..density..),colour="black",fill="red")+ 
  labs(y="Density", 
       x="Annual income", 
       title="Annual income histogram", 
       subtitle=NULL)+ 
  theme(legend.position="bottom",legend.title=element_blank())
ggplot(loan_data_ch1, aes(int_rate, annual_inc)) + 
  geom_point() + 
  labs(y="Annual income", 
       x="Interest rate", 
       title="Annual income inspection.", 
       subtitle=NULL)+ 
  theme(legend.position="bottom",legend.title=element_blank())
high_income <- loan_data_ch1[(loan_data_ch1$annual_inc>1000000),]
high_income
high_income_index<-data.frame(value=as.integer(rownames(high_income))) 
loan_data_ch1<-loan_data_ch1[-high_income_index$value,] 
ggplot(loan_data_ch1,aes(int_rate,annual_inc))+ 
  geom_point()+ 
  labs(y="Annual income", 
       x="Interest rate", 
       title="Annual income without extreme values.", 
       subtitle=NULL)+ 
  theme(legend.position="bottom",legend.title=element_blank())
ggplot(loan_data_ch1,aes(x=annual_inc))+ 
  geom_histogram(aes(y=..density..),colour="black",fill="red")+ 
  labs(y="Density", 
       x="Annual income", 
       title="Annual income histogram second version.", 
       subtitle=NULL)+ 
  theme(legend.position="bottom",legend.title=element_blank())