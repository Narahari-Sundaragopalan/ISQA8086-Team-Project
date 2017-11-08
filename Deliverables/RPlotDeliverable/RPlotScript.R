mergedHealthOutcome_Prevention <- mergedHealthOutcome_Prevention[-4,]
a <- data.frame(mergedHealthOutcome_Prevention$Region)
b <- data.frame(mergedHealthOutcome_Prevention$Population_Health_Outcomes)
c <- data.frame(mergedHealthOutcome_Prevention$Population_Prevention_Category)
df <- data.frame(a,b,c)
df <- melt(df, id.vars = "mergedHealthOutcome_Prevention.Region")
ggplot(df, aes(x=mergedHealthOutcome_Prevention.Region, y=value, fill=variable)) + geom_bar(stat = "identity") + scale_fill_manual(values = c("#303B41", "#00B2B9"), labels= c("Health Outcome", "Prevention Category")) + xlab("Regions") + ylab("Population Affected") + ggtitle("Box Plot of Population Affected and Regions in the USA") + theme(plot.title = element_text(hjust = 0.5))



measureStateRelation <- aggregate(state_and_region$ActualPopulation, by=list(Measures = state_and_region$MeasureId, State = state_and_region$StateDesc), FUN=sum)

View(measureStateRelation)
colnames(measureStateRelation)[3] <- "Affected_Population"
measureBPHigh <- subset(measureStateRelation, Measures == 'BPHIGH')
View(measureBPHigh)
measureBPHigh <- measureBPHigh[-45,]
measureBPHigh <- measureBPHigh[,-1]
colnames(measureBPHigh)[1] <- "state"
levels(measureBPHigh$state) <- tolower(levels(measureBPHigh$state))
View(measureBPHigh)

library(fiftystater)
library(mapproj)
data("fifty_states")

p <- ggplot(measureBPHigh, aes(map_id = state)) + geom_map(aes(fill=Affected_Population), map = fifty_states) + expand_limits(x = fifty_states$long, y = fifty_states$lat) + coord_map() + scale_x_continuous(breaks=NULL) + scale_y_continuous(breaks=NULL) + labs(x="", y="") + theme(panel.background = element_blank()) 
p + ggtitle("State wise Distribution - Affected Population by High BP") + theme(plot.title = element_text(hjust = 0.5))


colnames(measureStateRelation)[2] <- "state"
measureBPMed <- subset(measureStateRelation, Measures == 'BPMED')
measureBPMed <- measureBPMed[,-1]
measureBPMed <- measureBPMed[-45,]
levels(measureBPMed$state) <- tolower(levels(measureBPMed$state))
View(measureBPMed)

vizMeasureBPMed <- ggplot(measureBPMed, aes(map_id = state)) + geom_map(aes(fill=Affected_Population), map = fifty_states) + expand_limits(x = fifty_states$long, y = fifty_states$lat) + coord_map() + scale_x_continuous(breaks=NULL) + scale_y_continuous(breaks=NULL) + labs(x="", y="") + theme(panel.background = element_blank())
vizMeasureBPMed + scale_fill_gradient(low="#3d9556", high = "#25de58", space = "Lab",  guide = "colourbar") + ggtitle("State wise Distribution - Prevention for High BP") + theme(plot.title = element_text(hjust = 0.5))

measureHighCholesterol <- subset(measureStateRelation, Measures == 'HIGHCHOL')
measureHighCholesterol <- measureHighCholesterol[,-1]
View(measureHighCholesterol)
measureHighCholesterol <- measureHighCholesterol[-45,]
levels(measureHighCholesterol$state) <- tolower(levels(measureHighCholesterol$state))

vizMeasureHighCholesterol <- ggplot(measureHighCholesterol, aes(map_id = state)) + geom_map(aes(fill=Affected_Population), map = fifty_states) + expand_limits(x = fifty_states$long, y = fifty_states$lat) + coord_map() + scale_x_continuous(breaks=NULL) + scale_y_continuous(breaks=NULL) + labs(x="", y="") + theme(panel.background = element_blank())

vizMeasureHighCholesterol +  scale_fill_gradient(low="#c31e25", high = "#ee7e83", space = "Lab",  guide = "colourbar") + ggtitle("State wise Distribution - High Cholesterol") + theme(plot.title = element_text(hjust = 0.5))


measureCholesterolScreen <- subset(measureStateRelation, Measures == 'CHOLSCREEN')
measureCholesterolScreen <- measureCholesterolScreen[,-1]
measureCholesterolScreen <- measureCholesterolScreen[-45,]
View(measureCholesterolScreen)
levels(measureCholesterolScreen$state) <- tolower(levels(measureCholesterolScreen$state))

vizHighCholesterolPrevention <- ggplot(measureCholesterolScreen, aes(map_id = state)) + geom_map(aes(fill=Affected_Population), map = fifty_states) + expand_limits(x = fifty_states$long, y = fifty_states$lat) + coord_map() + scale_x_continuous(breaks=NULL) + scale_y_continuous(breaks=NULL) + labs(x="", y="") + theme(panel.background = element_blank())

vizHighCholesterolPrevention + scale_fill_gradient(low="#af7ac5", high = "#ebdef0", space = "Lab",  guide = "colourbar") + ggtitle("State wise Distribution - Prevention for Cholesterol") + theme(plot.title = element_text(hjust = 0.5))











