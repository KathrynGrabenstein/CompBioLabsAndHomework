#Computational Biology
#Kathryn Grabenstein
#Lab Four

#set working directory
setwd("~/Documents/Classes/Computational Biology/CompBioLabsAndHomework/Labs/Lab04")
#check working directory 
getwd()

#clear variable list from previous analyses 
rm(list=ls()) 

#Part I. Practice writing "for loops"
#step 1
#create vector with 10 ones
sequence <- seq(1,10)

#loop through each element in the vector and print "hi"
for ( i in sequence) {
  print ("hi")
}

#step 2 
#establish variables and paramters, no magic numbers! 
old_savings <- 10
allowance <- 5 
gum.cost <- 1.34
packs.bought <- 2
expenses <- gum.cost * packs.bought
time.gum <- seq (1,8)

#create pre-allocation vector
numGum <- length(time.gum)
cash.flow <- rep (0, numGum)

#loop through 8 weeks and total tim's funds
#amount earned is (savings + income) - expenses
#need to upddate 
for ( i in time.gum) {
  new_savings <- (old_savings + allowance) - expenses
  old_savings <- new_savings
  print (new_savings)
}

#step 3 
#calculate expected population size for shrinking population
#set up parameters
initpopsize <- 2000
growthrate <- 0.95
timeSamples <- seq (1,7)

#set up pre-allocation
NumTimes <- length(timeSamples)
abundance <- rep (0 , NumTimes)

#write for loop that calculates population size 
#for every element in timesamples (7 years), 
#take initial population size and multiply times 
#the growth rate to the power of the time stamp
for (i in timeSamples) {
  abundance[i] <- initpopsize * (growthrate ^ timeSamples [i])
  print(abundance[i])
}

#step 4 
#use discrete-time logistic growth equation for population abundance
#assign parameters
#growth rate
r= 0.8

#carrying capacity
K=10000 

#create sequence
Logistic.time <- seq (2,12)
Logistic.time


#set up pre-allocation
#need 12 values
Num.growth <- length(Logistic.time)
Logistic.growth <- rep (0 , Num.growth)
Logistic.growth[1] = 2500

#write for loop that calculates population abundances
for (t in Logistic.time) {
  Logistic.growth[t] <- (t - 1) + (r * (t - 1) * (K - (t - 1) / K))
  print( Logistic.growth[t] )
}
#print whole vector
Logistic.growth

#what is abundance at t[12]
Logistic.growth[12]

#step 5a
zero.vector <- rep(0, 18)
zero.vector

#step 5b
#for loop
for ( i in seq(1,18) ) {
  zero.vector [i] <- (i * 3)
}
print (zero.vector)

#step 5c
#repeat zero 18 times
zero.vector2 <- rep(0,18)

#replace first term with 1 
zero.vector2 [1] <- 1

#check vector
zero.vector2[1:18]
zero.vector2[2:18]

#step 5d
#construct 'for loop' that takes entry, multiplies by 2, and adds one
for (i in 2:18) {
  zero.vector2[i] <- (1 + (2 * zero.vector2[i - 1] ))
}
print (zero.vector2)

#step 6 
#construct fibonacci sequence

#create vector with 20 zeros, bc want first 20 numbers
fib.vector <- rep(0,20)

#replace second term with 1 
fib.vector[2] <- 1

#check vector
fib.vector
#off to a good start! 

#construct a 'for loop' that adds previous numbers together to generat the next
for ( i in 3:19) {
  fib.vector[i] <- (fib.vector[i-1] + fib.vector[i-2])
}
print(fib.vector)

#step 7
#re-do question 4, store all data
#use discrete-time logistic growth equation for population abundance
#assign parameters
#growth rate
r= 0.8

#carrying capacity
K=10000 

#create sequence
Logistic.time <- seq (2,12)
Logistic.time

time <- seq(1,12)

#set up pre-allocation
#need 12 values
Num.growth <- length(Logistic.time)
Logistic.growth <- rep (0 , Num.growth)
Logistic.growth[1] = 2500

#write for loop that calculates population abundances
for (t in Logistic.time) {
  Logistic.growth[t] <- (t - 1) + (r * (t - 1) * (K - (t - 1) / K))
  print( Logistic.growth[t] )
}
#print whole vector
abundance1 <- Logistic.growth

#graph
plot(time, abundance1, xlab = "Time (years)", 
     ylab ="Population Size (n)", main = "Logistical growth of population",
     pch = 19, col = "dodgerblue")
