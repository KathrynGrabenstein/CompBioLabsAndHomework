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
  group_by(Binomial, Family)  %>%
  summarise(meanDensity = mean(Density), n = n()) %>%
  ungroup %>%
  as.data.frame()

#check length
nrow(subsetWood)
dim(subsetWood)
as.data.frame(subsetWood)

head(subsetWood)
typeof(subsetWood)
class(subsetWood)

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
head(sortedFamilyMean)

#6c
#densest families
densestFamilies <- tail(sortedFamilyMean, 8)
densestFamilies

str(densestFamilies)

#least dense families
leastDenseFamilies <- head(sortedFamilyMean, 8)
leastDenseFamilies


#Part III: Plotting
#make facet plot with families with most and least dense wood
#make new dataframe to plot that has only 16 families but all species

#DENSE 

#subset of all species from densest families
DensestWood.plot <- subsetWood %>%
  filter(Family %in% densestFamilies$Family)

#plot all species from densest families grouped by family
{Densest.plot <- ggplot(DensestWood.plot, aes(x = Binomial, y = meanDensity, group = Family)) +
      geom_boxplot() + facet_wrap(~Family, nrow = 2) +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank())
  Densest.plot 
}

#LEAST DENSE
#subset of all species from densest families
notDenseWood.toplot <- subsetWood %>%
  filter(Family %in% leastDenseFamilies$Family)

#plot all species from densest families grouped by family
{NoDensestWood.plot <- ggplot(notDenseWood.toplot, aes(x = Binomial, y = meanDensity, group = Family)) +
    geom_boxplot() + facet_wrap(~Family, nrow = 2) +
    theme(panel.border = element_blank(), panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(), axis.title.x=element_blank(),
          axis.text.x=element_blank(),
          axis.ticks.x=element_blank())
  NoDensestWood.plot
  }

# I can't get the boxplots to center in their facets
#nor can I get single points to be 


