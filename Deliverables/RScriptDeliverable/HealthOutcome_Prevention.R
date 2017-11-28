
### Team Combat R Script ###

### =============================================================================
### This R Script divides the States' Health Data into 5 specific Regions &
### creates a corelation between Health Outcomes and the corresponding 
### Prevention Measures taken for each Region
### Using the correlation it plots a linear regression plot between
### Health Outcomes and Prevention Measures for each Region
### This script is the first step towards exploratory analysis and
### attempts to answer the Research Questions raised in previous Assignments
### =============================================================================

# Loading the Library
library(readr)

# Setting the Working Directory for the R Script
setwd('/Users/naru/ISQA8086/Team_Project/ISQA8086-Team-Project/Deliverables/RScriptDeliverable')

# Read the CSV file into a new data frame
categoryDistribution <- read.csv('8086rscript.csv')

# View the data frame
View(categoryDistribution)

# Rename Column to a meaningful name
colnames(categoryDistribution)[8] <- "Data_Value_in_percentage"

# Make the column Numeric to carry out aggregation functions
categoryDistribution$Data_Value_in_percentage <- as.numeric(categoryDistribution$Data_Value_in_percentage)
categoryDistribution$PopulationCount <- as.numeric(categoryDistribution$PopulationCount)

# Calculate the Actual Population Count Value from the Data Value Column and Population Column
categoryDistribution$ActualPopulation <- (categoryDistribution$Data_Value_in_percentage*categoryDistribution$PopulationCount*0.01)

# Insert a new Column named Region and categorize states into different Regions ("South", "West", "Midwest", "Northeast", "USA")
categoryDistribution$Region[categoryDistribution$StateDesc %in% c("Connecticut","Maine",
                                                                  "Massachusetts", "New Hampshire", 
                                                                  "Rhode Island", "Vermont")] <- "New England"

categoryDistribution$Region[categoryDistribution$StateDesc %in% c("New Jersey", "New York", 
                                                                  "Pennsylvania")] <- "Middle Atlantic"

categoryDistribution$Region[categoryDistribution$StateDesc %in% c("Illinois", "Indiana", 
                                                                  "Michigan", "Ohio", 
                                                                  "Wisconsin")] <- "East North Central"


categoryDistribution$Region[categoryDistribution$StateDesc %in% c("Iowa", 
                                                                  "Kansas", "Minnesota", 
                                                                  "Missouri", "Nebraska", 
                                                                  "North Dakota", "South Dakota")] <- "West North Central"

categoryDistribution$Region[categoryDistribution$StateDesc %in% c("Delaware", "Florida", 
                                                                  "Georgia", "Maryland", 
                                                                  "North Carolina", "South Carolina", 
                                                                  "Virginia", "District of Columbia", 
                                                                  "West Virginia")] <- "South Atlantic"


categoryDistribution$Region[categoryDistribution$StateDesc %in% c("Alabama", "Kentucky",
                                                                  "Mississippi", "Tennessee")] <- "East South Central"

categoryDistribution$Region[categoryDistribution$StateDesc %in% c("Arkansas", 
                                                                  "Louisiana", "Oklahoma", "Texas")] <- "West South Central"

categoryDistribution$Region[categoryDistribution$StateDesc %in% c("Arizona", "Colorado", "Idaho", 
                                                                  "Montana", "Nevada", "New Mexico", 
                                                                  "Utah", "Wyoming")] <- "Mountain"

categoryDistribution$Region[categoryDistribution$StateDesc %in% c("Alaska", 
                                                                  "California", "Hawaii", "Oregon", 
                                                                  "Washington")] <- "Pacific"

categoryDistribution$Region[categoryDistribution$StateDesc %in% c("United States")] <- "USA"


# View a Summary of the data frame after inserting the Region column
summary(categoryDistribution)

# Replace "NA" values with 0 in ActualPopulation Column
columnToChange <- categoryDistribution[, c("ActualPopulation")]
columnToChange[is.na(columnToChange)] <- 0
categoryDistribution[,c("ActualPopulation")] <- columnToChange
View(categoryDistribution)

# Create a subset of the original Data frame for Health Outcomes category
healthOutcomesCategory <- subset (categoryDistribution, Category == 'Health Outcomes')
View(healthOutcomesCategory)

# Perform a Sum of Health Outcomes for each Region 
sumofHealthOutcomesCategory <- aggregate(healthOutcomesCategory$ActualPopulation, 
                                         by = list(Region = healthOutcomesCategory$Region), 
                                         FUN=sum)

# Create a subset of the original data frame for Prevention category
preventionCategory <- subset(categoryDistribution, Category == 'Prevention')
View(preventionCategory)


# Perform a Sum of Prevention Measures for each Region
sumOfPreventionCategory <- aggregate(preventionCategory$ActualPopulation, 
                                     by = list(Region = preventionCategory$Region), 
                                     FUN=sum)


# Find the minimum of the Prevention Measures Category
minOfPreventionCategory <- sumOfPreventionCategory[which.min(sumOfPreventionCategory$x),]
minOfPreventionCategory
# Region        x
# 4    USA 7520.625

# Find the maximum of the Health Outcomes Category
maxOfHealthOutcomes <- sumofHealthOutcomesCategory[which.max(sumofHealthOutcomesCategory$x),]
maxOfHealthOutcomes
# Region        x
# 5   West 22796319


# Find the maximum of the Prevention Measures Category
maxOfPreventionCategory <-sumOfPreventionCategory[which.max(sumOfPreventionCategory$x),]
maxOfPreventionCategory
# Region        x
# 5   West 50414399

# Find the minimum of the Health Outcomes Category
minOfHealthOutcomes <- sumofHealthOutcomesCategory[which.min(sumofHealthOutcomesCategory$x),]
minOfHealthOutcomes
# Region        x
# 4    USA 3541.125

# Create a copy of the data frame to split a column and create a correlation
corelatedCategoryDistribution <- categoryDistribution
View(corelatedCategoryDistribution)

# Create a new column "HealthOutcomes" from existing column "Category"
corelatedCategoryDistribution$HealthOutcomes[corelatedCategoryDistribution$Category 
                                             %in% c("Health Outcomes", "Prevention")] <- corelatedCategoryDistribution$ActualPopulation

# Replace the count values in "HealthOutcomes" column to 0  where the category type is "Prevention"
columnToReplace <- corelatedCategoryDistribution[,c("HealthOutcomes")]
columnToReplace[corelatedCategoryDistribution$Category == "Prevention"] <- 0
corelatedCategoryDistribution[,c("HealthOutcomes")] <- columnToReplace


# Create a new column "Prevention" from existing column "Category"
corelatedCategoryDistribution$Prevention[corelatedCategoryDistribution$Category 
                                         %in% c("Health Outcomes", "Prevention")] <- corelatedCategoryDistribution$ActualPopulation

# Replace the count values in "Prevention" column to 0  where the category type is "Health Outcomes"
columnToReplace <- corelatedCategoryDistribution[, c("Prevention")]
columnToReplace[corelatedCategoryDistribution$Category == "Health Outcomes"] <- 0
corelatedCategoryDistribution[,c("Prevention")] <- columnToReplace

# View the updated data frame with corelated columns
View(corelatedCategoryDistribution)

# Perform a sum of Prevention measures for each region from the newly created column "Prevention"
sumOfPreventionByRegion <- aggregate(corelatedCategoryDistribution$Prevention, by = list(Region = corelatedCategoryDistribution$Region), FUN=sum)
View(sumOfPreventionByRegion)

# Perform a sum of Health Outcomes measures for each region from the newly create column "HealthOutcomes"
sumOfHealthOutcomesByRegion <- aggregate(corelatedCategoryDistribution$HealthOutcomes, by = list(Region = corelatedCategoryDistribution$Region), FUN=sum)
View(sumOfHealthOutcomesByRegion)

# Rename columns to appropriate names in the data frames
colnames(sumOfPreventionByRegion)[2] <- "Population_Prevention_Category"
colnames(sumOfHealthOutcomesByRegion)[2] <- "Population_Health_Outcomes"

# Merge the newly created data frames containing sum of population separated by Region
mergedHealthOutcome_Prevention <- merge(sumOfHealthOutcomesByRegion, sumOfPreventionByRegion)
View(mergedHealthOutcome_Prevention)

# Create a corelation between Health Outcomes and Prevention measures
cor_HealthOutcome_Prevention <- cor.test(mergedHealthOutcome_Prevention$Population_Health_Outcomes, 
                                         mergedHealthOutcome_Prevention$Population_Prevention_Category, 
                                         method = "pearson")

# Print corelation
cor_HealthOutcome_Prevention

# Pearson's product-moment correlation
# 
# data:  mergedHealthOutcome_Prevention$Population_Health_Outcomes and mergedHealthOutcome_Prevention$Population_Prevention_Category
# t = 48.663, df = 3, p-value = 1.911e-05
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
# 0.9899304 0.9999604
# sample estimates:
# cor 
# 0.9993672 

# In the output above, 
  # --> t is the t-test statistic value and equals 48.663
  # --> df is Degree of freedom and equals 3
  # --> p-value is significance level and equals 1.911e-05
  # --> Confidence interval is 95 %

# Install packages and load library for creating a linear regression plot
install.packages("ggpubr")
library(ggpubr)

# Create Linear Regression Plot
ggscatter(mergedHealthOutcome_Prevention, x = "Population_Health_Outcomes", 
          y = "Population_Prevention_Category", add = "reg.line", 
          conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson", 
          xlab = "Regional Health Outcome", ylab = "Regional Prevention")


