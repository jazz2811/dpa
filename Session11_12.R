setwd("~/Desktop/TUTORIALS/IITDelhi/")
getwd()

### Now lets load our exercise and calories dataset


## Read from xlsx file
#install.packages('readxl')
library (readxl)
excel_sheets ('C:/Users/Jazz/Documents/Term III/DPA/data/data/ExcelExample.xlsx')
excerciseXL <- read_excel ('C:/Users/Jazz/Documents/Term III/DPA/data/data/ExcelExample.xlsx')

caloriesXL <- read_excel ('C:/Users/Jazz/Documents/Term III/DPA/data/data/ExcelExample.xlsx', sheet = 'calories')

caloriesXL2 <- read_excel ('C:/Users/Jazz/Documents/Term III/DPA/data/data/ExcelExample.xlsx', sheet = 2)

## Read from CSV

excercise <- read.csv('C:/Users/Jazz/Documents/Term III/DPA/data/data//exercise.csv',stringsAsFactors = FALSE)
calories <- read.csv('C:/Users/Jazz/Documents/Term III/DPA/data/data/calories.csv',stringsAsFactors = FALSE)

## Check the number of datapoints in each dataframe
dim(excercise)
dim(calories)

summary(excercise)
summary(calories)

class(excercise)
class(calories)

str(excercise)
str(calories)

colnames(excercise)
colnames(calories)

summary(excercise[,c("Gender","Body_Temp")])

# Dummy variable for gender
excercise$Gender_bin <- factor(ifelse(excercise$Gender=='female',0,1))

summary(excercise[,c("Gender","Gender_bin","Body_Temp")])

head(excercise)
tail(excercise)

tail(excercise, 10)

## Merge two dataframes to create a new joined dataset
# Merging the data

summary(calories)
summary(excercise)
dim(calories)
dim(excercise)

df = merge(x=excercise,y=calories,by.x='User_ID', by.y='UID')
#df = merge(x=excercise,y=calories,by.x='User_ID', by.y='UID', all.x=TRUE)
dim(df)


#### Understand the data using plots
library(ggplot2)
Scatter.4 = ggplot(data = df, aes(x = Weight, y = Height))+
  geom_point(color='#EA4931')+
  theme_bw()+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())+  
  xlab("Weight of a person")+ylab("Height of a person")  + # Renaming axis
  scale_x_continuous(breaks = seq(0, 200, 10))+
  scale_y_continuous(breaks = seq(0, 250, 10))

Scatter.4

######################################

hist (df$Calories, main="Calories burnt", xlab="Calories")

hist (df$Weight, main="Weight Distribution", xlab="Weight of a person")
hist (df$Height, main="Height Distribution", xlab="Height of a person")

hist (df$Age, main="Age Distribution ", xlab="Age")
hist (df$Heart_Rate, main="Heart Rate Distribution ", xlab="Heart Rate")
hist (df$Body_Temp, main="Body Temperature Distribution ", xlab="Body Temperature")


## See the summary of the dataset
with(df, summary(Gender_bin))
with(df, summary(Weight))
with(df, summary(Height))
with(df, summary(Age))

WeightMeans = with(df, by(Weight, Gender, mean))
WeightMeans 

HeightMeans = with(df, by(Height, Gender, mean))
HeightMeans

###################3

GenderPlot1 = ggplot(df, aes(x = Gender, y = Weight)) + geom_boxplot() 
GenderPlot1

GenderPlot2 = ggplot(df, aes(x = Gender, y = Height)) + geom_boxplot() 
GenderPlot2

# Boxplots can be useful in identifying outliers in your data. 
# Outliers are any data points that fall outside of the whiskers 
# on the plot, and they are depicted with dots.

FacetPlot2 = ggplot(df, aes(x=Gender, y=Weight, label=User_ID)) + 
  geom_boxplot(outlier.size=3,outlier.shape=5,outlier.colour="purple") + 
  facet_grid(Gender_bin~.)

FacetPlot2

# Drawing the histogram
ggplot (data=df) + geom_histogram ( aes (x=Height))

## Density graph instead of histogram
ggplot (data=df) + geom_density ( aes (x=Height), fill="grey50")

# Histograms display counts of data in buckets, and density plots 
# show the probability of observations falling within a sliding 
# window along the variable of interest.
summary(df$Heart_Rate)

df$Healthy = factor(ifelse(df$Heart_Rate>=65 & df$Heart_Rate<100,'A',
                           ifelse(df$Heart_Rate>=100 & df$Heart_Rate<105,'B', 
                                  ifelse(df$Heart_Rate>=105 & df$Heart_Rate<110,'C', 'D'))))


summary(df$Healthy)

## Density Plots

# Density plots can be a useful tool to quickly visualize relationships between data. By plotting a density plot we visualize the proportion of data points that resides in one variable and, by plotting multiple density plots on top of each other, can see if these proportions overlap. If density plots do not overlap, this is an indicator that there is variability that is dependent on levels of the variable we plotted. Note that the creation of density plots using ggplot uses many of the same embedded commands that were customized above. 


Density.1 = ggplot(data = df, 
                   aes(Weight, fill=Gender))+
  geom_density(alpha = 1.0)+
  xlab("Weight")+
  theme_bw()

Density.1

Density.2 = ggplot(data = df, 
                   aes(Height, fill=Gender))+
  geom_density(alpha = 1.0)+
  xlab("Height")+
  theme_bw()

Density.2


# No Difference
Density.3 = ggplot(data = df, 
                   aes(Heart_Rate, fill=Gender))+
  geom_density(alpha = 1.0)+
  xlab("Heart Rate")+
  theme_bw()

Density.3


Density.4 = ggplot(data = df, 
                   aes(Heart_Rate, fill=Gender))+
  geom_density(alpha = 1.0)+
  xlab("Heart Rate")+
  theme_bw()

Density.4

# Subsetting data using dplyr

library(dplyr)


summary(df)
dim(df)
colnames(df)
mean(df$Age)

df$Age1<-ifelse(df$Age<=10 | df$Age>=80,mean(df$Age), df$Age)
summary(df[,c("Age","Age1")])

newdf = na.omit(df)
dim(newdf)
colnames(newdf)


newdf <- newdf %>%  dplyr::select(-c(User_ID,Gender,Age,,Healthy))

summary(newdf)

dim(newdf)





##########################################
set.seed(40)
#Random numbers
randomobs <- sample(seq_len(nrow(newdf)), size = floor(0.7 * nrow(df)))

randomobs

# Train dataset
train.df <- df[randomobs,]
dim(train.df)
#Test dataset
test.df <- df[-randomobs,]
dim(test.df)

colnames(newdf)

model_1_multipe <- lm(Calories ~ .,train.df)
summary(model_1_multipe)

saveRDS(model_1_multipe, file = "calories/model.Rds", compress = TRUE)

pred_regression <- predict(model_1_multipe, test.df %>% select(-Calories),type='response')

print(sqrt(mean((test.df$Calories - pred_regression)^2)))





########################################







