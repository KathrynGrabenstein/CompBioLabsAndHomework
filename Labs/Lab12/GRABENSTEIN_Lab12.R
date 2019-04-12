# Computational Biology
# Kathryn Grabenstein
# Lab Twelve (where did lab ten go?)
#More ggplot2 bc everyone loves graphing

#clear variables
rm(list=ls())

#install libaries for work 
library(dplyr)
library(ggplot2)

#set working directory
setwd("~/Documents/Classes/Computational Biology/CompBioLabsAndHomework/Labs/Lab12")

#check working directory
getwd()

#import data to plot
animals <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14 copy.csv")
head(animals)
str(animals)

#Problem #1 
#plot barplot of counts of animal visits
{animal.visits <- ggplot(animals, aes(x=Species)) + geom_bar()
  animal.visits
}

#Problem #2
#rotate ticks so they're readable
{animal.visits <- ggplot(animals, aes(x=Species)) + geom_bar() +
    theme(axis.text.x = element_text(angle=90, hjust = 1))
  animal.visits
}

#problem #3 
#flip the axis (check)
#sort species to most and least abundant 
#make count scale logrithmic (check)

#works for 2 of 3 conditions 
{animal.visits.invert <- ggplot(animals, aes(x = Species)) + geom_bar() +
    theme(axis.text.x = element_text(angle=90, hjust = 1)) +
    coord_flip() +
    scale_y_log10()
  
  animal.visits.invert
}

#doesn't work but here is my stab at it 
{animal.visits.invert <- ggplot(animals, aes(x = reorder(Species, count))) + geom_bar() +
    theme(axis.text.x = element_text(angle=90, hjust = 1)) +
    coord_flip() +
    scale_y_log10()
  
  animal.visits.invert
}

#make subset dataframe that contains counts of each species
count.animals <- tbl_df(animals)
Sorted.Animals <- count.animals %>% 
  group_by(Species) %>% 
  tally(sort = TRUE) %>%
  ungroup %>%
  as.data.frame()
head(Sorted.Animals)
class(Sorted.Animals)

{animal.visits.invert <- ggplot(Sorted.Animals, aes(x = reorder(Species, -n), y=n)) +
    geom_bar(stat = "identity") +
    theme(axis.text.x = element_text(angle=90, hjust = 1)) +
    coord_flip() +
    scale_y_log10()
  
  animal.visits.invert
}

