# README for Lab 08 in Computational Biology

## Lab 08 Assignment
For Lab 08, I constructed a  R script that contains: 
*  A for-loop that uses a discrete-time logistic growth equation to model population abundance
* A custom function that turns the discrete-time logistic growth equation into a function
* Code to write the output from the function to a csv 

Details about this custom function appear below. 

##  Custom function (logisticGrowModel) in R 
The custom function I created in R:
* Generates a logistical growth model following [Lotka Volterra Equations](https://en.wikipedia.org/wiki/Lotka%E2%80%93Volterra_equations)
* Saves the output to amatrix (time, abundance)
* Plots the output (time, abundance)

###  logisticGrowModel Function Details
This function takes 4 arguments:
* r (growth rate)
* K (carrying capacity)
* g (total number generations)
* p (inital population size)

1) It creates a vector with length g
` logisticTime <- seq (1, g) `

2) and then sets up a pre-allocation vector for the model 
```
numGrowth <- length(logisticTime)
logisticGrowth <- rep (0 , numGrowth)
``` 
3) Next, the initial population is stored in this pre-allocation vector
`  logisticGrowth[1] = p `

4) The function that uses a for-loop and the Lotka-Volterra equation for population growth to calculate step-wise population abundances
```
for (i in 2:length(logisticGrowth)) {
logisticGrowth[i] <- logisticGrowth[i - 1] + (r * logisticGrowth[i - 1] * (K - logisticGrowth[i - 1]) / K)
}
```
5) Then, the output from the for-loop is stored as a maxtrix
` PopGrowthMatrix <- cbind(logisticTime, logisticGrowth) `

6) Next, the function plots the output
```
plot(logisticTime, logisticGrowth, xlab = "Number Generations", 
ylab ="Population Size (n)", main = "Logistical growth of population",
pch = 19, col = "dodgerblue")
```
7) Finally, the returns the output 
` return(PopGrowthMatrix) `


### An example plot from the model output
[Sample output plot](LogisticGrowthPlot.png)

## Testing the function
After constructing the function, line 91 calls the function on sample data and stores the output
`PopGrowResults <- logisticGrowModel(0.5, 50000, 40, 1000) `
Here, r (growth rate) = 0.5, K (carrying capacity) = 50,000, g (number generations) = 40, and p (initial population size)= 1000

## What data written to file 
After the results are generated and stored, lines 95 & 96 write the output to a comma-separated variable with the name **PopGrowthResults.csv**
```
write.csv(x = PopGrowResults, file = "PopGrowthResults.csv", 
row.names = FALSE)
```


