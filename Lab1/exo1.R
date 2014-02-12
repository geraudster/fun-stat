library(ggplot2)
library(psych)
library(reshape2)

setwd('/Documents/MOOC-stat')

data <- read.csv2('Geraud.csv', sep=';', header=T)
datam <- melt(data)
describe(data)
summary(data)

sd(data$Var1)
sd(data$Var2)
sd(data$Var3)
sd(data$Var4)
sd(data$Var5)
sd(data$Var6)
sd(data$Var7)

var(data$Var1)
var(data$Var2)
var(data$Var3)
var(data$Var4)
var(data$Var5)
var(data$Var6)
var(data$Var7)

ggplot(datam, aes(x=value, fill=variable)) + geom_histogram(binwidth=5,position="dodge")
ggplot(datam, aes(x=variable, y=value, fill=variable)) + stat_boxplot(geom ='errorbar') + geom_boxplot()
