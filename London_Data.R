
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
london_crime$Region[london_crime$Borough == 'Barking and Dagenham'] <- 'East'
london_crime$Region[london_crime$Borough == 'Barnet'] <- 'North'
london_crime$Region[london_crime$Borough == 'Bexley'] <- 'East'
london_crime$Region[london_crime$Borough == 'Brent'] <- 'West'
london_crime$Region[london_crime$Borough == 'Bromley'] <- 'South'
london_crime$Region[london_crime$Borough == 'Camden'] <- 'North'
london_crime$Region[london_crime$Borough == 'Croydon'] <- 'South'
london_crime$Region[london_crime$Borough == 'Ealing'] <- 'West'
london_crime$Region[london_crime$Borough == 'Enfield'] <- 'North'
london_crime$Region[london_crime$Borough == 'Greenwich'] <- 'East'
london_crime$Region[london_crime$Borough == 'Hackney'] <- 'North'
london_crime$Region[london_crime$Borough == 'Hammersmith and Fulham'] <- 'West'
london_crime$Region[london_crime$Borough == 'Haringey'] <- 'North'
london_crime$Region[london_crime$Borough == 'Harrow'] <- 'West'
london_crime$Region[london_crime$Borough == 'Havering'] <- 'East'
london_crime$Region[london_crime$Borough == 'Hillingdon'] <- 'West'
london_crime$Region[london_crime$Borough == 'Hounslow'] <- 'West'
london_crime$Region[london_crime$Borough == 'Islington'] <- 'Central'
london_crime$Region[london_crime$Borough == 'Kensington and Chelsea'] <- 'Central'
london_crime$Region[london_crime$Borough == 'Kingston upon Thames'] <- 'East'
london_crime$Region[london_crime$Borough == 'Lambeth'] <- 'Central'
london_crime$Region[london_crime$Borough == 'Lewisham'] <- 'Central'
london_crime$Region[london_crime$Borough == 'Merton'] <- 'South'
london_crime$Region[london_crime$Borough == 'Newham'] <- 'East'
london_crime$Region[london_crime$Borough == 'Redbridge'] <- 'East'
london_crime$Region[london_crime$Borough == 'Richmond upon Thames'] <- 'West'
london_crime$Region[london_crime$Borough == 'Southwark'] <- 'Central'
london_crime$Region[london_crime$Borough == 'Sutton'] <- 'Central'
london_crime$Region[london_crime$Borough == 'Tower Hamlets'] <- 'South'
london_crime$Region[london_crime$Borough == 'Waltham Forest'] <- 'Central'
london_crime$Region[london_crime$Borough == 'Wandsworth'] <- 'East'
london_crime$Region[london_crime$Borough == 'Westminster'] <- 'Central'

#----------------------------------------------------------
  #question: 7
london_crime$Region <- factor(london_crime$Region)
str(london_crime)
plot(london_crime$Region)
summary(london_crime$Region)


  
  








