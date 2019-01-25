#Kathryn Grabenstein
#Lab Two final problem
#Question to work through

#How could you, perhaps in multiple commands, 
#make a new data file that had (i) only columns 2-4, 
#(ii) the header row, and (iii) only the last 10 lines of data? 
#In other words, what commands could you issue to create a new .csv file 
#with 11 lines of data total and three columns total, 
#in which the top line should be the original headers, 
#and the other 10 lines should be the last 10 lines of the original data?

#take header, cut out first row, and add to new file 
cat PredPreyData.csv | head -n 1 | cut -f 2-4 -d , > PredPreyDataShort.csv

#take last 10 lines, cut out first row and append onto existing file after header
cat PredPreyData.csv | tail | cut -f 2-4 -d , >> PredPreyDataShort.csv

