library(rmarkdown)

#setwd("~/Desktop/TUTORIALS/IMI/")
#' ---
#' title: "Basic Of R - Introduction "
#' author: "Abhay Bhadani"
#' date: "January 4th, 2020"
#' ---

# Basic Maths

1+2+3

2 * 5 + 5

3*5*7

4/3
4*5+5
4*(5+3)

#Variables
o = 9
o




x <- 2
x
x+2


y=3
y

3 -> z
z


a <- z <- 3
z
a

Z <- 7L
Z
class(Z)
is.integer(Z)

is.finite(Z)
is.numeric(Z)
Z="DELHI"
class(Z)
 Z+"2"


assign("d",5)
d


rm(d)
rm



class(z)

# Numeric Data
is.numeric(x)

i <- 5L
i
is.integer(i)
is.numeric(i)

class(4L)

class(2.9)
class("saloni")
y <- factor ("data")
y

x="Hello"
nchar (x)
nchar ("vijaya")

nchar ("452")


#nchar (y)

date1 <- as.Date ("2012-06-28")
date = "2020-11-28"
class(date)
class (date1)


date2 <- as.POSIXct ("2012-06-28 17:42")
class (date2)
as.numeric (date2)

x <- c (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
x
class(x)

x<=5

y <- c(10:1)
y

x>y

length(x)

# creates a three element list
x <- list (10, 22, 33)
class(x)
length(x)
x
x[2]
x[3]

# creates a single element list
# the only element is a vector that has three elements
y<- list ( c (1, 2, 3),28,89)
class(y)
length(y)
y
y[2]
y[1]
y[[1]][2]

class(c(3:7))
list3 <- list ( c (1, 2, 3), 3:7)
length(list3)
list3[1]
list3[2]
list4 <- list ( c (1, 2, 3), 3,4:7)
length(list4)

A<- matrix (1:10, nrow=5)
A

B<- matrix (21:30, nrow=5)
B

C <- matrix(1:9, nrow=3, byrow=TRUE)
C


nrow(A)
ncol(A)

dim(A)
# Elelment wise Addition
A + B

#Elelment wise Multiplication
A * B

t(B)

#Matrix Multiplication
Z <- A %*% t (B)
Z
dim(Z)
# Renaming the columns
A
colnames (A) <- c ("Left", "Right")
rownames (A) <- c ("1st", "2nd", "3rd", "4th", "5th")
A


library (magrittr)
x <- 1:10
x
mean (x)
min(x)
max(x)
median(x)
summary(x)


z<- (2:10)
z
sum(z)


z <- c (1, 2, NA, 8, 3, NA, 3)
z
sum(z)

# we want to find out how many NA s are present
is.na (z)
sum(is.na(z))

theArray <- array (1:12, dim= c (2, 3, 2))
theArray



theArray[1, , ]












# Data Frames

x <- 10:1
y <- -4:5
q <- c ("Hockey", "Football", "Baseball", "Curling", "Rugby",
        "Lacrosse", "Basketball", "Tennis", "Cricket", "Soccer")
length(x)
length(y)
length(q)

class(x)
class(y)
class(q)

drf <- data.frame (x, y, q)

drf

dim(drf)
#First Column
theDF[1]
# Accessing 1st Row and 2nd Col
theDF[1,2]

theDF <- data.frame (First=x, Second=y, Sport=q)
theDF
names (theDF)
names (theDF)[3]
rownames (theDF)
rownames (theDF) <- c ("One", "Two", "Three", "Four", "Five", "Six","Seven", "Eight", "Nine", "Ten")
rownames (theDF)
theDF
# row 3, columns 2 through 3
theDF[3, 2:3]

# all of columns 2 through 3
theDF[, 2:3]

# all of row 2
theDF[2, ]

theDF[, c ("First", "Sport")]
theDF[, "Sport"]
class (theDF[, "Sport"])
class (theDF["Sport"])











# Reading data from a CSV

theUrl <- "http://www.jaredlander.com/data/TomatoFirst.csv"
#Reading directly from the URL
tomato <- read.table (file=theUrl, header=TRUE, sep=",")
# Reading from a local file
#tomato <- read.table (file='TomatoFirst.csv', 
#                      header=TRUE, sep=",")

tomato
dim(tomato)

colnames(tomato)

summary(tomato[,c("Price","Texture")])


head(tomato)
head(tomato, n=7)
tail(tomato)

# Read from Excel Data

download.file(url='http://www.jaredlander.com/data/ExcelExample.xlsx', destfile='data/ExcelExample.xlsx', method='curl')

library (readxl)
install.packages('readxl')
 excel_sheets ('data/ExcelExample.xlsx')
tomatoXL <- read_excel ('data/ExcelExample.xlsx')


library(ggplot2)
data (diamonds)
head (diamonds)
hist (diamonds$carat, main="Carat Histogram", xlab="Carat")
plot (price ~ carat, data=diamonds)


#rmarkdown::render("~/Desktop/TUTORIALS/IMI/Session1_2.R")

  