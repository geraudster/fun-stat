#install.packages("ade4")
install.packages("gridExtra")
library(ggplot2)
library(psych)
library(reshape2)
require(gridExtra)
setwd('/Documents/MOOC-stat')
data <- read.csv2('Lab3/lab3.csv', sep=';', header= F)

distance <- round(dist(data, method= "euclidean", upper=T), 2)
distance.max <- hclust(distance, method="complete")
plot(distance.max)

distance.min <- hclust(distance, method="ward")
plot(distance.min)

classif <- read.csv2('Lab3/lab3-classif.csv', sep=';', header= T)
describeBy(classif, classif$Max3)

alldata<- read.csv2('Lab3/lab3-data.csv', sep=';', header= T)

alldataclassif <- cbind(1, classif, alldata)

describeBy(alldataclassif[14:20], classif$Max3)
alldataclassif$Max3 <- factor(alldataclassif$Max3)
plot1 <- ggplot(alldataclassif, aes(x=Max3, y=Var1, fill=Max3)) + stat_boxplot(geom ='errorbar') + geom_boxplot()
plot2 <- ggplot(alldataclassif, aes(x=Max3, y=Var2, fill=Max3)) + stat_boxplot(geom ='errorbar') + geom_boxplot()
plot3 <- ggplot(alldataclassif, aes(x=Max3, y=Var3, fill=Max3)) + stat_boxplot(geom ='errorbar') + geom_boxplot()
plot4 <- ggplot(alldataclassif, aes(x=Max3, y=Var4, fill=Max3)) + stat_boxplot(geom ='errorbar') + geom_boxplot()
plot5 <- ggplot(alldataclassif, aes(x=Max3, y=Var5, fill=Max3)) + stat_boxplot(geom ='errorbar') + geom_boxplot()
plot6 <- ggplot(alldataclassif, aes(x=Max3, y=Var6, fill=Max3)) + stat_boxplot(geom ='errorbar') + geom_boxplot()
plot7 <- ggplot(alldataclassif, aes(x=Max3, y=Var7, fill=Max3)) + stat_boxplot(geom ='errorbar') + geom_boxplot()
grid.arrange(plot1, plot2, plot3, plot4, plot5, plot6, plot7, ncol=3)
