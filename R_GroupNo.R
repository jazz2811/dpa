##loading Libraries
library(funModeling) 
library(tidyverse) 
library(Hmisc)

## Loading File
Train_data = read.csv("C:/Users/ANZAR QUADRI/Desktop/dpa project/train.csv")

## Data Analysis
dim(Train_data)
head(Train_data)
summary(Train_data)
freq(Train_data[3:12])
##Data Cleaning

#Removing unwanted rows
Train_data = subset(Train_data,!Train_data$Product_Category_1 %in% c(19,20))

#Replacing NA

m1 = mean(Train_data$Product_Category_2,na.rm = TRUE)
m2 = mean(Train_data$Product_Category_3,na.rm = TRUE)
Train_data$Product_Category_2 <- ifelse(is.na(Train_data$Product_Category_2),m1,Train_data$Product_Category_2)
Train_data$Product_Category_3 <- ifelse(is.na(Train_data$Product_Category_3),m2,Train_data$Product_Category_3)

#Correcting Current City
Train_data$Stay_In_Current_City_Years <- ifelse(Train_data$Stay_In_Current_City_Years %in% c("4+"),4,Train_data$Stay_In_Current_City_Years)

#Converting Age and city_category to binary form
#Train_data$Gender=ifelse(Train_data$Gender=="F",0,1)
Train_data$City_Category=ifelse(Train_data$City_Category=="A",1,ifelse(Train_data$City_Category=="B",2,3))
Train_data$Age <- ifelse(Train_data$Age == "0-17",17,ifelse(Train_data$Age == "18-25",25,ifelse(Train_data$Age == "26-35",35,ifelse(Train_data$Age == "36-45",45,ifelse(Train_data$Age == "46-55",55,ifelse(Train_data$Age == "51-55",55,65))) )))
summary(Train_data)
#Visual analysis
hist(x = Train_data$Purchase,main = "Histogram for Purchase",xlab = "Purchase")
plot_num(Train_data[9:12],bins = 20)
boxplot(x = Train_data[4:11],col = "Red")
cortrain = cor(Train_data[4:12])
corrplot::corrplot(cortrain,method = "circle",type = "lower")
#model
df <- Train_data[3:12]
newdf <- Train_data[3:12]
set.seed(40)
#Random numbers
randomobs <- sample(seq_len(nrow(df)), size = floor(0.7 * nrow(newdf)))

randomobs

# Train dataset
train <- df[randomobs,]
dim(train)

#Test dataset
test <- df[-randomobs,]
dim(test)
colnames(newdf)
model_1_multipe <- lm(Purchase~.,train)
summary(model_1_multipe)
pred_regression <- predict(model_1_multipe, test %>% c(-test$Purchase),type='response')
ggplot(test,aes(y = test$Purchase ,x =  pred_regression))+geom_point()+geom_smooth(method="lm")
print(sqrt(mean((test$Purchase - pred_regression)^2)))
