#install.packages("ade4")
library(ggplot2)
library(psych)
library(reshape2)
library(ade4)
setwd('/Documents/MOOC-stat')
data <- read.csv2('Geraud.csv', sep=';', header=T)

round(cor(data),3)

acp7 <- dudi.pca(data, center = T, scale = T, scannf = F, nf=7)
round(acp7$co, 2)
round(inertia.dudi(acp7,col.inertia = T)$TOT, 3)

acp2 <- dudi.pca(data, center = T, scale = T, scannf = F, nf=2)
round(rowSums(acp2$co^2), 2)
round(acp2$co, 2)
