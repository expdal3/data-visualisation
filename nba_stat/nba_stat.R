library(dplyr)
library(plyr)
library(data.table)
## read in csv ad text file
dataset = read.csv("C:\\Users\\uC260543\\Work\\DataSciencePractices\\R\\nba-players-stats\\Seasons_Stats.csv",header=T)
dataset <- data.frame(dataset)
colnames(dataset)
#head(dataset,5)

dataset[is.na(dataset)]<-0   #replace NA with 0
#subset = dataset[dataset$Year >=2000,] #just take rows after 2000
#head(dataset,5)
#summary(subset)


## calculate sum of 3points in one year per player
dset <- aggregate(X3P~Player + Year, data=dataset, FUN=sum)
#head(arrange(dset,desc(Player)), n = 200) #display result
#group_by(dset, Player)

## CREATE 1 and 2 LAG 
dset <- as.data.table(dset) #convert to data.table
#dset2 <- dset1[, lag.X3P:=c(0, X3P[-.N]), by=Player]
dset1 <- dset[, lag.X3P:=lag(X3P,1, 0), by=Player]
dset1 <- dset1[, lag2.X3P:=lag(X3P,2, 0), by=Player]
head(arrange(dset1,desc(Player)), n = 100) #display result

          