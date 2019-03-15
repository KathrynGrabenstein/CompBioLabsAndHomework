# Computational Biology
# Kathryn Grabenstein
# Lab Nine
#Parsing Data 

#set working directory
setwd("/Users/kathryngrabenstein/Documents/Classes/Computational Biology/CompBioLabsAndHomework/Labs/Lab09")
#check working directory
getwd ()

#import data
camData <- read.csv("Cusack_et_al_random_versus_trail_camera_trap_data_Ruaha_2013_14.csv", stringsAsFactors = F)

############

#Problem #1 
#Convert strings of Date/Time into time & date structures
#check structure of dataframe
str(camData)
#look at format of data
head(camData$DateTime)


FormatDate <- strptime(camData$DateTime, format = "%d/%m/%Y %H:%M")
FormatDate
#check structure
str(FormatDate)

#############

#Problem #2 
#figure out which data where not imported properly
#need to check %Y (4 digit year)
#need to convert to separate values bc currently read as one single imput
#need to access only year

#pull out only years from data/month/year
Years <- format(FormatDate, format = "%Y")
#convert string to numeric
Years <- as.numeric(Years)

#check structure of vector of only years 
str(Years)


#logical indexing into wrong format years
#id years where = 13
#is there a way to do this witout using magic numbers? i.e. measuring length or sum?
#show index locations where lines need to change 
wrongYears <- which(Years == 13)
wrongYears
length(wrongYears)

#use logicial indexing to show full lines that need to change 
needChangeYears <- FormatDate[wrongYears] 
head(needChangeYears)

###########
#Problem #3
#create a vector of dates and times that are correct
RawDateTime <- camData$DateTime 
twoYearFormat <- RawDateTime[wrongYears]


#assign two year format to logical index of lines with 2 year formats
FormatDate.twoYear  <- strptime(twoYearFormat, format = "%d/%m/%y %H:%M")
head(FormatDate.twoYear)

#replace values in FormatDate with indexes from Wrong years with values from FormatDate
CompleteDateTime <- replace(FormatDate, wrongYears, FormatDate.twoYear)

#check that wroks
CompleteDateTime[498]
