# Computational Biology
# Kathryn Grabenstein
# Lab Eleven (where did lab ten go?)
#Graphing, subsetting, filtering data 

#install libaries for work 
library(dplyr)
library(ggplot2)

#set working directory
setwd("~/Documents/Classes/Computational Biology/CompBioLabsAndHomework/Labs/Lab11")

#check working directory
getwd()

#import data
Wood <- read.csv("GlobalWoodDensityDatabase.csv", stringsAsFactors = F)
head(Wood)

#rename density column because it is really long and cumbersome
#check existing column names
colnames(Wood)

#Change 4th column (sorry for the magic numbers)
colnames(Wood)[4] <- "Density"

#check change
colnames(Wood)
head(Wood)
#yey! 

#Part II: Working with density data
#removing rows with missing data

#4a
#find rows with missing data using logical indexing
removeRow <- which(is.na(Wood$Density))

length(Wood$Density)

#4b
#remove this row from the dataframe
filteredWood <- Wood[-c(removeRow), ]

#check length
length(filteredWood$Density)

#check if dataframes equal to each other
length(filteredWood$Density) == length(Wood$Density)

#5
#create dataframe that has
#each species listed once
#family & binomial
#mean density measurements for each species

Species <- unique(filteredWood$Binomial)
length(Species)
head(Species)

#create dataframe 8412 long, 3 columns


# Density = mean
#dplyr calculate mean for unique family names
subsetWood <- filteredWood %>%
  group_by(Binomial)  %>%
  summarise(meanDensity = mean(Density), n = n()) %>%
  ungroup %>%
  as.data.frame()

#check length
nrow(subsetWood)
dim(subsetWood)
as.data.frame(subsetWood)
typeof(subsetWood)

#sort by unique values in binomial but keep rows intact
intactRow <- distinct(filteredWood, Binomial, .keep_all = TRUE)
head(intactRow)

#create new column in subset dataset and add Family from intact row 
subsetWood$Family <- intactRow[2]
subsetWood

#rearrange columns 
#get existing order
colnames(subsetWood)

#reorder
subsetWood <- subsetWood[ ,c(1,4,2,3)]
head(subsetWood)
typeof(subsetWood)

#6
#contrasting most and least dense families 
#make new dataframe with means by family
familyMean <- filteredWood %>%
  group_by(Family)  %>%
  summarise(meanDensity = mean(Density), n = n()) %>%
  ungroup %>%
  as.data.frame()

head(familyMean)
nrow(familyMean)

#6b sort family mean dataframe by mean values 
sortedFamilyMean <- arrange(familyMean, meanDensity)

#6c
#densest families
densestFamilies <- tail(sortedFamilyMean, 8)
densestFamilies

#least dense families
leastDenseFamilies <- head(sortedFamilyMean, 8)

#Part III: Plotting
#make facet plot with families with most and least dense wood

plot <- ggplot(subsetWood, aes(x = Binomial, y = meanDensity, group = Family)) +
      geom_boxplot()
plot

facet_wrap(~Family, nrow = 2)



