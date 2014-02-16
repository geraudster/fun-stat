library(reshape2)

# Données initiales
A <- c(8,9,4,8,8, NA)
B <- c(7,2,5,7,5,3)

# Merge et tri des donnees
data <- data.frame(A,B)
merge <- melt(data, na.rm=T)
sorted <- merge[order(merge$value),]

# Calcul des rangs
sorted$rank <- rank(sorted$value)
sorted

# Totaux des rangs par groupe
agg <- aggregate(sorted$rank, by=list(sorted$variable), FUN=sum)

nbA = length(na.omit(A))
agg[1,2] - (nbA * (nbA + 1))/2

nbB = length(na.omit(B))
agg[2,2] - (nbB * (nbB + 1))/2

wilcox.test(A,B)
wilcox.test(B,A)
t(sorted)

wilcox.test(data[4,1], data[4,2], paired=T)

setwd('/Documents/MOOC-stat/Lab1')
alldata <- read.csv2('Geraud.csv', sep=';', header=T)
wilcox.test(alldata$Var4, alldata$Var6, paired=T)

wilcox.test(alldata$Var3, alldata$Var5, paired=T)


require (ggplot2)
long <- melt(alldata)

ggplot(subset(long, variable == 'Var4' | variable == 'Var6'), aes (x=value, colour=variable)) +
  geom_density()

ggplot(subset(long, variable == 'Var3' | variable == 'Var5'), aes (x=value, colour=variable)) +
  geom_density()
