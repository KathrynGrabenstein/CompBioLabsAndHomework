# Computational Biology
# Kathryn Grabenstein
# Lab Seven

#Set working directory
setwd("~/Documents/Classes/Computational Biology/CompBioLabsAndHomework/Labs/Lab08/")
#check working directory 
getwd()

#clear variables
rm(list=ls())

# part I 
# part a
#use discrete-time logistic growth equation for population abundance
#assign parameters
#growth rate
r = 0.8

#carrying capacity
K = 10000 

#create sequence
#time intervals
time <- 12
Logistic.time <- seq (1, time)
Logistic.time

#set up pre-allocation
#need 12 values
Num.growth <- length(Logistic.time)
Logistic.growth <- rep (0 , Num.growth)
Logistic.growth[1] = 2500
Logistic.growth

#write for loop that calculates population abundances
for (t in 2:length(Logistic.growth)) {
  Logistic.growth[t] <- Logistic.growth[t - 1] + (r * (Logistic.growth[t - 1]) * (K - (Logistic.growth[t - 1])) / K)
  print( Logistic.growth[t] )
}
#print whole vector
abundance1 <- Logistic.growth
time <- Logistic.time

#graph
plot(time, abundance1, xlab = "Time (years)", 
     ylab ="Population Size (n)", main = "Logistical growth of population",
     pch = 19, col = "dodgerblue")

##################################

#part b
#turn this code into a function
logisticGrowModel <- function(r, K, g, p) {
  #give r (growth rate)
  #give K (carrying capacity)
  #give g (total number generations)
  #give p (inital population size)
  
  #create vector with all generations
  logisticTime <- seq (1, g)
  
  #set up pre-allocation with same length as time vector
  numGrowth <- length(logisticTime)
  logisticGrowth <- rep (0 , numGrowth)
  
  #set starting population size using given p 
  logisticGrowth[1] = p
  
  #write for loop that calculates population abundances
  for (i in 2:length(logisticGrowth)) {
    logisticGrowth[i] <- logisticGrowth[i - 1] + (r * logisticGrowth[i - 1] * (K - logisticGrowth[i - 1]) / K)
  }
  
  #make matric of results
  PopGrowthMatrix <- cbind(logisticTime, logisticGrowth)
  
  #part c 
  #plot output
  plot(logisticTime, logisticGrowth, xlab = "Number Generations", 
       ylab ="Population Size (n)", main = "Logistical growth of population",
       pch = 19, col = "dodgerblue")
  
  return(PopGrowthMatrix)
  
}

#part d
#call the function
#r, K, g, p
PopGrowResults <- logisticGrowModel(0.5, 50000, 40, 1000)
colnames(PopGrowResults) <- c("Generations", "Abundance")

#part e
write.csv(x = PopGrowResults, file = "PopGrowthResults.csv", 
          row.names = FALSE)









