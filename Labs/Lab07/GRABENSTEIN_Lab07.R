#Computational Biology
#Kathryn Grabenstein
# 1 March 2019
#Lab 07

#set working directory
setwd("~/Documents/Classes/Computational Biology/CompBioLabsAndHomework/Labs/Lab07")
#check working directory 
getwd()

#clear variable list from previous analyses 
rm(list=ls()) 

#Writing your own functions
#Part 1

###########

#Problem 1
#Write a function that calculates and returns the area of a triangle
#when given base and height

#define function
triangleArea <- function(b, h) {
  #given base and height (b, h)
  #multiply base times height times 1/2
  area <- (b * h *0.5)
  #then show area
  return(area)
}

#Test function's usage
triangleArea(12, 4)

#suppose triangle with base of 10 and height of 9

triangleArea(10, 9)
9*0.5 == triangleArea(10,9)

#######

#Problem 2
#write a function that returns the absolute value of a number
# or every value in a numeric vector

#function requires single argument (number or vector to return absolute value)
myAbs <- function(x) {
  
  #create loop bc want to work with vectors
  for (i in 1:length(x)) {
    
    #if number is positive, return number (already absolute value'd)
    if (x[i] >= 0) {
      
      
      #if number negative, need to remove negative sign
    } else {
      x[i] <- (x[i] * -1)
    }
  }
  return(x)  
}

#test function
#positive scaler
myAbs(5)

#negative scaler
myAbs(-2.3)

#vector with positive and negatives
myAbs(c(1.1, 2, 0, -4.3, 9, -12))

#########

#Problem 3
#write a function that returns a vector of the first 'n' numbers 
#from the fibonacci sequence where n >= 3


#construct function with arguments

myFib <- function(n,s) {
  #check if n is greater than 3
  #if not, return FALSE
  if (n <= 3 | s > 1) {
    return(FALSE)
    
  } else {
    #number of integers returned
    #construct fibonacci sequence
    #create vector with n zeros, bc want first n numbers
    fib.vector <- rep(1,n)
    fib.vector[1] <- s
    
    #construct a 'for loop' that adds previous numbers together to generat the next
    for ( i in 3:length(fib.vector)) {
      fib.vector[i] <- (fib.vector[i-1] + fib.vector[i-2]) 
    } 
  }
  return(fib.vector)
}

#test function
#check that makes vector
myFib(16,1)

#check that error messages work
myFib(2,1)

#check error message
myFib(12,4)

#yey!

#########
#Problem 4 
#4a
#write a function that takes two numbers as argument and
#returns square of the difference between them

mySqrDiff <- function(y,z) {
  sqr <- ((y-z) ^ 2)
  return (sqr)
}

#test function
#two scalars
mySqrDiff(3,5)

#vector and scalar
mySqrDiff(c(2, 4, 6), 4)

#Part 4b
#write function that cacluates average of vector of numbers
myMean <- function(x) {
    sum(x) / length(x)
}

#check function works on vector
myMean(c(5,15,10))

#check that function works by importing data frame from folder
#import data from folder to console
DataforLab07 <- read.csv("DataForLab07.csv")

#check the function works for dataframe
myMean(DataforLab07$x)

#create function that calculates sum of squares
mySumSqr <- function (q) {
  #calculate mean
  mean <- myMean(q)
  
  #subtract data value from mean and sum all diffs
  sum(mySqrDiff(q, mean))
  
}

#test new function on data imported from git hub
mySumSqr(DataforLab07$x)

