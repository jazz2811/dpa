setwd("C:/Users/Jazz/Documents/Term III/DPA/startup-investments-crunchbase/")
investments <- read.csv('investments_VC.csv')
dim(investments)
colnames(investments)
summary(investments$founded_year)
dim(investments)
cleanedData = na.omit(investments)
dim(investments)
dim(cleanedData)
companies1950_2000 = cleanedData[cleanedData$founded_year >= 1950 & cleanedData$founded_year<=2000,]
dim(companies1950_2000)
t = companies1950_2000[companies1950_2000$round_F>0,]
dim(t)

country_data = as.data.frame(sort(table(companies1950_2000$country_code),decreasing = TRUE))
View(country_data)
dim(country_data)


hist(country_data$Freq)


