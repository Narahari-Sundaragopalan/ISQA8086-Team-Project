### Team Combat -- R Script for Data Visualization using R Plot

### ===============================================================
### This R Script is an addition to previous assignment's Data
### Preparation R Script and intends to create Data Visualization
### using R Plot and attempts to answer the Research Questions
### by providing visual interpretation
### ===============================================================

# Create a Data frame to read data from prepared CSV file
state_and_region <- read.csv("Updated_US_States_Regions_Health.csv")

# Removing unwanted Row value ("USA" incorrectly set as State)
mergedHealthOutcome_Prevention <- mergedHealthOutcome_Prevention[-8,]

# Create multiple data frames and merge them
a <- data.frame(mergedHealthOutcome_Prevention$Region)
b <- data.frame(mergedHealthOutcome_Prevention$Population_Health_Outcomes)
c <- data.frame(mergedHealthOutcome_Prevention$Population_Prevention_Category)
df <- data.frame(a,b,c)
df <- melt(df, id.vars = "mergedHealthOutcome_Prevention.Region")

# Create a Bar plot for Health Outcomes and Prevention Measures
ggplot(df, aes(x=reorder(mergedHealthOutcome_Prevention.Region, value), y=value/1000000, fill=variable)) + 
  geom_bar(stat = "identity") + scale_fill_manual(values = c("#303B41", "#00B2B9"), 
                                                  labels= c("Health Outcome", "Prevention Category")) + 
  xlab("Regions") + ylab("Population Affected (in Millions)") + ggtitle("Box Plot of Population Affected and Regions in the USA") + 
  theme(plot.title = element_text(hjust = 0.5)) + scale_x_discrete(labels = function(x) str_wrap(x, width=5))


# Create a new data frame to plot Health Outcomes and Prevention measures across the states of USA
measureStateRelation <- aggregate(state_and_region$ActualPopulation, 
                                  by=list(Measures = state_and_region$MeasureId, 
                                          State = state_and_region$StateDesc), 
                                  FUN=sum)

# Rename column to meaningful value
colnames(measureStateRelation)[3] <- "Affected_Population"

# Create a subset for High BP Health Outcome
measureBPHigh <- subset(measureStateRelation, Measures == 'BPHIGH')

# Remove unwanted columns and rows
measureBPHigh <- measureBPHigh[-45,]
measureBPHigh <- measureBPHigh[,-1]

# Transform rownames and column names to lower case for State mapping
colnames(measureBPHigh)[1] <- "state"
levels(measureBPHigh$state) <- tolower(levels(measureBPHigh$state))

# Install library for US states mapping
library(fiftystater)
library(mapproj)
data("fifty_states")

# Create plot depicting High BP Health Outcome across the states of USA
p <- ggplot(measureBPHigh, aes(map_id = state)) + geom_map(aes(fill=Percent_Affected_Population), map = fifty_states) + 
  expand_limits(x = fifty_states$long, y = fifty_states$lat) + coord_map() + 
  scale_x_continuous(breaks=NULL) + scale_y_continuous(breaks=NULL) + 
  labs(x="", y="") + theme(panel.background = element_blank()) 

p + scale_fill_gradient(low="#3f84f5", high = "#102e60", space = "Lab",  guide = "colourbar") + 
  ggtitle("State wise Distribution - Affected Population by High BP (in Percentage)") + theme(plot.title = element_text(hjust = 0.5))


# Convert column name to lower case in the main data frame
colnames(measureStateRelation)[2] <- "state"

# Create a subset for BP prevention measure
measureBPMed <- subset(measureStateRelation, Measures == 'BPMED')
measureBPMed <- measureBPMed[,-1]
measureBPMed <- measureBPMed[-45,]
levels(measureBPMed$state) <- tolower(levels(measureBPMed$state))

# Create a Plot depicting BP Prevention measure across the states of USA
vizMeasureBPMed <- ggplot(measureBPMed, aes(map_id = state)) + geom_map(aes(fill=Percent_Affected_Population), map = fifty_states) + 
  expand_limits(x = fifty_states$long, y = fifty_states$lat) + 
  coord_map() + scale_x_continuous(breaks=NULL) + 
  scale_y_continuous(breaks=NULL) + labs(x="", y="") + 
  theme(panel.background = element_blank())

vizMeasureBPMed + scale_fill_gradient(low="#3ff863", high = "#106921", space = "Lab",  guide = "colourbar") + 
  ggtitle("State wise Distribution - Prevention for High BP (in Percentage)") + theme(plot.title = element_text(hjust = 0.5))


# Create a subset for High Cholesterol Health Outcome
measureHighCholesterol <- subset(measureStateRelation, Measures == 'HIGHCHOL')

# Remove unwanted columns and rows
measureHighCholesterol <- measureHighCholesterol[,-1]
measureHighCholesterol <- measureHighCholesterol[-45,]
levels(measureHighCholesterol$state) <- tolower(levels(measureHighCholesterol$state))

# Create a plot to depict High Cholesterol across the states of USA
vizMeasureHighCholesterol <- ggplot(measureHighCholesterol, aes(map_id = state)) + geom_map(aes(fill=Percent_Affected_Population), map = fifty_states) + 
  expand_limits(x = fifty_states$long, y = fifty_states$lat) + 
  coord_map() + scale_x_continuous(breaks=NULL) + 
  scale_y_continuous(breaks=NULL) + labs(x="", y="") + 
  theme(panel.background = element_blank())

vizMeasureHighCholesterol +  scale_fill_gradient(low="#e86f7e", high = "#b9041a", space = "Lab",  guide = "colourbar") + 
  ggtitle("State wise Distribution - High Cholesterol (in Percentage)") + 
  theme(plot.title = element_text(hjust = 0.5))


# Create a subset for Cholesterol Screening Prevention Measure
measureCholesterolScreen <- subset(measureStateRelation, Measures == 'CHOLSCREEN')

# Remove unwanted columns and rows
measureCholesterolScreen <- measureCholesterolScreen[,-1]
measureCholesterolScreen <- measureCholesterolScreen[-45,]
levels(measureCholesterolScreen$state) <- tolower(levels(measureCholesterolScreen$state))

# Create a plot for depicting Cholesterol screening Prevention Measure across the states of USA
vizHighCholesterolPrevention <- ggplot(measureCholesterolScreen, aes(map_id = state)) + geom_map(aes(fill=Percent_Affected_Population), map = fifty_states) + 
  expand_limits(x = fifty_states$long, y = fifty_states$lat) + 
  coord_map() + scale_x_continuous(breaks=NULL) + 
  scale_y_continuous(breaks=NULL) + labs(x="", y="") + 
  theme(panel.background = element_blank())

vizHighCholesterolPrevention + scale_fill_gradient(low="#e6bcf0", high = "#990bbb", space = "Lab",  guide = "colourbar") + 
  ggtitle("State wise Distribution - Prevention for Cholesterol (in Percentage)") + 
  theme(plot.title = element_text(hjust = 0.5))











