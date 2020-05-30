library (ggplot2)

HumorData <- read.table("C:/Users/Jazz/Documents/Term III/DPA/HumorData_50.csv", sep=",", header=T)
str(HumorData)
### **Attending to missing data**
HumorData$Age<-ifelse(HumorData$Age==-1,NA,HumorData$Age)

### **Make variables into factors**
HumorData$Gender<-as.factor(HumorData$Gender)
HumorData$College<-as.factor(HumorData$College)
HumorData$Gender
HumorData$College
### **Quick descriptive information** 
summary(HumorData)
with(HumorData, summary(Gender))
with(HumorData, summary(College))
with(HumorData, summary(Age))
with(HumorData, summary(Funniness))

GenderMeans = with(HumorData, by(Funniness, Gender, median))
GenderMeans 

CollegeMeans = with(HumorData, by(Funniness, College, mean))
CollegeMeans 

tapply(HumorData$Funniness,
       list(HumorData$Gender,HumorData$College), mean)

GenderPlot1 = ggplot(HumorData, aes(x = Gender, y = Funniness)) + geom_boxplot() 
GenderPlot1

CollegePlot1 = ggplot(HumorData, aes(x = College, y = Funniness)) + geom_boxplot()
CollegePlot1

# flip these box-plots from a vertical orientation
GenderPlot1_FLIP = ggplot(HumorData, aes(x = Gender, y = Funniness)) + geom_boxplot() + coord_flip()
GenderPlot1_FLIP 

CollegePlot1_FLIP = ggplot(HumorData, aes(x = College, y = Funniness)) + geom_boxplot() + coord_flip()
CollegePlot1_FLIP


####**Customizing Outliers**

CollegePlot2 = qplot(College, Funniness, data=HumorData, geom=("boxplot"), 
                     main="Humor Chart",xlab="Education Level", ylab="Self-Rated Funniness")
CollegePlot2 

# We can expand upon the code from above to further customize our boxplots. 
# The plot below is a jitter boxplot, meaning that the actual data points of 
# self-rated funniness are overlayed on the plot. 
# Following the same instructions as above (this time using Gender 
# instead of College) but combining geom=c("boxplot", "jitter") we can 
# create a jitter boxplot.


JitterPlot = qplot(Gender, Funniness, data=HumorData, geom=c("boxplot", "jitter"), 
                   main="Humor Chart",xlab="Gender", ylab="Self-Rated Funniness")
JitterPlot 


# Faceted Boxplots
# Faceted plots are useful if you want to essentially look at two different 
# boxplots at the same time but divided by the levels of one of your 
# categorical variables. There are many times when you may want a boxplot
# that looks at the potential interaction of two categorical variables. 
# Here I am looking at how self-percived funniness may differ as 
# function of both gender and education. Using the ggplot () function.
# The following code is very similar to the simple boxplot code from 
# our original GenderPlot1. I have simply added to the end
# facet_grid(~College) indicating that College is the variable that 
# I want R to use to divide up the boxplots.

FacetPlot1 = ggplot(HumorData, aes(x=Gender, y=Funniness)) + 
  geom_boxplot() + facet_grid(~College) 
FacetPlot1


FacetPlot2 = ggplot(HumorData, aes(x=Gender, y=Funniness, label=ID)) + 
  geom_boxplot(outlier.size=3,outlier.shape=5,outlier.colour="purple") + 
  facet_grid(~College) 

FacetPlot2


####**Adding Color to Your Plots**
FacetPlot3 = ggplot(HumorData, aes(x=Gender, y=Funniness, fill=Gender)) + 
  geom_boxplot() + facet_grid(~College) + scale_fill_brewer(palette = "Set1")
FacetPlot3


# Boxplots Using Multuple Categorical Variables Without Facets
CombinedPlot=ggplot(HumorData, aes(x=College, y=Funniness, fill=Gender)) + geom_boxplot() 
CombinedPlot





################################################
data (diamonds)
head (diamonds)
hist (diamonds$carat, main="Carat Histogram", xlab="Carat")
plot (price ~ carat, data=diamonds)

# Drawing the histogram
ggplot (data=diamonds) + geom_histogram ( aes (x=carat))

## Density graph instead of histogram
ggplot (data=diamonds) + geom_density ( aes (x=carat), fill="grey50")


# save basics of ggplot object to a variable
g <- ggplot (diamonds, aes (x=carat, y=price))

#Going forward we can add any layer to g . Running g + geom_point() would re-create the graph

g + geom_point ( aes (color=color))



# ggplot2 also has the ability to make faceted plots, or small multiples. \
# This is done using facet_wrap or facet_grid. facet_wrap takes the levels 
# of one variable, cuts up the underlying data according to them, makes a 
# separate pane for each set and arranges them to fit in the plot.

g + geom_point ( aes (color=color)) + facet_wrap (~color)

g + geom_point ( aes (color=color)) + facet_wrap (~color)

g + geom_point ( aes (color=color)) + facet_grid (cut~clarity)

# Faceting also works with histograms or any other geom

ggplot (diamonds, aes (x=carat)) + geom_histogram () + facet_wrap (~color)

## ggplot2 Boxplots and Violins Plots

# ggplot2 offers a boxplot geom through geom_boxplot.
# Even though it is one-dimensional, using only a y aesthetic, 
# there needs to be some x aesthetic, so we will use 1.

ggplot (diamonds, aes (y=carat, x=1)) + geom_boxplot ()


# This is neatly extended to drawing multiple boxplots, one for each 
# level of a variable, as seen in Figure below.
ggplot (diamonds, aes (y=carat, x=cut)) + geom_boxplot ()

ggplot (diamonds, aes (y=carat, x=cut)) + geom_violin ()

ggplot (economics, aes (x=date, y=pop)) + geom_line ()

## Strip Chart
?stripchart
x <- stats::rnorm(50)
xr <- round(x, 1)
stripchart(x)


## Mosaic Plots
UCBAdmissions

# mosaic plot in R with mosaicplot function

mosaicplot(UCBAdmissions, sort = 3:1,
           col = hcl(c(120, 10)),
           main = "Student admissions at UC Berkeley")


## Plotting multiple graphs in a single window

# make labels and margins smaller
par(cex=0.7, mai=c(0.1,0.1,0.2,0.1))
Temperature <- airquality$Temp
# define area for the histogram
par(fig=c(0.1,0.7,0.3,0.9))
hist(Temperature)
# define area for the boxplot
par(fig=c(0.8,1,0,1), new=TRUE)
boxplot(Temperature)
# define area for the stripchart
par(fig=c(0.1,0.67,0.1,0.25), new=TRUE)
stripchart(Temperature, method="jitter")






