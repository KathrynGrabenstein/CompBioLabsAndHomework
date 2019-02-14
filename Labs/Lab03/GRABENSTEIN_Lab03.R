 #Computational Biology
#Kathryn Grabenstein
#Lab 03 

#the goal of this lab is to explore R functions and throw the best party ever

#check working directory
getwd()
#looks good! Lets keep trucking

#clear variable list from previous analyses 
rm(list=ls()) 
# SMF: Good idea for sure!

#lab step #3
#Set variables
#you start off with 5 chip bags bc you ain't no scrub
chips <- 5
chips

#number of RSVPS, but let's be real, someone will probably bail
guests <- 8
guests

#lab step #4
#add comments, see above (but you know I already did this before)

#lab step #5
hunger <- 0.4
hunger

#lab step 6
#add comment for step #5

#lab step 7
#create equation for chip consumption
#guests plus me, times our hunger, subtracted from the number of chip bags we started with
leftovers <- chips - ((guests+1) * hunger)
leftovers 

#part II
#lab step #8
#rankings for movies per person. Side note: we shoud be allowed to add our OWN rankings for the self vector :)
self.ranking <- c(7,6,5,1,2,3,4)
self.ranking

penny.ranking <- c(5,7,6,3,1,2,4)
penny.ranking

jenny.ranking <- c(4,3,2,7,6,5,1)
jenny.ranking

lenny.ranking <- c(1,7,3,4,6,5,2)
lenny.ranking

stewie.ranking <- c(6,7,5,4,3,1,2)
stewie.ranking

#lab step #9
#indexing scores for Episode 4, whichi is the fourth element in the list
#index penny's score
PennyIV <- penny.ranking[4]
PennyIV

#index lenny's score for episode IV
LennyIV <- lenny.ranking[4]
LennyIV

#lab step #10
#concatenate everyone's rankings
StarWarsRankings <- cbind(self.ranking, penny.ranking, jenny.ranking, lenny.ranking, stewie.ranking)
StarWarsRankings

#lab step #11
#check structure of new object
str(StarWarsRankings)

#check structure of PennyIV
str(PennyIV)

#check structure of penny.rankings
str(penny.ranking)
# SMF: what do you notice about the differences between the objects?

#PennyIV is a single numerical element with the value 3, 
#penny ranking is a vector with 1 row and 7 rows,
#StarWardsRankings is a matrix with 7 rows and 5 columns


#lab step #12
#make data frame with star wars rankings with data.frame
#name rows
starwarsmovies <- c("I", "II", "III", "IV", "V", "VI", "VII")
#create data frame
StarWars.df <- data.frame(self.ranking, penny.ranking, jenny.ranking, lenny.ranking, stewie.ranking,
                          row.names =starwarsmovies)
StarWars.df 

#make dataframe with as.data.frame()
StarWars.df2 <- as.data.frame(StarWarsRankings)
StarWars.df2

#lab step #13
str(StarWars.df)
#the data frames are relational--they include observations of variables
#though I would have inverted the data frame's structure so the variables 
#along the top instead of down the side 

typeof(StarWars.df)
typeof(StarWarsRankings)
StarWarsRankings == StarWars.df

# SMF: what do you notice about the differences and similarities between the matrix and the 
# SMF: data frame?  E.g., double vs. list

#the dataframe is a list whereas the original matrix is a double. 
#the values and the structure of the two arrays are equivilent, which is a similarity.
#One difference is the way the data is encoded within the arrays. In the dataframe, values
#are categorized as floats, whereas in the matrix they are only lists, an ordered collection of components.

#lab step #14
# I already did this to make my data frame.... but here it is again
starwarsmovies <- c("I", "II", "III", "IV", "V", "VI", "VII")

#lab step #15
#I already did this.... see above, lines 86-88

#accessing elements of matrcies and data frames
#ROWS FIRST ( I always forget this )

#lab step #16
#access the third row from object list
StarWarsRankings[3,]

#lab step #17
#access the 4th column from the data frame
StarWars.df[,4]

#lab step #18
#access your ranking for episode V
StarWars.df[5,1]

#lab step #19
#access penny's ranking for episode II
StarWars.df[2,2]

#lab step #20
#access everyones rankings for IV-VI
StarWars.df[ (4:6), ]
# SMF: you don't need the "c" when using the colon operator

#lab step #21
#access everyones rankings for II, V, and VII
StarWars.df[ c(2,5,7), ]

#lab step #22
#access the rows for penny, jenny and stewie for episodes IV and VI
StarWars.df [ c(4,6), c(2:3,5) ]

#lab step #23
#switch lenny's ranks for episodes II and V
#store original ranking for episode II
tempLennyII <- StarWars.df[2,4] 
tempLennyII

#move ranking for episode V to episode II
StarWars.df[2,4]  <- StarWars.df[5,4]

#replace episode V slot with stored variable for episode II
StarWars.df[5,4] <- tempLennyII

#check switch
StarWars.df[,4]

#lab step #24
#for object from step #10
StarWarsRankings[3, "penny.ranking"]

#for df in step #12
StarWars.df["III", "penny.ranking"]

#are they the same?
StarWars.df["III", "penny.ranking"] == StarWarsRankings[3, "penny.ranking"]
#whooo! 

#step #25
#undo the switch
#switch lenny's ranks for episodes II and V
#store original ranking for episode II
tempLennyII.variable <- StarWars.df["II", "lenny.ranking"] 
tempLennyII.variable

#move ranking for episode V to episode II
StarWars.df["II", "lenny.ranking"] <- StarWars.df["V", "lenny.ranking"]

#replace episode V slot with stored variable for episode II
StarWars.df["V", "lenny.ranking"] <- tempLennyII.variable

#check switch
StarWars.df["lenny.ranking"]


#lab step #26
#re-do switch from step #23 with $ operator 
#store original ranking for episode II
templenny.dollar <- StarWars.df$lenny.ranking[2] 
templenny.dollar

#move ranking for episode V to episode II
StarWars.df$lenny.ranking[2] <- StarWars.df$lenny.ranking[5]

#replace episode V slot with stored variable for episode II
StarWars.df$lenny.ranking[5] <- templenny.dollar

#check switch
StarWars.df["lenny.ranking"]
