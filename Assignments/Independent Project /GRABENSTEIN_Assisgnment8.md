# Nest box visitation variation in wild great tits 

## Introduction
The behaviors of individual birds prior to the breeding season influences their overall reproductive success. 
In cavity nesting birds that excavate their own cavities every year, individuals will often visit more than one site and excavate more than one cavity before choosing a single site to lay their eggs. 
However,undering the mechanistic drivers for why individuals visit more than one location and how those drivers vary across demographic groups is poorly understood because tracking individuals continuously across time and space is logistically challenging, especially for large sample sizes. 

For my computational biology independent project, I will be analyzing the raw data from Firth *et al.* 2019 to assess the spatiotemporal variation in nest box visits based on varying demographic factors. 
Unlike in the paper, I will not be relating these visits to breeding data. 
My goal is to reproduce some of the graphs and analyses conducted by Firth *et al.* 2019 to practice analyzing RFID data and to conduct some of my own, new analyses.
Namely, I am interested in data manipulation and graphing, rather than statistical analyses and this project reflects those preferences.

Given that data are read as one line per visit, the computational challenge in this dataset analysis lies in collapsing the data into reads for one individual and then comparing across categories of demographic factors.
The overall objectives of this project are to:
1. Practice summarizing RFID data by individual
2. Comparing RFID visits across time by demographic groupings (i.e., age & sex)
3. Graph nest box visits across time based on demographic groupings
*Note: I would like to be able to include the spatial component in these analyses but there is no location information for boxes, so I cannot given the data available*

In tandem, these objectives will contribute to exploring how demographic factors contribute to how often, when, and where individuals visit potential nesting site throughout the breeding. This will offer insight into the mechanisms driving multiple nest site visits for breeding birds.

<hr>

## Summary of Data to be Analyzed

### Goals of Firth *et al.* 2019
Firth *et al.* 2019 sought to assess the drivers of nesting site visitation prior to and during the breeding season for Great Tits.
The authors utilized Radio-frequency Identification (RFID) technology to log individuals visitations to nest boxes within their population to assess the frequency and variation of visits to potential nesting sites across space and time.
These patterns were then related to demographic patterns to assess how individuals' characteristics drive nest site visits and whether these characteristics related to reproductive success following nesting site selection.
Overall, the goal of this paper was to assess the function and consequences of multiple nest site visits by looking at the pattern of nest site visits across demographic groups and how those spatiotemporal patterns related to breeding.


### Brief description of methodology that produced the data
* The researchers temporarily captured wild great tits and outfitted them with passive-integrated transponder (PIT) tags. They took morphometric measurements from the banded birds and blood samples for sex assignment (since males and females look the same to the human eye)
* Nest boxes were outfitted with RFID antenna so that birds' PIT tags would be registered every time they visited a box
* Breeding was monitored in the boxes to assess lay date, number of eggs laid, and number of chicks hatched 


### Type of data in this data set: 
The data in this dataset comes in two files. They are bre.dryad which is an RData file containing breeding efforts by individuals. 
The second file is obs.dryad which contains recorded observations for individuals at nest boxes.

#### Format of data  
Both data files are in .RData format and are directly downloaded from data dryad when the R code is run.

#### Size of data (i.e., megabytes, lines, etc.)
* *bre.dryad* this file is small (43 lines). It is 1kb in size and contains 43 rows with 10 variables. 
* *obs.dryad* this files is 28 kb in size and contains 3317 rows of 13 variables. 

#### Any inconsistencies in the data files?  Anything that looks problematic?  
* *bre.dryad* this dataset is small and nothing looks problematic after a quick skim with the eye
* *obs.dryad* this dataset is considerably larger than the first but after a rough plotting of number of visits by breeder v. non-breeders, the graph matches that in the publication. 

#### What the data represent about the biology? 
* *bre.dryad* represents nesting efforts by individuals with ID tag, sex, age, breeding box number, lay date, # eggs, # chicks and various size measures. This file represents breeding efforts by bird in the study population.
* *obs.dryad* contains each visit to nest boxes that was recorded during the pre-breeding season. Each row is a unique visit. 


<hr>

## Detailed Description of Analysis to be Done and Challenges Involved

### Visiting frequencies 
*How many unique nest boxes do individuals visit? How does this vary with age, sex & breeding status?*
1. Using the *obs.dryad* file, I will first tally the number of visits to unique boxes for each individual 
2. I will then assess the relationship between unique nest boxes visited by an individual and its age, sex, and breeding status.
3. I will graph visits to unique nest boxes by age, sex, & breeding status

*What boxes do individuals prefer?*
1. I will calculate the preferred box for each individual based on the number of days it was visited (more visits = more preferred).
2. I will then graph how the number of visits to an individual's preferred nest box is related to age, sex, & breeding status (i.e., do breeders visit their preferred box more often than non-breeders?)

<hr>

## References 

Spatial, temporal and individual‐based differences in nest‐site visits and subsequent reproductive success in wild great tits
Josh A. Firth Brecht L. Verhelst Ross A. Crates Colin J. Garroway Ben C. Sheldon [https://doi.org/10.1371/journal.pone.0126373](https://onlinelibrary.wiley.com/doi/pdf/10.1111/jav.01740)

Data from: Spatial, temporal and individual-based differences in nest-site visits and subsequent reproductive success in wild great tits
Firth JA, Verhelst BL, Crates RA, Garroway CJ, Sheldon BC Dryad Digital Repository. [https://doi.org/10.5061/dryad.8nm8r6s](https://doi.org/10.5061/dryad.8nm8r6s)