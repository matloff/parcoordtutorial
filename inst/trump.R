library(MASS)
library(freqparcoord)
#Path to the repo
elections <- read.csv("~/parcoordtutorial/data/2016-us-election/primary_results.csv")
county <-  read.csv("~/parcoordtutorial/data/2016-us-election/county_facts.csv")
trump <- which(elections$candidate == "Donald Trump")
trump_cnty <- county[trump,]
#Ignore NA in dataframe
trump_cnty <- na.omit(trump_cnty)

#Rename columns for clarity
colnames(trump_cnty)[12:18] <- c("White", "African American", "American Indian", "Asian", "Pacific Islander", "Mixed Race", "Hispanic")


parcoord(trump_cnty[,12:18],col=c("black","grey"), var.label=TRUE)
freqparcoord(trump_cnty[,12:18], m = 20, method = "maxdens")

#Getting the mean of columns
colMeans(trump_cnty[12:18])