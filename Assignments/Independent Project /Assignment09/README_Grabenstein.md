#  Nest box visitation variation in wild great tits

## Central Research Question
*How are demographic factors associated with nest box visitation variation in a cavity-nesting bird?*

## Introduction
The behaviors of individual birds prior to the breeding season influences their overall reproductive success. 
In cavity nesting birds that excavate their own cavities for breeding every year, individuals will often visit more than one site and excavate more than one cavity before choosing a single site to lay their eggs. 

However, understanding the mechanistic drivers for why individuals visit more than one location and how those drivers vary across demographic groups is poorly understood because tracking individuals continuously across time and space is logistically challenging, especially for large sample sizes. 

## Methods

### Data Sources:
Spatial, temporal and individual‐based differences in nest‐site visits and subsequent reproductive success in wild great tits
Josh A. Firth Brecht L. Verhelst Ross A. Crates Colin J. Garroway Ben C. Sheldon [https://doi.org/10.1371/journal.pone.0126373](https://onlinelibrary.wiley.com/doi/pdf/10.1111/jav.01740)

Data from: Spatial, temporal and individual-based differences in nest-site visits and subsequent reproductive success in wild great tits
Firth JA, Verhelst BL, Crates RA, Garroway CJ, Sheldon BC Dryad Digital Repository. [https://doi.org/10.5061/dryad.8nm8r6s](https://doi.org/10.5061/dryad.8nm8r6s)

### Brief description of methodology that produced the data
* The researchers temporarily captured wild great tits and outfitted them with passive-integrated transponder (PIT) tags. They took morphometric measurements from the banded birds and blood samples for sex assignment (since males and females look the same to the human eye)
* Nest boxes were outfitted with RFID antenna so that birds' PIT tags would be registered every time they visited a box
* Breeding was monitored in the boxes to assess lay date, number of eggs laid, and number of chicks hatched 

### Type of data in this data set
The data in this dataset comes in two files. They are bre.dryad which is an RData file containing breeding efforts by individuals. 
The second file is obs.dryad which contains recorded observations for individuals at nest boxes. 
This data file contains a row per individual per unit visited as well as the data the visit was recorded and various demographic attributes such as age, sex, and breeding status. 

#### Format of data  
Both data files are in .RData format and are directly downloaded from data dryad when the R code is run.

#### Size of data (i.e., megabytes, lines, etc.)
* *bre.dryad* this file is small (43 lines). It is 1kb in size and contains 43 rows with 10 variables. 
* *obs.dryad* this files is 28 kb in size and contains 3317 rows of 13 variables. 

### Goals of Firth *et al.* 2018: What the authors did 
Firth *et al.* 2019 sought to assess the drivers of nesting site visitation prior to and during the breeding season for Great Tits.
The authors utilized Radio-frequency Identification (RFID) technology to log individuals visitations to nest boxes within their population to assess the frequency and variation of visits to potential nesting sites across space and time.
These patterns were then related to demographic patterns to assess how individuals' characteristics drive nest site visits and whether these characteristics related to reproductive success following nesting site selection.
Overall, the goal of this paper was to assess the function and consequences of multiple nest site visits by looking at the pattern of nest site visits across demographic groups and how those spatiotemporal patterns related to breeding.

### What I did with the data
Using the original data in obs.dryad, I sought to reproduce the graphs from Firth *et al.* 2018. Following the general layout of their paper, I explored the following questions:

### Nest Box Visit Frequencies in Great Tits
*How many unique nest boxes do individuals visit? How does this vary with age, sex & breeding status?*
1. After importing the *obs.dryad* file, I first counted the unique PIT tags to assess the number of individuals in the dataset and if this matched the original publication. I did the same count for the RFID logger units.
2. Next, I created a dataframe of unique combinations of PIT tags & RFID loggers. This dataframe shows the number of visits to unique boxes for all invidiuals. I then counted the number of times each PIT appeared in this dataset to calculate the number of visits to unique boxes for each individual
3. I then merged this new dataframe containing individuals and the number of visits to unique boxes and merged it with the dataframe of PIT tags that contains each individuals demographic data (i.e., age, sex, breeding status) 
4. Prior to graphing, I cleaned up this merged dataframe to make Age classes biologically relevant (i.e., 5 -> Juvenile)
5. Lastly, I graphed visits to unique nest boxes by age, sex, & breeding status

*Note: I also conducted several other data manipulations to count the number of unique visits each individual had during the pre-breeding season, including counting each visit to each logger as a rolling tally per PIT tag* 

*What boxes do individuals prefer? Do breeders visit their preferred box more than non-breeders? Do breeders breed in their preferred box?*
1. First, I took the original dataframe (obs.dryad) and grouped it by unique combinations of PIT & RFID unit (like previously), counted these, and then graphed this data. This step is similar to the previous step 2, however here I graphed the raw data of all visits to all boxes by individual independent of any demographic groupings  
2. Next, I created a dataframe for unique individuals with their associated demographic attributes and again changed the original age codes to more biologically relevant factors
3. I then calculated the most visited box per individual and considered this their more preferred box. To do this, I took the original data obs.dryad, grouped it by unique combinations of PIT & RFID logger, counted the number of times these unique combinations appeared using tally(), and then filtered the entire tibble to only include the max count value. I then joined this tibble with the previously constructed dataframe containing all the demographic data for individuals.
4. This data was then graphed to show  how the number of visits to an individual's preferred nest box is related to age, sex, & breeding status.
5. Next, I subsetted this dataset to include only breeders and added a new column that assessed a conditional statement to see if breeders' most visited box equaled the box they bred in for that season.
6. Finally, I graphed the relationship between the number of visits to breeders' grouped by age & sex, and then colored by whether or not their preferred box was the box the breeders bred in for the season.

## Results
*How many unique nest boxes do individuals visit and how many times do they visit each box?*
I found that individuals visit an average of 5.5 unique boxes, however this number varies by demographic combinations. 

! [Number of Unique boxes visited per individual, not sorted by demographic factors](All_Boxes_All_Ind_NoDemo.png)

*How does this vary with age, sex & breeding status?*
I did not conduct any statistical analyses on how many boxes individuals visited other than summary statisitcs such as calculating means. I did find that juvenile male breeders had the highest average number of visits to unique nest boxes at 5.89, but I attach no statistical signficance to this value. 

Next, I graphed the number of unique boxes visited by individuals while grouping for demographic attributes. From a visual scan, breeding juvenile males visit far more unique boxes than any other demographic combination. Adult non-breeding females visit the fewest number of unique nest boxes and breeding adult males and females of both age classes visit roughly the same number of unique nest boxes.

! [Unique Boxes Visited by Demographic Attributes](UniqueVisitsbyDemo.png)

*Do breeders visit their preferred box more than non-breeders?* 
Based on a visual assessment that lacks any statistical weight, I found that breeding males & females visited their preferred box far more than non-breeding individuals. However, there is an interesting trend that adult non-breeding males have much more spread in the number of visits to their preferred box. Considering that these are non-breeding males, this pattern is interesting and suggests that potentially these males are sneaking on territories of other males to potentially engage in extra-pair copulations. This pattern does not hold in non-breeding females.

! [Number of visits to Preferred boxes](VisitstoPREFBox.png)

*Do breeders breed in their preferred box?*
I found from a visual scan of the graphed data that for all but one female breeder, regardless of age, their preferred box was the box they bred in. This pattern however, did not hold for males. For adult breeding males, several had preferred boxes that was not the box they bred in. Additionally, for males that preferred boxes they did not breed in, they visited these boxes more than males whose preferred boxes where also the boxes they bred in. This suggests that some adult breeding males may be visiting boxes other than their breeding box more often during their breeding season. This suggests that potentially males may be looking for extra-pair copulations by visiting other boxes more frequently than their own. However, given the lack of temporal resolution for these graphs, it is impossible to tell whether these visits acrued during the prospecting period or when females were laying eggs.

! [Breeders' numbers of  visits to their preferred box & if used for breeding](BreedinPREFbox.png)

## Conclusions
In conclusion, I found strong evidence for sex based differences in prospecting behavior in wild great tits. Across the board, males visited more unique boxes. Young breeding males visited their preferred box far more than any other age, sex & breeding class combination. Finally, adult breeding males often had preferred boxes that were not the boxes they bred in for that season. For these males, they visited their non-breeding box but preferred box more often than the males who bred in their preferred box. In tandem, these data suggest that seeking extra-pair copulations may be one potential driver of prospecting behavior in a cavity nesting bird.


