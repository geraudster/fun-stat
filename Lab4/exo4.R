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
aggregate(sorted$rank, by=list(sorted$variable), FUN=sum)

