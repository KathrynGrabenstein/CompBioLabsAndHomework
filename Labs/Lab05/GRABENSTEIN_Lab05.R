#Computational Biology
#Kathryn Grabenstein
#Lab 05

#set working directory
setwd("~/Documents/Classes/Computational Biology/CompBioLabsAndHomework/Labs/Lab05")
#check working directory 
getwd()

#clear variable list from previous analyses 
rm(list=ls()) 

#load packages
library(ggplot2)

#part one, practice some simple conditionals
#step one
#create if-else loop that evaluates if x is greater than 5 
#and prints if greater or less than 5 

#assign value to x
x <- 4 

#create if-else loop that evaluates x relative to 5
if (x > 5) {
  print(paste("", x, "is greater than 5"))
} else {
  print(paste("", x , "is less than 5"))
}

#step 2
#import Vector1.csv
#using terminal
#cp Vector1.csv /Users/kathryngrabenstein/Documents/Classes/Computational Biology/
#CompBioLabsAndHomework/Labs/Lab05

#import csv
Vector <- read.csv("Vector1.csv")
#
head(Vector)

#step 2a
#for loop that checks each value and replaces negative value with NA
for (i in 1:length(Vector$x)) {
  if (Vector$x[i] < 0) {
      Vector$x[i] <- NA
  }
}
head(Vector)

#step 2b
#using vectorized code, use logical indexing, replace NA with NaN
#create vector with input from csv
myVec <- Vector$x
#view first lines
head(myVec)

#test if values are NA
#run through every value of myVec and test is.na and store in new vector
NAomit <- is.na(myVec)
head(NAomit)

#use logical indexing to replace TRUE values with NaN
#test T or F values of myVec and if true, assign NaN
myVec [NAomit] <- NaN

#print head of vector
head(myVec)

#step 2c 
#replace NaN with zero using numerical indexing
#test if each value in myVec is NAN and store in new vector, NANomit
NANomit <- which(is.nan(myVec))
#check new vector
NANomit

#use numerical indexing of NANOmit to check which values TRUE and assign zero
#check which positions of elements in vector have NaN
myVec [NANomit]

#assign those positions a value of zero
myVec [NANomit] <- 0

#check new vector
head(myVec)  
myVec

#step 2d
#how many values in imported data fall between 50 AND 100
#for loop with if statement
#start count at 0
count <- 0
#for loop that moves through each element in vector and tests if greater than or equal to 50
#AND less than or equal to 100
#and if both conditions TRUE, adds 1 to count and assigns new value to count
#and prints the new value of count then takes next trip through loop
#if conditions not both TRUE, prints 0

for (i in 1:length(myVec)) {
  if (myVec[i] >= 50 & myVec[i] <= 100) {
    count <- count + 1 
    print(count)
  } else{
    print(0)
  }
}
#there are 498 values that are between 50 and 100, inclusively

#step 2e
#because we know how large this vector should be, we can pre-allocate
FiftytoOneHundred <- rep(0, 498 )

#vectorize, don't need to index, move through every element in vector
fiftyhund <- (myVec >= 50 & myVec <= 100)
fiftyhund
#move numerical index to the pre-allocated vector
FiftytoOneHundred <- myVec[fiftyhund]

#check new vector
FiftytoOneHundred

#step 2f 
FiftytoOneHundred.csv <- write.csv(FiftytoOneHundred, "")

######
#Problem 3
#what was the first year gas emissions were non-zero?

#import csv
C02 <- read.csv("CO2_data_cut_paste.csv")
#assign vector to single variable 
gas <- C02$Gas
year <- C02$Year

#construct threshold
threshold <- 0

#calculate the first index location where gas is greater than 1
year.non0 <- min(which(gas > threshold))

#what year was the firt gas emissions non-zero?
year[year.non0]
#1885, industrial revolution?

#Part 3b
#which years were TOTAL emissions between 200 and 300 million metric tons of carbon?
#create vector for TOTAL emissions
total.emission <- C02$Total

#construct thresholds
Upper.thresh <- 300
Lower.thresh <- 200

#calculate which years emissions were between 200 & 300 and assign to variable
year.carbon <- which( total.emission <= Upper.thresh & total.emission >= Lower.thresh)

#find index locations within year vector
year[year.carbon]

##############
#Part II
#Loops, Conditionals, & Biology

#step 1
#set up the parameters
totalGenerations <- 1000
initPrey <- 100 	# initial prey abundance at time t = 1
initPred <- 10		# initial predator abundance at time t = 1
a <- 0.01 		# attack rate
r <- 0.2 		# growth rate of prey
m <- 0.05 		# mortality rate of predators
k <- 0.1 		# conversion constant of prey into predators

#pre-allocation step
#step 2
#create time vector, need one less than everything else
time <- seq(1, totalGenerations)

#create vector with n through time
prey <- rep(0, totalGenerations)
prey[1] <- initPrey


#create vector for prey through time
pred <- rep(0, totalGenerations)
pred[1] <- initPred

#step 3 
#for loop that moves through pred and prey equations
for (t in 2:totalGenerations) {
  prey[t] <- prey[t-1] + (r * prey[t-1]) - (a * prey[t-1] * pred[t-1])
  pred[t] <- pred[t-1] + (k * a * prey[t-1] * pred[t-1]) - (m * pred[t-1])
  
      #step 4, add if statement to evaluate for negative numbers
        if (prey[t] < 0) {
          prey[t] <- 0
        } 
}

#step 5
#plot prey by time and add lines with pred
plot(x = time, y = prey, main = "Lotka-Volterra Predator Prey Model")
lines( time, pred)

#create matrix
#not sure how to get rid of magic number 3 for columns here
myResults <- matrix( data = NA, nrow = totalGenerations, ncol = 3)

#assign row names by time stamp
row.names(myResults) <- seq(1, totalGenerations)

#assign column names
colnames(myResults) <- c("TimeStep", "PreyAbundance", "PredatorAbundance")

#assign time stamp to first column
myResults[,1] <- time

#assign prey values to second column
myResults[,2] <- prey

#assign pred values third column
myResults[,3] <- pred

#write matrix to a csv
write.csv(x = myResults, file = "PredPreyResults.csv")

  