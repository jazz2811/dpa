library(readxl)
library(dplyr)
library(ggplot2)
library(lattice)
library(GGally)
library(corrplot)
library(magrittr)
library(tidyverse)
library(funModeling)
library(sqldf)

investments=read.csv("C:/Users/Jazz/Documents/Term III/DPA/startup-investments-crunchbase/investments_VC.csv")
dim(investments)
glimpse(investments)
#summary(investments)
head(investments)

#removing columns
investments<-subset(investments,select=-c(permalink,homepage_url))

#removing rows which has atleat 1 na value in any column
investments<-na.omit(investments)
dim(investments)

#query 
companies <- investments[which(investments$founded_year >= 1950 & investments$founded_year <= 2000),]
summary(companies$founded_year)

#round f companies
roundfCompanies <- companies[companies$round_F > 0,]
roundfCompanies$name
