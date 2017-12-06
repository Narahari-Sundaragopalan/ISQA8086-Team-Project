## TASK-1 Description of the data source with citation

It’s the complete dataset for the 500 Cities project,available from data.gov.It includes 2013, 2014 model-based small area estimates 
for 27 measures of chronic disease related to unhealthy behaviors (5), health outcomes (13), and use of
preventive services (9). It also includes estimates for approximately 28,000 census tracts within 
500 largest US cities. It includes 21 variables and 810103 observations.
Currently, we are using the dataset with respect to the year 2013 and have seperated the original dataset containing years 2013 and 2014 into the 2013 and has 116025 observations and 13 variables that need to be cleaned for better data evaluation and analysis. Due to the reason that we are not doing census tract analysis based on the population count, the variable Low confidence limit, High confidence limit have been removed .

Variables include: 
* Year
* StateDesc
* CityName
* CategoryLevel
* Measure
* Data value Type
* Data Value
* Data Value Footnote
* Population Count
    
    This dataset is significant to identity emerging health problems and provide information for disease
prevention activities.
    
    Note: We tend to chose the dataset corresponding to the year 2013 and then try to document the cleaning of data.



**Reference and Citation for Data Source**

    500 Cities: Local Data for Better Health. (2016, December 07). Retrieved October 14, 2017, from https://catalog.data.gov/dataset/500-cities-local-data-for-better-health-b32fd


## TASK-2 Specifically identify any intellectual policy constraints, or lack thereof (licensing)

 This is an open database intended for public use. Open Database License(ODbL). The details of its usage and availability are as follows:

 The Open Database License (ODbL) is a license agreement intended to allow users to freely
share, modify, and use this Database while maintaining this same freedom for others.
The Open Database License (ODbL) is a license agreement intended to allow users to freely
share, modify, and use this Database while maintaining this same freedom for others. Many
databases are covered by copyright, and therefore this document licenses these rights. Some
jurisdictions, mainly in the European Union, have specific rights that cover databases, and so the
ODbL addresses these rights, too. Finally, the ODbL is also an agreement in contract for users of
this Database to act in certain ways in return for accessing this Database.

 Databases can contain a wide variety of types of content (images, audiovisual material, and
sounds all in the same database, for example), and so the ODbL only governs the rights over the
Database, and not the contents of the Database individually. Licensors should use the ODbL
together with another license for the contents, if the contents have a single set of rights that
uniformly covers all of the contents. If the contents have multiple sets of different rights,
Licensors should describe what rights govern what contents together in the individual record or
in some other way that clarifies what rights apply.

 Sometimes the contents of a database, or the database itself, can be covered by other rights not
addressed here (such as private contracts, trade mark over the name, or privacy rights / data
protection rights over information in the contents), and so you are advised that you may have to
consult other documents or clear other rights before doing activities not covered by this License.
https://opendatacommons.org/licenses/odbl/1.0/

## TASK-3 Description of Metadata and Purpose of Project

1. This is the complete dataset for the 500 Cities project. This dataset includes 2013, 2014 model-based small area estimates for 27 measures of chronic disease related to unhealthy behaviors (5), health outcomes (13), and use of preventive services (9). Data were provided by the Centers for Disease Control and Prevention (CDC), Division of Population Health, Epidemiology and Surveillance Branch. The project was funded by the Robert Wood Johnson Foundation (RWJF) in conjunction with the CDC Foundation. 

2. It represents a first-of-its kind effort to release information on a large scale for cities and for small areas within those cities. It includes estimates for the 500 largest US cities and approximately 28,000 census tracts within these cities. These estimates can be used to identify emerging health problems and to inform development and implementation of effective, targeted public health prevention activities.

3. Because the small area model cannot detect effects due to local interventions, users are cautioned against using these estimates for program or policy evaluations. Data sources used to generate these measures include Behavioral Risk Factor Surveillance System (BRFSS) data (2013, 2014), Census Bureau 2010 census population data, and American Community Survey (ACS) 2009-2013, 2010-2014 estimates. More information about the methodology can be found at www.cdc.gov/500cities.

**Purpose of the Project**

1. "This project reports city and census tract-level data, obtained using small area estimation methods, for 27 chronic disease measures for the 500 largest American cities.
2. The data are published through a public, interactive “500 Cities” website that allows users to view, explore, and download city- and tract-level data.
3. Although limited data are available at the county and metropolitan levels, this project represents a first-of-its kind data analysis to release information on a large scale for cities and for small areas within cities. This system complements existing surveillance data necessary to more fully understand the health issues affecting the residents of that city or census tract.

These high-quality, small-area epidemiologic data can be used both by individual cities and groups of cities as well as other stakeholders to help develop and implement effective and targeted prevention activities; identify emerging health problems; and establish and monitor key health objectives. For example, city planners and elected officials may want to use this data to target neighborhoods with high rates of smoking or other health risk behaviors for effective interventions."(n.d.500 Cities: Local Data for Better Health.)

500 Cities Map is available ![here](https://www.cdc.gov/500cities/images/Top500Cities.png)


**_Reference_**: 

    500 Cities: Local Data for Better Health. (2016, December 07). Retrieved October 14, 2017, from https://www.cdc.gov/500cities/about.htm
    
## TASK-4 Issues encountered with data

1. **Data validity and relativeness** - The data being collected for understanding the health of 500 cities in Unites States is limited to entire United States, respective city and census tract levels to undersatnd the Health Outcomes and Prevention categories. 
Assuming the data with respect to 2013, the parameters are hence analyzed.

2. **Missing Values** - In the column CityName , DataValue , Data_Value_Footnote , PopulationCount has data range values having 'Blanks' that need to be filled with meaningful and reasonable datavalues that add meaning and value to the dataset and helps in efficient understanding of data.

3. **Unstandardized data** - The column UniqueID has data values '59', '107000' , '0107000-01073000100' etc. which doesn't follow a specified pattern or a clarity in naming the ID or providing definition for the ID. Moreover the value or ID details is not necessary. These need to be fized or deleted based on the mode of data cleaning and the goal of cleansing the data.

4. **Irrelevant data with respect to Data cleaning and Visualization Goals** - The column UniqueID is not necessary with respect to evaluation of data or the pre-determined research goals. So we chosse to delete the column. Also, the Data_Value_Unit which is in '%' can be deleted .The CityFIPS, TractFIPS, ShortQuestionText can be deleted

## TASK-5 Description of Rationale for Data Remediation

1.We have made our data research questions and goals clear and do not tend to chose the Census Data for tracting the Census values, instead we have limited data with respect to year 2013 and also eliminated the FIPS value.

2.Additionally, we have filled the missing data values for CityName , DataValue , Data_Value_Footnote each with 'NA' - _Not Applicable_ value and PopulationCount with 'Unknown' as those columns with the blank or unknown datavalue are not considered for ay sort of data analysis and doesn't provide much detail or clarity on visualization. Instead, naming them appropriately as NA or Unknown helps in rethinking in data collection ar analysis steps.

3.Also we have deleted the irrevelant or unnecessary column and double-checked for data duplicacies and their existence and ensure their validity with respect to the data evaluation. This also involved redefining and understanding the end-goals in the data cleaning thereby we have deleted the unstandardized data.

## TASK-6 Step-by-step Description of Data Cleaning Process for Replication

Below are the sequence of steps followed in cleaning the data:

As part of cleaning, we used R script and that helped in cleaning the data with respect to missing values, data anomalies, unstandardized values and entiry matching etc.

1. To get the current working directory:
**getwd()**

2. To set the working directory to the desired location:
**setwd("C:/Users/user/Desktop/ISQA8086-2 Adrea Wigins/")**

3. Loading the desired files to the data frame "data":
**data<-read.csv("500_Cities__Local_Data_for_Better_Health2013_Clean.csv", header = T , na.strings = c("", "NA"))**

4. To view the loaded data drame:
**view(data)**

5. To removed the unwanted columns from the loaded data frame and making a new data frame:
**clean_data<-subset(data, select = -c(6,8,11,12,13,18,19,20))**

6. Renaming the column "Data_Value" to Data_Value in %, as the entire column values reflect percentages:
**colnames(clean_data)[colnames(clean_data)=="Data_Value"]<-"Data_Value(in%)"**

7. Changing the "NA" values in "PopulationCount" Column to "Unknown" :
**clean_data[["PopulationCount"]][is.na(clean_data[["PopulationCount"]])] <- "Unknown"**

8. To view the top 6 rows of our working dataframe:
**head(clean_data)**

9. To view the entire dataframe:
**View(clean_data)**

10. To print the required table with set of arguments listed aboove for clean data:
**write.csv(clean_data, "500_Cities__Local_Data_for_Better_Health2013_Clean.csv")**

    Note: The initial dataset corresponding to the year 2013 with uncleaned data is available [here](https://github.com/Narahari-Sundaragopalan/ISQA8086-Team-Project/blob/master/RawDataSet/500CitiesLocalDataSetForBetterHealth2013.csv)
    and the Cleaned dataset for the 500 Cities dataset is also available [here](https://github.com/Narahari-Sundaragopalan/ISQA8086-Team-Project/blob/master/RawDataSet/CleanedDataSet500CitiesForBetterHealth2013.csv) for reference.
    
## Contributors
1. Venkata Sravani Kakaraparthi
2. Venkata Naga Sai Sriram Akella
3. Yanhe Wu
4. Narahari Sundaragopalan

