
#question:1

#Loading the dataset into dataframe and naming it as london_crime
london_crime <- read.csv("london-crime-data.csv", na="")
#checking the structure of the data
 str(london_crime)
 
#Creating a new column Date and pasting the month and year variables with a separator '/' 
london_crime$Date <- paste(london_crime$month, london_crime$year, sep='/')
str(london_crime) 

#Adding a day element to the date column
converted_date <- paste("01", london_crime$month, london_crime$year, sep = "/")

#Checking the structure of the converted date
converted_date
str(london_crime)

#----------------------------------------------------------------------------------------------------------------------------------

#question: 2
#changing the column names from the requirements 
names(london_crime)
names(london_crime)[names(london_crime) == "borough"] <- "Borough"

names(london_crime)[names(london_crime) == "major_category"] <- "MajorCategory"
names(london_crime)[names(london_crime) == "minor_category"] <- "SubCategory"
names(london_crime)[names(london_crime) == "value"] <- "Value"
names(london_crime)[names(london_crime) == "Date"] <- "CrimeDate"


names(london_crime)
#keeping the required columns 
london_crime <- london_crime[c(2,3,4,5,8)]
london_crime

#Structure of the data frame
str(london_crime)
#--------------------------------------------------------------------------------------------------

#question:3

#changing the crime date variable as Date.
london_crime$CrimeDate <- as.Date(converted_date, "%d/%m/%Y")
str(london_crime)

#-------------------------------------------------------------------------------------------------
#question:4

#Plotting the crime data of borough using summary function 
london_crime$Borough <- factor(london_crime$Borough)
str(london_crime)
plot(london_crime$Borough)
summary(london_crime$Borough)

#attaching the dataframe to the plot grapgh
attach(london_crime) 

#setting the display and naming the title, X-axis and Y-axis.
display_settings <- par(no.readonly = TRUE)
plot(Borough, main = "Crime Data of Borough", xlab = "Borough Names", ylab = "Crimes Recorded" , border="red", col="blue")
summary.factor(Borough)

detach(london_crime)
# Highest Level of crime- CROYDON with 5226 crime occurrence
#Lowest Level of crime- CITY OF LONDON with 86 crime occurrence

#---------------------------------------------------------------------------------------------------------------------------------------
#Question: 5

#Plotting the pie graph by major category
#deriving the factors of it by major category
london_crime$MajorCategory <- factor(london_crime$MajorCategory)
attach(london_crime)
str(MajorCategory)

#showing the summary of the major category
summary(MajorCategory)
major_category <- summary(MajorCategory)

#Marking the title for the pie chart
pie(major_category,  main="The percentage of crime by major category")
detach(london_crime)
#-------------------------------------------------------------------------------------------------------------------------------
#question : 6
london_crime$Region[Borough == "Kingston upon Thames" | Borough == "Newham" | Borough == "Barking and Dagenham" | Borough == "Bexley" | Borough == "Greenwich" | Borough == "Havering"| Borough == "Redbridge" | Borough == "Wandsworth" ] <- "East"
london_crime$Region[Borough == "Barnet" | Borough == "Enfield" | Borough == "Hackney" | Borough == "Haringey" ] <- "North"
london_crime$Region[Borough == "Brent" | Borough == "Ealing" | Borough == "Hammersmith and Fulham" | Borough == "Harrow" | Borough == "Hillingdon" | Borough == "Hounslow" | Borough == "Richmond upon Thames"] <- "West"
london_crime$Region[Borough == "Bromley" | Borough == "Croydon" | Borough == "Merton" | Borough == "Sutton" ] <- "South"
london_crime$Region[Borough == "Islington" | Borough == "Kensington and Chelsea" | Borough == "Lambeth" | Borough == "Lewisham" | Borough == "Southwark" | Borough == "Waltham Forest" | Borough == "Tower Hamlets" | Borough == "Westminster" ] <- "Central"
#Checking for nulls
which(london_crime$MajorCategory == NA)
#City of london is nA so filling the values
london_crime$Region[Borough == "City of London"] <- "Central"

#----------------------------------------------------------
  #question: 7

london_crime$Region <- factor(london_crime$Region)
str(london_crime)
plot(london_crime$Region)
summary(london_crime$Region)

#highest one : Central
#least one : South
#----------------------------------------------------------------------------------------------


#question:8 
highest_crime_dataset <- subset(london_crime_modified, Region == "Central" )

lowest_crime_dataset <- subset(london_crime_modified, Region == "South" )
#---------------------------------------------------------------------------------------------------------------


#Question:9
opar <- par(no.readonly = TRUE)
par = opar

par(mfrow=c(1,2))
plot(highest_region$MajorCategory, main="Number Of Crimes Committed By Region")
plot(lowest_region$MajorCategory, main="Number Of Crimes Committed By Region")

graph_range <- range(0, 9000)
graph_range

par(mfrow=c(1,2))
plot(highest_region$MajorCategory, main="Category Of Crimes Committed In Central London", 
     ylab="# Of Crimes", xlab="Category Of Crime", las=3, ylim=graph_range)
plot(lowest_region$MajorCategory, main="Category Of Crimes Committed In South London", 
     ylab="# Of Crimes", xlab="Category Of Crime", las=3, ylim=graph_range)

#-----------------------------------------------------------------------------------------------------------------------------------------


#question 10
write.csv(london_crime,'london_crime.csv')


  
  








