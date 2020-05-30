data(iris)

View(data)
head(iris)
tail(iris)
dim(iris)
names(iris)
glimpse(iris)
iris$Sepal.Length
iris$Species
mean(iris$Sepal.Length)
summary(iris)
library(ggplot2)
ggplot(iris,aes(Sepal.Length))+ geom_histogram(bins = 30)
ggplot(iris,aes(Sepal.Length, Sepal.Width, col= Species))+ geom_point()
