library('readr')
library('Hmisc')
library('dplyr')
income_evaluation <- read.csv("C:/Users/Ankit/Downloads/income-classification/income_evaluation.csv")
View(income_evaluation)
str(income_evaluation)
income_evaluation$workclass <- as.character(income_evaluation$workclass)

income_evaluation$workclass[income_evaluation$workclass == "Without-pay" | 
                              income_evaluation$workclass == "Never-worked"] <- "Unemployed"

income_evaluation$workclass[income_evaluation$workclass == "State-gov" |
                              income_evaluation$workclass == "Local-gov"] <- "SL-gov"

income_evaluation$workclass[income_evaluation$workclass == "Self-emp-inc" |
                              income_evaluation$workclass == "Self-emp-not-inc"] <- "Self-employed"

table(income_evaluation$workclass)
income_evaluation$marital.status <- as.character(income_evaluation$marital.status)

income_evaluation$marital.status[income_evaluation$marital.status == "Married-AF-spouse" |
                                   income_evaluation$marital.status == "Married-civ-spouse" |
                                   income_evaluation$marital.status == "Married-spouse-absent"] <- "Married"

income_evaluation$marital.status[income_evaluation$marital.status == "Divorced" |
                                   income_evaluation$marital.status == "Separated" |
                                   income_evaluation$marital.status == "Widowed"] <- "Not-Married"
table(income_evaluation$marital.status)
income_evaluation$native.country <- as.character(income_evaluation$native.country)

north.america <- c("Canada", "Cuba", "Dominican-Republic", "El-Salvador", "Guatemala",
                   "Haiti", "Honduras", "Jamaica", "Mexico", "Nicaragua",
                   "Outlying-US(Guam-USVI-etc)", "Puerto-Rico", "Trinadad&Tobago",
                   "United-States")
asia <- c("Cambodia", "China", "Hong", "India", "Iran", "Japan", "Laos",
          "Philippines", "Taiwan", "Thailand", "Vietnam")
south.america <- c("Columbia", "Ecuador", "Peru")
europe <- c("England", "France", "Germany", "Greece", "Holand-Netherlands",
            "Hungary", "Ireland", "Italy", "Poland", "Portugal", "Scotland",
            "Yugoslavia")
other <- c("South", "?")

income_evaluation$native.country[income_evaluation$native.country %in% north.america] <- "North America"
income_evaluation$native.country[income_evaluation$native.country %in% asia] <- "Asia"
income_evaluation$native.country[income_evaluation$native.country %in% south.america] <- "South America"
income_evaluation$native.country[income_evaluation$native.country %in% europe] <- "Europe"
income_evaluation$native.country[income_evaluation$native.country %in% other] <- "Other"

table(income_evaluation$native.country)
income_evaluation$native.country <- as.factor(income_evaluation$native.country)
income_evaluation$marital.status <- as.factor(income_evaluation$marital.status)
income_evaluation$workclass <- as.factor(income_evaluation$workclass)
str(income_evaluation)
table(income_evaluation$workclass)
income_evaluation[income_evaluation == "?"] <- NA
table(income_evaluation$workclass)
income_evaluation <- na.omit(income_evaluation)
library(ggplot2)
ggplot(income_evaluation, aes(age)) + geom_histogram(aes(fill = income), color = "black",
                                                     binwidth = 1)
ggplot(income_evaluation, aes(hours.per.week)) + geom_histogram()
library(data.table)
setnames(income_evaluation, "native.country", "region")

# Reorder factor levels by count
region.ordered <- reorder(income_evaluation$region, income_evaluation$region, length)
region.ordered <- factor(region.ordered, levels = rev(levels(region.ordered)))


ggplot(income_evaluation, aes(region.ordered)) + geom_bar(aes(fill = income), color = "black")
occupation.ordered <- reorder(income_evaluation$occupation, income_evaluation$occupation, length)
occupation.ordered <- factor(occupation.ordered, levels = rev(levels(occupation.ordered)))
ggplot(income_evaluation, aes(occupation.ordered)) + geom_bar(aes(fill = income), color = "blue")
ggplot(income_evaluation, aes(education.num)) + geom_histogram(aes(fill = income), color = "black",
                                                     binwidth = 1)

   
 