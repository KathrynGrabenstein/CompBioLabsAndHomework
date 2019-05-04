#Kathryn Grabenstein
#Independent Project 
#Re-analysis of Firth et al. 2019

#set working directory
setwd("~/Documents/Classes/Computational Biology/CompBioLabsAndHomework/Assignments/Independent Project /Assignment09")

#get working directory
getwd()

## Load library
library(plyr)
library(ggplot2)
library(devtools) 
library(tidyverse)

#clear variables
rm(list=ls())

#Load Data
load("/Users/kathryngrabenstein/Documents/Classes/Computational Biology/CompBioLabsAndHomework/Assignments/Independent Project /Assignment09/visitation observations for dryad.RData")

#check data structure
head(obs.dryad)

#How many unique nest boxes do individuals visit? 
#list of unique individuals in dataset


#how many unique individuals?
#variable with unique PIT tag IDs, keep other columns in data frame
individuals <- unique(obs.dryad$PIT, keep)
length(individuals) #how long is this variable, i.e., how many inidividuals are there?
head(individuals)

#how many loggers?
loggers <- unique(obs.dryad$Unit)
length(loggers)
loggers <- as.factor(loggers)
class(loggers)

#these values are different from that noted in the publication: 73 v 74 loggers and 73  v 80 individuals, 
#however, this dataframe being analyzed is also 200 lines shorter than what is noted in the publication

#need to create dataframe where row is one individual, 
#with demographic info, and number of unique boxes visited

#unique combinations of PIT tags & RFID logger units
uniq.visit <- as.data.frame(distinct(obs.dryad, PIT, Unit, .keep_all = TRUE))
head(uniq.visit)

#count number of times each PIT appears
#this equals number of visits to a unique box
uniq.visit %>% #data frame piped
  count(PIT)  #to count the number of time each tag/unit combo appears
  
#count the number of individuals in this new data frame of unique combos to make sure it matches original count
uniq.visit.count <- count(uniq.visit, PIT)



#create dataframe with only unique pit tags but all demographic data

#merge dataframes to have dataframe with unique pit tags, 
#and number unique visits
all.info.visit.count <- merge(uniq.visit.count, uniq.visit, 
                              by.x = "PIT", by.y = "PIT" )

#remove duplicates from merged dataframe
all.info.visit.count.no.dup <- all.info.visit.count[!duplicated(all.info.visit.count$PIT), ]

#how many boxes do individuals visit on average?
mean.visits <- mean(all.info.visit.count.no.dup$n)
mean.visits

#subset juvenile male breeders
juv.m.breed <- subset(all.info.visit.count.no.dup, Age == "Juvenile" | Sex == "M" |  Breeding == "B")
  
#calc mean  
mean(juv.m.breed$n)

###########################

#subset adult male breeders
adult.m.breed <- subset(all.info.visit.count.no.dup, Age == "Adult" | Sex == "M" |  Breeding == "B")

#calc mean  
mean(adult.m.breed$n)

###########################

#subset juvenile male non-breeders
juv.m.non.breed <- subset(all.info.visit.count.no.dup, Age == "Juvenile" | Sex == "M" |  Breeding == "NB")

#calc mean  
mean(juv.m.non.breed$n)

###########################

#subset adult male non-breeders 
adult.m.non.breed <- subset(all.info.visit.count.no.dup, Age == "Adult" | Sex == "M" |  Breeding == "NB")
  
#calc mean  
mean(adult.m.non.breed$n)

###########################

#subset juvenile female breeders
juv.f.breed <- subset(all.info.visit.count.no.dup, Age == "Juvenile" | Sex == "F" |  Breeding == "B")

#calc mean
mean(juv.f.breed$n)

###########################

#subset adult female breeders
adult.f.breed <- subset(all.info.visit.count.no.dup, Age == "Adult" | Sex == "F" |  Breeding == "B")

#calc mean
mean(adult.f.breed$n)

###########################

#subset juvenile female non-breeders
juv.f.non.breed <- subset(all.info.visit.count.no.dup, Age == "Juvenile" | Sex == "F" |  Breeding == "NB")
  
#calc mean
mean(juv.f.non.breed$n)

###########################  
  
#subset adult female non-breeders 
adult.f.non.breed <-  subset(all.info.visit.count.no.dup, Age == "Adult" | Sex == "F" |  Breeding == "NB")

#calc mean
mean(adult.f.non.breed$n)
  
###########################


#replace 5 with juvenile & 6 with adult in age column
#replace 5 with juvenile
all.info.visit.count.no.dup$Age <- gsub("5", "Juvenile", all.info.visit.count.no.dup$Age )

#replace 6 with adult
all.info.visit.count.no.dup$Age <- gsub("6", "Adult", all.info.visit.count.no.dup$Age )



#create plot of number of unique visits to boxes by sex & breeding status
#option #1
{plot.uniq.visits <- ggplot(all.info.visit.count.no.dup, aes(x = Age, y = n)) }
{plot.uniq.visits + geom_boxplot(aes(fill = Breeding), varwidth = TRUE) +
                  facet_wrap(facets = ~Sex, scale = "free") +
                  xlab ("Age") +
                  geom_jitter(width = 0.2, height = 0.1) +
                  ylab("Number of unique boxes visited") +
                  theme_bw()}

#create dataframe with number of visits by each individual to each logger 
#(i.e., most visited box and how frequent visted)
obs.dryad %>%
  group_by(PIT) %>%
  mutate(count = n_distinct(Unit))
 
#count unique visits as individuals appear in record as rolling tally 
obs.dryad %>%
  group_by(PIT) %>%
  mutate(unique_box_number = !duplicated(Unit),
         unique_box_visits = cumsum(unique_box_number)) %>%
  select(unique_box_visits, PIT, Date, Unit, Sex, Age, Breeding) 
 

#############################

#What boxes do individuals prefer?
#assuming more visits equals greater preference

#how many times did an individaul visit each box?
#only count
#this is a messy figure but shows the spread of data and is not meant to be a "publication figure"
#shows only PIT id, not grouped in any way by demographic info
obs.dryad %>% 
  group_by(PIT, Unit) %>% 
  tally() %>%
  ggplot(aes(x = PIT, y = n)) +
           geom_point() +
          ylab("Number of visits to nest box") +
           theme(axis.text.x = element_text(angle = 90, hjust = 1))
  
#create dataframe with individuals containing demographic data so can add to other dataframes
individuals.demograph <- distinct(obs.dryad, PIT, .keep_all = TRUE) 

#replace age codes as before to meaningful code instead of number
individuals.demograph$Age <- gsub("5", "Juvenile", individuals.demograph$Age )

#replace 6 with adult
individuals.demograph$Age <- gsub("6", "Adult",  individuals.demograph$Age )


#what was the most visited box per PIT tag?
#graph number of visits to preferred box by age, sex, & breeding status
#do breeders visit preferred box more or less than non-breeders?
obs.dryad %>% 
  group_by(PIT, Unit) %>% 
  tally() %>%
  filter(n == max(n)) %>%
  inner_join(individuals.demograph, by = "PIT") %>%
  ggplot(aes(x = Age, y = n)) +
  geom_boxplot(aes(fill = Breeding), varwidth = TRUE) +
  facet_wrap(facets = ~Sex, scale = "free") +
  xlab ("Age of Individual") +
  ylab("Number of visits to preferred box") +
  geom_jitter() +
  theme_bw()
  
#do breeders breed in their most-visited (i.e., preferred box?)
#this contains only breeders, no non-breeders
#breeders that breed in their preferred boxes

#graph visits to preferred boxes by breeders that breed in preferred boxes
obs.dryad %>% 
  group_by(PIT, Unit) %>% 
  tally() %>%
  filter(n == max(n)) %>%
  inner_join(individuals.demograph, by = "PIT") %>%
  filter(Breeding == "B") %>%
  mutate(Pref_is_Breed = if_else(Unit.x == breuni, "PiB", "PinB")) %>%
  ggplot(aes( x = Age, y = n)) +
  facet_wrap(facets = ~Sex, scale = "free") +
  geom_boxplot(aes(fill=Pref_is_Breed)) +
  ylab("Number of visits to preferred box") +
  scale_fill_discrete(name = "Preferred Box", labels = c("Breeding Box", "Non-Breeding box"))
  



