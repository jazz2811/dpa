say.hello <- function ()
{
  print ("Hello, World!")
}
say.hello()

hello.person <- function (first, last)
{
  print ( sprintf ("Hello %s %s", first, last))
}

hello.person('Vijaya','Parashar')

# specify the second argument first
# then provide the first argument with no name
hello.person (last="Bhadani", "Abhay")

double.num <- function (x){
  x * 2
}

# automatically returning a value
double.num(4)

double.num <- function (x){
  return(x * 2)
}

# automatically returning a value
temp = double.num(4)
temp



do.call ("hello.person", args= list (first="Abhay", last="Bhadani"))

do.call (hello.person, args= list (first="Akshay", last="Kumar"))

run.this <- function (x, func=mean)
{
  do.call (func, args= list (x))
}
# finds the mean by default

run.this (1:10)

run.this (1:10, mean)
# calculate the sum
run.this (1:10, sum)
# calculate the standard deviation
run.this (1:10, sd)


?apply
my.matrx <- matrix(c(1:10, 11:20, 21:30), nrow = 10, ncol = 3)
my.matrx
apply(my.matrx, 1, sum)
apply(my.matrx, 2, sum)


apply(my.matrx, 2, length)


st.err <- function(x){
  sd(x)/sqrt(length(x))
}

apply(my.matrx,2, st.err)


my.matrx2 <- apply(my.matrx,1:2, function(x) x+3)
my.matrx2


vec <- c(1:10)
print (vec)
apply(vec, 1, sum)



?lapply


A<-c(1:9)
B<-c(1:12)
C<-c(1:15)
my.lst<-list(A,B,C)
my.lst


lapply(my.lst, sum)

lapply(my.lst, st.err)

vec

sapply(vec, sum)

sapply(my.lst, sum)

vapply(vec, sum, numeric(1))
##  [1]  1  2  3  4  5  6  7  8  9 10
vapply(my.lst, sum, numeric(1))

tdata <- as.data.frame(cbind(c(1,1,1,1,1,5,5,5,4,4), my.matrx))
tdata
colnames(tdata)

tapply(tdata$V2, tdata$V1, mean)


#### Example 2: Combining functions
summary <- tapply(tdata$V2, tdata$V1, function(x) c(mean(x), sd(x)))
summary


library(dplyr)
#install.packages("MASS")
library(MASS)

#load the USA state dataset. It contains information about all 50 states
data(state)

# Let’s look at the data we will be using. We will be using the state.x77 dataset

head(state.x77)
dim(state.x77)

str(state.x77)
apply(state.x77, 2, mean)


apply(state.x77, 2, median)
apply(state.x77, 2, sd)
state.range <- apply(state.x77, 2, function(x) c(min(x), median(x), max(x)))
state.range



library(ggplot2) 
setwd('/home/abhay/Desktop/IMI')

Avian.Data = read.table("C:/Users/Jazz/Documents/Term III/DPA/plot_data.csv", sep=",", header=T)
head(Avian.Data)

tail(Avian.Data)

summary(Avian.Data)

kuchbhi = ggplot(data = Avian.Data, aes(x = Number.of.birds, y = Temperature))+
  geom_point()
kuchbhi

Scatter.2 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature))+
  geom_point()
Scatter.2

# Save the following scatter plot with a file name Scatter1.jpg in the current working directory
jpeg('Scatter1.jpg')
ggplot(data = Avian.Data, aes(x = Number.of.birds, y = Temperature))+
  geom_point()
dev.off()

# Another way to save the file
ggsave(file="Scatter1.png")

Scatter.3 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature))+
  geom_point()+
  theme_bw()

Scatter.3
### Changing the shape of data points
Scatter.4 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature))+
  geom_point(shape = 3)+
  theme_bw()

Scatter.4


### Removing or Adding Gridlines
Scatter.5 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature))+
  geom_point()+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())

Scatter.5


### Renaming Axes Labels
Scatter.6 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature))+
  geom_point()+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+  
  xlab("Number of Bird Species")+ylab("Temperature")

Scatter.6

### Changing Scale of Axes
Scatter.7 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature))+
  geom_point()+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+  
  xlab("Number of Bird Species")+ylab("Temperature")+
  scale_x_continuous(breaks = seq(0, 50, 5))+
  scale_y_continuous(breaks = seq(50, 90, 5))


Scatter.7

Scatter.8 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature))+
  geom_point()+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+  
  xlab("Number of Bird Species")+ylab("Temperature")+
  scale_x_continuous(breaks = seq(0, 50, 5))+
  scale_y_continuous(breaks = seq(50, 95, 5))+
  coord_cartesian(ylim = c(50, 91))


Scatter.8


### Changing Color of Data Points
Scatter.9 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature))+
  geom_point(color='#EA49EF')+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+  
  xlab("Number of Bird Species")+ylab("Temperature")+
  scale_x_continuous(breaks = seq(0, 50, 5))+
  scale_y_continuous(breaks = seq(50, 90, 5))

Scatter.9

#We can change the color of our data points to blue using color code *#314DEA*. 

Scatter.10 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature))+
  geom_point(color='#314DEA')+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+  
  xlab("Number of Bird Species")+ylab("Temperature")+
  scale_x_continuous(breaks = seq(0, 50, 5))+
  scale_y_continuous(breaks = seq(50, 90, 5))

Scatter.10

Scatter.11 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature))+
  geom_point(aes(color=climate))+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+  
  xlab("Number of Bird Species")+ylab("Temperature")+
  scale_x_continuous(breaks = seq(0, 50, 5))+
  scale_y_continuous(breaks = seq(50, 90, 5))

Scatter.11

# Rainbow consisting of 5 colors
Scatter.12 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature, 
                                           color = Number.of.birds))+
  geom_point()+
  scale_color_gradientn(colors = rainbow(5))+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+  
  xlab("Number of Bird Species")+ylab("Temperature")+
  scale_x_continuous(breaks = seq(0, 50, 5))+
  scale_y_continuous(breaks = seq(50, 90, 5))

Scatter.12

### Weighting Data Points

Scatter.13 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature, 
                                           size = Number.of.birds))+
  geom_point()+
  scale_color_gradientn(colors = rainbow(5))+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+  
  xlab("Number of Bird Species")+ylab("Temperature")+
  scale_x_continuous(breaks = seq(0, 50, 5))+
  scale_y_continuous(breaks = seq(50, 90, 5))

Scatter.13


#To visualize the relationship among these three continuous variables using both size and color, we simply add back our specification regarding *color = *
  
 
Scatter.14 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature, 
                                           size = Number.of.birds, color = Number.of.birds))+
  geom_point()+
  scale_color_gradientn(colors = rainbow(5))+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+  
  xlab("Number of Bird Species")+ylab("Temperature")+
  scale_x_continuous(breaks = seq(0, 50, 5))+
  scale_y_continuous(breaks = seq(50, 90, 5))

Scatter.14

### Organizing a Scatterplot by a Nominal Group (aka "Faceting")
Scatter.15 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature))+
  geom_point()+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+  
  xlab("Number of Bird Species")+ylab("Temperature")+
  scale_x_continuous(breaks = seq(0, 50, 5))+
  scale_y_continuous(breaks = seq(50, 90, 5))+
  facet_grid(.~Climate)

Scatter.15

#change the orientatin of our facets
Scatter.16 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature))+
  geom_point()+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+  
  xlab("Number of Bird Species")+ylab("Temperature")+
  scale_x_continuous(breaks = seq(0, 50, 5))+
  scale_y_continuous(breaks = seq(50, 90, 5))+
  facet_grid(Climate~.)

Scatter.16

### Adding Lines 
Scatter.17 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature))+
  geom_point(aes(color=Climate))+
  geom_smooth(color='black')+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+  
  xlab("Number of Bird Species")+ylab("Temperature")+
  scale_x_continuous(breaks = seq(0, 50, 5))+
  scale_y_continuous(breaks = seq(50, 90, 5))

Scatter.17


#If the loess line reveals that a linear relationship exists among the data points then we can add a linear line to any scatter by adding *method = "lm"* to this command, to indicate that we would like to fit a linear model ("lm"). By adding *se = TRUE* we specify that we would like to also see shaded area representing the standard error ("se"). 

Scatter.18 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature))+
  geom_point(aes(color=Climate))+
  geom_smooth(method = "lm", se = TRUE, color='black')+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+  
  xlab("Number of Bird Species")+ylab("Temperature")+
  scale_x_continuous(breaks = seq(0, 50, 5))+
  scale_y_continuous(breaks = seq(50, 90, 5))

Scatter.18

#If we would like to get rid of the standard error, we change this code to *se = FALSE*.

Scatter.19 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature))+
  geom_point(aes(color=Climate))+
  geom_smooth(method = "lm", se = FALSE, color='black')+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+  
  xlab("Number of Bird Species")+ylab("Temperature")+
  scale_x_continuous(breaks = seq(0, 50, 5))+
  scale_y_continuous(breaks = seq(50, 90, 5))

Scatter.19

# add lines for each sub-group of another variable, like **Climate** in this dataset.

Scatter.20 = ggplot(data = Avian.Data, aes(x = Number.of.species, y = Temperature))+
  geom_point(aes(color=Climate))+
  geom_smooth(method = "lm", se = FALSE, aes(color=Climate))+
  theme_bw()+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+  
  xlab("Number of Bird Species")+ylab("Temperature")+
  scale_x_continuous(breaks = seq(0, 50, 5))+
  scale_y_continuous(breaks = seq(50, 90, 5))

Scatter.20


## Density Plots

Density.1 = ggplot(data = Avian.Data, aes(Number.of.birds, fill=Climate))+
  geom_density(alpha = 1.0)+
  xlab("Number of Birds")+
  theme_bw()

Density.1


# Note, the color fill above was listed at **1.0**. If we change this to **0.3**. we will make it easier for us to visualize this overlap. 

Density.2 = ggplot(data = Avian.Data, aes(Number.of.birds, fill=Climate))+
  geom_density(alpha = 0.3)+
  xlab("Number of Birds")+
  theme_bw()

Density.2

# We can also plot the distribution of **Number of Species** by **Climate**. *Note, when doing this, ensure to change the variable we are plotting in the first line as well as the axis label in the third line of code.* 
  
Density.3 = ggplot(data = Avian.Data, aes(Number.of.species, fill=Climate))+
  geom_density(alpha = 0.3)+
  xlab("Number of Species")+
  theme_bw()

Density.3



